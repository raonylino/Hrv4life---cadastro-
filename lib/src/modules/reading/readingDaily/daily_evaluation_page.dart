import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hrv4life_flutter/src/constants/app_assets.dart';
import 'package:hrv4life_flutter/src/constants/app_colors.dart';
import 'package:hrv4life_flutter/src/constants/app_text_styles.dart';
import 'package:hrv4life_flutter/src/constants/routes_assets.dart';
import 'package:hrv4life_flutter/src/modules/heart_bpm/heartBPM_controller.dart';
import 'package:hrv4life_flutter/src/modules/heart_bpm/heart_bpm.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class DailyEvaluationPage extends StatefulWidget {
  const DailyEvaluationPage({super.key});

  @override
  State<DailyEvaluationPage> createState() => _DailyEvaluationPageState();
}

class _DailyEvaluationPageState extends State<DailyEvaluationPage> {
  List<SensorValue> data = [];
  List<SensorValue> bpmValues = [];
  //  Widget chart = BPMChart(data);
  bool isBPMEnabled = false;
  Widget? dialog;

  @override
  Widget build(BuildContext context) {
    HeartBPMController heartBPMController = GetIt.instance<HeartBPMController>();


    final sizeOF = MediaQuery.sizeOf(context);
    isBPMEnabled = true;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        alignment: Alignment.center,
        height: sizeOF.height,
        width: sizeOF.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 84),
              child: Text(
                'Avaliação Diária',
                style: TextStyle(
                  color: AppColors.primaryLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: TextStyles.instance.secondary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                height: sizeOF.height * 0.15,
                width: sizeOF.width * 0.8,
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 5.0)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.favorite,
                            ),
                          ),
                          Text(
                          '${heartBPMController.currentValue} bpm',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            fontFamily: TextStyles.instance.primary,
                          ),
                                                      ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          alignment: Alignment.topCenter,
                          height: sizeOF.height * 0.12,
                          width: sizeOF.width * 0.8,
                          child: Transform.scale(
                            scale: 3.0,
                            child: Lottie.asset(
                              AppAssets.pulseHeart,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.deepOrange.shade50,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Example 16
                      SimpleCircularProgressBar(
                        size: 130,
                        backColor: Colors.deepOrange.shade100,
                        progressColors: const [
                          AppColors.primaryLight,
                          AppColors.primaryPure,
                          AppColors.primary,
                        ],
                        fullProgressColor: AppColors.primaryLight,
                        mergeMode: true,
                        animationDuration: 20,
                        onGetText: (double value) {
                          return Text(
                            '${value.toInt()}%',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: TextStyles.instance.primary,
                            ),
                          );
                        },
                      ),
                    ])),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Medida em andamento...',
                style: TextStyle(
                  color: AppColors.positiveDark,
                  fontFamily: TextStyles.instance.secondary,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Mantenha o dedo na câmera \naté a leitura ser concluída',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontFamily: TextStyles.instance.secondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            isBPMEnabled
                ? dialog = Container(
                    height: 107,
                    width: 107,
                    alignment: Alignment.bottomCenter,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.green)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HeartBPMDialog(
                          context: context,
                          showTextValues: false,
                          borderRadius: 50,
                          cameraWidgetHeight: 75,
                          cameraWidgetWidth: 75,
                          onRawData: (value) {
                            setState(() {
                              if (data.length >= 100) data.removeAt(0);
                              data.add(value);
                            });
                            // chart = BPMChart(data);
                          },
                          onBPM: (value) => setState(
                            () {
                              if (bpmValues.length >= 100) {
                                bpmValues.removeAt(0);
                              }
                              bpmValues.add(SensorValue(
                                value: value.toDouble(),
                                time: DateTime.now(),
                              ));
                            },
                          ),
                          // sampleDelay: 1000 ~/ 20,
                          // child: Container(
                          //   height: 50,
                          //   width: 100,
                          //   child: BPMChart(data),
                          // ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.favorite_rounded),
                      label: Text(
                          isBPMEnabled ? "Stop measurement" : "Measure BPM"),
                      onPressed: () => setState(() {
                        if (isBPMEnabled) {
                          isBPMEnabled = false;
                          // dialog.
                        } else {
                          isBPMEnabled = true;
                        }
                      }),
                    ),
                  ),
            SizedBox(
              height: sizeOF.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 40,
                    width: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.primaryLight),
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.popAndPushNamed(
                            context, RoutesAssets.readingHome);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      label: Text(
                        'Cancelar',
                        style: TextStyle(
                          color: AppColors.primaryLight,
                          fontFamily: TextStyles.instance.secondary,
                          fontSize: 14,
                        ),
                      ),
                      icon: const Icon(
                        color: AppColors.primaryLight,
                        Icons.cancel,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 40,
                    width: 147,
                    child: ElevatedButton.icon(
                      onPressed: () {
                
                        
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                      ),
                      label: Text(
                        'Como medir ?',
                        style: TextStyle(
                          color: AppColors.black,
                          fontFamily: TextStyles.instance.secondary,
                          fontSize: 12,
                        ),
                      ),
                      icon: const Icon(
                        color: AppColors.black,
                        Icons.help_outline_rounded,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
