import 'package:flutter/material.dart';
import 'package:hrv4life_core/hrv4life_core.dart';
import 'package:hrv4life_flutter/src/constants/app_colors.dart';
import 'package:hrv4life_flutter/src/constants/app_text_styles.dart';
import 'package:hrv4life_flutter/src/constants/routes_assets.dart';

class RegisterQuestion2Page extends StatefulWidget {
  const RegisterQuestion2Page({super.key});

  @override
  State<RegisterQuestion2Page> createState() => _RegisterQuestion2PageState();
}

class _RegisterQuestion2PageState extends State<RegisterQuestion2Page> with MessageViewMixin {
  bool isCheckedChronicle = false;
  bool isCheckedBad = false;
  bool isCheckedMoreOrLess = false;
  bool isCheckedGood = false;
  bool isCheckedPerfect = false;

  @override
  Widget build(BuildContext context) {
    final sizeOF = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              child: SizedBox(
                height: 2,
                child: LinearProgressIndicator(
                  value: .15,
                  minHeight: 10,
                  color: AppColors.secondaryBar,
                  backgroundColor: Colors.black12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: SizedBox(
                width: sizeOF.width * .8,
                child: Text(
                  'Sua Saúde',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: TextStyles.instance.primary,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Para personalizarmos a sua experiência com o aplicativo, precisamos saber quais são os seus objetivos e interesses',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: TextStyles.instance.secondary,
                ),
              ),
            ),
            SizedBox(
              height: sizeOF.height * 0.04,
            ),
            SizedBox(
              width: sizeOF.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  textAlign: TextAlign.center,
                  'Como você percebe a sua saúde?',
                  style: TextStyle(
                    color: AppColors.primaryPure,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: TextStyles.instance.secondary,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: sizeOF.width * .8,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Tenho doença crônica',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: TextStyles.instance.secondary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Checkbox(
                        value: isCheckedChronicle,
                        onChanged: (value) {
                          setState(() {
                            isCheckedChronicle = value ?? false;
                            isCheckedBad = false;
                            isCheckedGood = false;
                            isCheckedMoreOrLess = false;
                            isCheckedGood = false;
                            isCheckedPerfect = false;
                          });
                        },
                        splashRadius: 10,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return AppColors
                                  .secondaryBar; // Cor do fundo quando o checkbox está selecionado
                            }
                            return AppColors
                                .white; // Cor do fundo quando o checkbox não está selecionado
                          },
                        ),
                        side: const BorderSide(
                          color: AppColors.background2,
                          width: 2,
                        ),
                        shape: const CircleBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: sizeOF.width * .8,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Ruim',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: TextStyles.instance.secondary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Checkbox(
                        value: isCheckedBad,
                        onChanged: (value) {
                          setState(() {
                            isCheckedBad = value ?? false;
                            isCheckedChronicle = false;
                            isCheckedGood = false;
                            isCheckedMoreOrLess = false;
                            isCheckedGood = false;
                            isCheckedPerfect = false;
                          });
                        },
                        splashRadius: 10,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return AppColors
                                  .secondaryBar; // Cor do fundo quando o checkbox está selecionado
                            }
                            return AppColors
                                .white; // Cor do fundo quando o checkbox não está selecionado
                          },
                        ),
                        side: const BorderSide(
                          color: AppColors.background2,
                          width: 2,
                        ),
                        shape: const CircleBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: sizeOF.width * .8,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Mais ou menos',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: TextStyles.instance.secondary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Checkbox(
                        value: isCheckedMoreOrLess,
                        onChanged: (value) {
                          setState(() {
                            isCheckedMoreOrLess = value ?? false;
                            isCheckedChronicle = false;
                            isCheckedBad = false;
                            isCheckedGood = false;
                            isCheckedPerfect = false;
                          });
                        },
                        splashRadius: 10,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return AppColors
                                  .secondaryBar; // Cor do fundo quando o checkbox está selecionado
                            }
                            return AppColors
                                .white; // Cor do fundo quando o checkbox não está selecionado
                          },
                        ),
                        side: const BorderSide(
                          color: AppColors.background2,
                          width: 2,
                        ),
                        shape: const CircleBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: sizeOF.width * .8,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Boa, mas pode melhorar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: TextStyles.instance.secondary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Checkbox(
                        value: isCheckedGood,
                        onChanged: (value) {
                          setState(() {
                            isCheckedGood = value ?? false;
                            isCheckedChronicle = false;
                            isCheckedBad = false;
                            isCheckedMoreOrLess = false;

                            isCheckedPerfect = false;
                          });
                        },
                        splashRadius: 10,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return AppColors
                                  .secondaryBar; // Cor do fundo quando o checkbox está selecionado
                            }
                            return AppColors
                                .white; // Cor do fundo quando o checkbox não está selecionado
                          },
                        ),
                        side: const BorderSide(
                          color: AppColors.background2,
                          width: 2,
                        ),
                        shape: const CircleBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: sizeOF.width * .8,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Estou em perfeita saúde',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: TextStyles.instance.secondary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Checkbox(
                        value: isCheckedPerfect,
                        onChanged: (value) {
                          setState(() {
                            isCheckedPerfect = value ?? false;
                            isCheckedChronicle = false;
                            isCheckedBad = false;
                            isCheckedMoreOrLess = false;
                            isCheckedGood = false;
                          });
                        },
                        splashRadius: 10,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return AppColors
                                  .secondaryBar; // Cor do fundo quando o checkbox está selecionado
                            }
                            return AppColors
                                .white; // Cor do fundo quando o checkbox não está selecionado
                          },
                        ),
                        side: const BorderSide(
                          color: AppColors.background2,
                          width: 2,
                        ),
                        shape: const CircleBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: sizeOF.height * 0.05,
                    width: sizeOF.width * 0.37,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.popAndPushNamed(
                            context, RoutesAssets.registerQuestion);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        textStyle: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      label: const Text(
                        'Voltar',
                        style: TextStyle(color: Colors.black45),
                      ),
                      icon: const Icon(
                        color: Colors.white,
                        Icons.arrow_circle_left,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: sizeOF.height * 0.05,
                    width: sizeOF.width * 0.37,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 5.0)
                      ],
                      gradient: const LinearGradient(colors: [
                        Color(0xFFFF9000),
                        Color(0xFFFD821C),
                        Color(0xFFF37221)
                      ]),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if(isCheckedMoreOrLess == true ||
                            isCheckedChronicle == true ||
                            isCheckedBad == true ||
                            isCheckedGood == true ||
                            isCheckedPerfect == true){
                        Navigator.popAndPushNamed(
                            context, RoutesAssets.registerQuestion3);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 2),
                              backgroundColor: AppColors.primaryLight,
                              content: Text(
                                'Selecione uma resposta',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: TextStyles.instance.primary,
                                  fontWeight: FontWeight.w600,
                                  ),
                                textAlign: TextAlign.center,
                                ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        textStyle: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      label: const Text('Avançar'),
                      icon: const Icon(
                        color: Colors.white,
                        Icons.arrow_circle_right,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
