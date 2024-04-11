import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hrv4life_flutter/src/modules/heart_bpm/heartBPM_controller.dart';
// Modelo para armazenar o valor atual do BPM cardíaco

/// Classe para armazenar um ponto de dados de amostra
class SensorValue {
  /// timestamp do ponto de dados
  final DateTime time;

  /// valor do ponto de dados
  final double value; // Alterado para double

  SensorValue({required this.time, required num value})
      : value = value.toDouble(); // Convertido para double

  /// Retorna um ponto de dados mapeado em JSON
  Map<String, dynamic> toJSON() => {'time': time, 'value': value};

  /// Mapeia uma lista de amostras de [data] para um array formatado em JSON.
  static List<Map<String, dynamic>> toJSONArray(List<SensorValue> data) =>
      List.generate(data.length, (index) => data[index].toJSON());
}

/// Obtém batimentos cardíacos por minuto usando o sensor da câmera
// ignore: must_be_immutable
class HeartBPMDialog extends StatefulWidget {
  /// Este é o widget de carregamento
  final Widget? centerLoadingWidget;
  final double? cameraWidgetHeight;
  final double? cameraWidgetWidth;
  bool? showTextValues = false;
  final double? borderRadius;

  /// Callback usado para notificar o chamador da medição atualizada do BPM
  final void Function(int) onBPM;

  /// Callback usado para notificar o chamador dos dados brutos da amostra atualizada
  final void Function(SensorValue)? onRawData;

  /// Taxa de amostragem da câmera em milissegundos
  final int sampleDelay;

  /// Contexto pai
  final BuildContext context;

  /// Widget filho adicional para exibir
  final Widget? child;

  /// Obtém batimentos cardíacos por minuto usando o sensor da câmera
  HeartBPMDialog({
    super.key,
    this.centerLoadingWidget,
    this.cameraWidgetHeight,
    this.cameraWidgetWidth,
    this.showTextValues,
    this.borderRadius,
    required this.onBPM,
    this.onRawData,
    this.sampleDelay = 1000 ~/ 30, //DEFINIR QUANTOS FPS EM MS
    required this.context,
    this.child,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HeartBPPView createState() => _HeartBPPView();
}

class _HeartBPPView extends State<HeartBPMDialog> {
  HeartBPMController heartBPMController = GetIt.instance<HeartBPMController>();

  /// Controlador da câmera
  CameraController? _controller;

  /// Usado para definir a taxa de amostragem
  bool _processing = false;

  /// Valor atual
  int currentValue = 0;

  /// para garantir que a câmera foi inicializada
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  @override
  void dispose() {
    _deinitController();
    super.dispose();
  }

  /// Desinicializa o controlador da câmera
  void _deinitController() async {
    isCameraInitialized = false;
    if (_controller == null) return;
    await _controller!.dispose();
  }

  /// Inicializa o controlador da câmera
  Future<void> _initController() async {
    if (_controller != null) return;
    try {
      // 1. obter lista de todas as câmeras disponíveis
      List<CameraDescription> cameras = await availableCameras();

      // 2. atribuir a câmera preferida com baixa resolução e desabilitar o áudio
      _controller = CameraController(cameras.first, ResolutionPreset.low,
          enableAudio: false, imageFormatGroup: ImageFormatGroup.yuv420);

      // 3. inicializar a câmera
      await _controller!.initialize();

      // 4. definir a tocha para ON e iniciar o fluxo de imagens
      Future.delayed(const Duration(milliseconds: 500))
          .then((value) => _controller!.setFlashMode(FlashMode.torch));

      // 5. registrar o callback de streaming de imagens
      _controller!.startImageStream((image) {
        if (!_processing && mounted) {
          _processing = true;
          _scanImage(image);
        }
      });

      setState(() {
        isCameraInitialized = true;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  static const int windowLength = 50;
  final List<SensorValue> measureWindow = List<SensorValue>.filled(
      windowLength, SensorValue(time: DateTime.now(), value: 0),
      growable: true);

  void _scanImage(CameraImage image) async {
    // torna o sistema ocupado
    // obter o valor médio da imagem
    double avg =
        image.planes.first.bytes.reduce((value, element) => value + element) /
            image.planes.first.bytes.length;

    measureWindow.removeAt(0);
    measureWindow.add(SensorValue(time: DateTime.now(), value: avg));

    _smoothBPM(avg).then((value) {
      widget.onRawData!(
        // chama a função fornecida com a nova amostra de dados
        SensorValue(
          time: DateTime.now(),
          value: avg,
        ),
      );

      Future<void>.delayed(Duration(milliseconds: widget.sampleDelay))
          .then((onValue) {
        if (mounted) {
          setState(() {
            _processing = false;
          });
        }
      });
    });
  }

  Future<int> _smoothBPM(double newValue) async {


// 1. Suavização ZigZag
    for (int i = 2; i < measureWindow.length - 2; i++) {
      if ((measureWindow[i - 1].value < measureWindow[i].value &&
              measureWindow[i + 1].value < measureWindow[i].value) ||
          (measureWindow[i - 1].value > measureWindow[i].value &&
              measureWindow[i + 1].value > measureWindow[i].value)) {
        if ((measureWindow[i].value - measureWindow[i + 2].value).abs() < 7) {
          measureWindow[i] = SensorValue(
            time: measureWindow[i].time,
            value: (measureWindow[i - 1].value + measureWindow[i + 2].value) /
                2, // Média simples
          );
        }
      }
    }

// 2. Média Móvel Ponderada
    List<double> weights = [0.68, 0.35, 0.49, 0.16];
    for (int i = 0; i < measureWindow.length - 3; i++) {
      // -3 para cobrir os 4 pesos
      measureWindow[i] = SensorValue(
        time: measureWindow[i].time,
        value: weights[0] * measureWindow[i].value +
            weights[1] * measureWindow[i + 1].value +
            weights[2] * measureWindow[i + 2].value +
            weights[3] * measureWindow[i + 3].value,
      );
    }

// 4. Detecção de picos e cálculo da FC
    // Cálculo das derivadas
    List<double> firstDerivative = [];
    List<double> secondDerivative = [];
    for (int i = 1; i < measureWindow.length - 1; i++) {
      // Aproximação da primeira derivada
      firstDerivative
          .add((measureWindow[i + 1].value - measureWindow[i - 1].value) / 2);
      // Aproximação da segunda derivada
      secondDerivative.add(measureWindow[i + 1].value -
          2 * measureWindow[i].value +
          measureWindow[i - 1].value);
    }

    // Detecção de picos
    int _counter = 0;
    double _tempBPM = 0;
    int previousTimestamp = 0;

    // Definir valores para amplitude mínima e distância mínima
    double minAmplitude = 5.0;
    int minDistance = 428; // em milissegundos

    for (int i = 1; i < secondDerivative.length - 1; i++) {
      // Verifica se a segunda derivada muda de sinal (de positivo para negativo)
      if (secondDerivative[i - 1] > 0 && secondDerivative[i] < 0) {
        // Critérios de seleção de picos
        bool isPeak = true;

        // Amplitude mínima
        if (secondDerivative[i].abs() < minAmplitude) {
          isPeak = false;
        }

        // Distância mínima
        if (previousTimestamp != 0 &&
            measureWindow[i].time.millisecondsSinceEpoch - previousTimestamp <
                minDistance) {
          isPeak = false;
        }

        // Registro do pico e calculo de FC
        if (isPeak) {
          if (previousTimestamp != 0) {
            _counter++;
            _tempBPM += 60000 /
                (measureWindow[i].time.millisecondsSinceEpoch -
                    previousTimestamp);
          }
          previousTimestamp = measureWindow[i].time.millisecondsSinceEpoch;
        }
      }
    }
    currentValue = measureWindow[measureWindow.length - 1].value.toInt();
    heartBPMController.updateCurrentValue(currentValue);
    return currentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isCameraInitialized
          ? Column(
              children: [
                Container(
                  constraints: BoxConstraints.tightFor(
                    width: widget.cameraWidgetWidth ?? 100,
                    height: widget.cameraWidgetHeight ?? 130,
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 10),
                    child: _controller!.buildPreview(),
                  ),
                ),
                if (widget.showTextValues == true) ...{
                  Text(currentValue.toStringAsFixed(0)),
                } else
                  const SizedBox(),
                widget.child == null ? const SizedBox() : widget.child!,
              ],
            )
          : Center(
              child: widget.centerLoadingWidget ??
                  const CircularProgressIndicator(),
            ),
    );
  }
}
