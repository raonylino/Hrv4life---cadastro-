import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hrv4life_flutter/src/modules/heart_bpm/heartBPM_controller.dart';
import 'package:iirjdart/butterworth.dart';

////CAPTURA DE DADOS E INICIALIZACAO////
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

// Função auxiliar para verificar se um valor está dentro de um intervalo
bool _isWithinRange(int value, int reference, double percentage) {
  double range = reference * percentage;
  return value >= reference - range && value <= reference + range;
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

      // 4. definir flash para ON e iniciar o fluxo de imagens
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
    setState(() {
      _processing = true; // Indica que estamos processando uma imagem
    });

    // torna o sistema ocupado
    // obter o valor médio da imagem
    double avg =
        image.planes.first.bytes.reduce((value, element) => value + element) /
            image.planes.first.bytes.length;

    measureWindow.removeAt(0);
    measureWindow.add(SensorValue(time: DateTime.now(), value: avg));

    if (widget.onRawData != null) {
      widget.onRawData!(
        // chama a função fornecida com a nova amostra de dados
        SensorValue(
          time: DateTime.now(),
          value: avg,
        ),
      );
    }

    // Resetando _processing após o processamento da imagem
    setState(() {
      _processing = false; // Redefine para false após o processamento
    });
  }

////PRE-PROCESSAMENTO (SUAVIZAÇÃO E VALIDACAO)////
  Future<void> preProcessamento(double value) async {
    // 1. Extract values and times from the measurement window
    List<double> values = measureWindow.map((e) => e.value.toDouble()).toList();
    List<double> times = measureWindow
        .map((e) => e.time.millisecondsSinceEpoch.toDouble())
        .toList();

    // 2. Apply cubic spline interpolation
    List<double> newTimes = [];
    double startTime = times.first;
    double endTime = times.last;
    int numPoints = 100; // Number of points for interpolation

    if (numPoints <= 0) {
      throw ArgumentError("numPoints deve ser maior que 0.");
    }

    for (int i = 0; i <= numPoints; i++) {
      double t = startTime + i * (endTime - startTime) / numPoints;
      newTimes.add(t);
    }

    List<double> interpolatedValues = splineInterp(times, values, newTimes, 1);

    // Update the measurement window with interpolated values
    for (int i = 0; i < measureWindow.length; i++) {
      measureWindow[i] = SensorValue(
          time: measureWindow[i].time, value: interpolatedValues[i]);
    }

    // 3. Min-Max Normalization
    double minValue = findMin(measureWindow.map((e) => e.value).toList());
    double maxValue = findMax(measureWindow.map((e) => e.value).toList());

    if (maxValue == minValue) {
      // Handle case where all values are the same
      for (int i = 0; i < measureWindow.length; i++) {
        measureWindow[i] = SensorValue(
            time: measureWindow[i].time, value: 0.001); // Normalized value
      }
    } else {
      for (int i = 0; i < measureWindow.length; i++) {
        double normalizedValue =
            (measureWindow[i].value - minValue) / (maxValue - minValue);
        if (!normalizedValue.isFinite) {
          normalizedValue = 0.0; // Ou algum outro valor padrão
        }
        measureWindow[i] = SensorValue(
            time: measureWindow[i].time,
            value: normalizedValue); // Normalized value
      }
    }

    // Apply low-pass and high-pass filters
    Butterworth butterworthLowpass = Butterworth();
    butterworthLowpass.lowPass(2, 30, 4);

    Butterworth butterworthHighpass = Butterworth();
    butterworthHighpass.highPass(2, 30, 0.4);

    for (int i = 0; i < measureWindow.length; i++) {
      double filteredSignalLowpass =
          butterworthLowpass.filter(measureWindow[i].value);
      double filteredSignal = butterworthHighpass.filter(filteredSignalLowpass);
      measureWindow[i] =
          SensorValue(time: measureWindow[i].time, value: filteredSignal);
    }

    // Update current BPM value
    if (interpolatedValues.isNotEmpty) {
      double lastValue = interpolatedValues.last;
      if (!lastValue.isFinite) {
        lastValue = 0.0; // Ou algum outro valor padrão
      }
      currentValue = lastValue.round();
      widget.onBPM(currentValue); // Call the callback with the new BPM value
    }
  }

  /// Cubic spline interpolation function
  List<double> splineInterp(
      List<double> x, List<double> y, List<double> xInterp, int boundaryType) {
    int n = x.length;
    int nInterp = xInterp.length;

    if (n < 2 || nInterp < 1) {
      throw ArgumentError(
          "Erro SplineInterp! Argumentos possuem dimensões erradas.");
    }

    List<double> yInterp = List.filled(nInterp, 0.0);

    List<double> a = List.filled(n, 0.0);
    List<double> b = List.filled(n, 0.0);
    List<double> d = List.filled(n, 0.0);
    List<double> h = List.filled(n, 0.0);

    // Compute intervals h and coefficients b
    for (int i = 0; i < n - 1; i++) {
      h[i] = x[i + 1] - x[i];
      b[i] = (y[i + 1] - y[i]) / h[i];
    }

    // Compute coefficients a and d
    List<double> alpha = List.filled(n, 0.0);
    List<double> l = List.filled(n, 1.0);
    List<double> mu = List.filled(n, 0.0);
    List<double> z = List.filled(n, 0.0);

    for (int i = 1; i < n - 1; i++) {
      alpha[i] = 3 * (b[i] - b[i - 1]);
    }

    for (int i = 1; i < n - 1; i++) {
      l[i] = 2 * (x[i + 1] - x[i - 1]) - h[i - 1] * mu[i - 1];
      mu[i] = h[i] / l[i];
      z[i] = (alpha[i] - h[i - 1] * z[i - 1]) / l[i];
    }

    List<double> c = List.filled(n, 0.0);
    for (int j = n - 2; j >= 0; j--) {
      c[j] = z[j] - mu[j] * c[j + 1];
      b[j] = (y[j + 1] - y[j]) / h[j] - h[j] * (c[j + 1] + 2 * c[j]) / 3;
      d[j] = (c[j + 1] - c[j]) / (3 * h[j]);
      a[j] = y[j];
    }

    // Perform interpolation
    for (int i = 0; i < nInterp; i++) {
      int j = n - 2;
      for (int k = 0; k < n - 1; k++) {
        if (xInterp[i] < x[k + 1]) {
          j = k;
          break;
        }
      }
      double dx = xInterp[i] - x[j];
      yInterp[i] = a[j] + b[j] * dx + c[j] * dx * dx + d[j] * dx * dx * dx;
    }

    return yInterp;
  }

  /// Find the minimum value in a list of doubles
  double findMin(List<double> values) => values.reduce((a, b) => a < b ? a : b);

  /// Find the maximum value in a list of doubles
  double findMax(List<double> values) => values.reduce((a, b) => a > b ? a : b);

////PROCESSAMENTO PRINCIPAL////
// 1.Função para calcular a média dos valores de uma lista
  double calculateAverage(List<double> values) {
    if (values.isEmpty) return 0;
    return values.reduce((a, b) => a + b) / values.length;
  }

// 2.Função para detectar picos
  void detectPeaks(List<SensorValue> measureWindow, List<int> rrIntervals,
      int lastBPM, HeartBPMController heartBPMController,
      {double minAmplitudePercentage = 0.9, int minDistance = 428}) {
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

    // Calcular média dos valores absolutos da segunda derivada
    double avgSecondDerivative =
        calculateAverage(secondDerivative.map((e) => e.abs()).toList());

    // Definir limiar adaptativo como uma porcentagem da média
    double minAmplitude = minAmplitudePercentage * avgSecondDerivative;

    // Detecção de picos
    int previousTimestamp = 0;
    for (int i = 1; i < secondDerivative.length - 1; i++) {
      // Verifica se a segunda derivada muda de sinal (de positivo para negativo)
      if (secondDerivative[i - 1] > 0 && secondDerivative[i] < 0) {
        // Critérios de seleção de picos
        bool isPeak = true;

        // Amplitude mínima (adaptativa)
        if (secondDerivative[i].abs() < minAmplitude) {
          isPeak = false;
        }

        // Distância mínima
        if (previousTimestamp != 0 &&
            measureWindow[i].time.millisecondsSinceEpoch - previousTimestamp <
                minDistance) {
          isPeak = false;
        }

        // Procurar máximo local na primeira derivada
        int maxIndex = i;
        for (int j = i - 1; j >= 0 && j >= i - 200; j--) {
          if (firstDerivative[j] > firstDerivative[maxIndex]) {
            maxIndex = j;
          } else {
            break; // Parar quando encontrar um valor menor
          }
        }

        // Registrar o pico se o máximo local for encontrado e atender aos critérios
        if (isPeak && maxIndex != i) {
          int currentTimestamp =
              measureWindow[maxIndex].time.millisecondsSinceEpoch;
          int rrInterval = currentTimestamp - previousTimestamp;
          print(
              "Pico detectado em $currentTimestamp, intervalo RR: $rrInterval");

          // Filtragem de intervalos espúrios
          bool isValidInterval = rrInterval >= 428 && rrInterval <= 1500;
          if (isValidInterval && rrIntervals.isNotEmpty) {
            if (rrIntervals.length == 1) {
              isValidInterval = _isWithinRange(rrInterval, rrIntervals[0], 0.3);
            } else if (rrIntervals.length >= 10) {
              int avgPreviousIntervals = (rrIntervals[rrIntervals.length - 1] +
                      rrIntervals[rrIntervals.length - 2]) ~/
                  2;
              isValidInterval =
                  _isWithinRange(rrInterval, avgPreviousIntervals, 0.3);
            }
          }

          // Atualizar o último timestamp
          previousTimestamp = currentTimestamp;
        }
      }
    }

    //3. Cálculo da frequência cardíaca
    if (rrIntervals.isNotEmpty) {
      // Calcula a frequência cardíaca com base no último intervalo RR
      int currentBPM = (60000 / rrIntervals.last).round();
      // Atualiza o valor da frequência cardíaca no controlador
      heartBPMController.updateCurrentValue(currentBPM);
    }
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
