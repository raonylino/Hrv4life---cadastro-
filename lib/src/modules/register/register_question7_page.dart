import 'package:flutter/material.dart';
import 'package:hrv4life_flutter/src/constants/app_colors.dart';
import 'package:hrv4life_flutter/src/constants/app_text_styles.dart';
import 'package:hrv4life_flutter/src/constants/routes_assets.dart';

class RegisterQuestion7Page extends StatefulWidget {
  const RegisterQuestion7Page({super.key});

  @override
  State<RegisterQuestion7Page> createState() => _RegisterQuestion7PageState();
}

class _RegisterQuestion7PageState extends State<RegisterQuestion7Page> {
  bool isCheckedDiabetes = false;
  bool isCheckedHipertensao = false;
  bool isCheckedPressao = false;
  bool isCheckedCardiaco = false;
  bool isCheckedAnemia = false;
  bool isCheckedFumante = false;
  bool isCheckedNenhuma = false;

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
                  value: .90,
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
                  'Seu histórico',
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
                'É importante conhecer um pouco mais sobre seu histórico de saúde',
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
                  'Você possui alguma das condições \nlistadas abaixo?',
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
                        'Diabetes',
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
                        value: isCheckedDiabetes,
                        onChanged: (value) {
                          setState(() {
                            isCheckedDiabetes = value ?? false;
                            isCheckedNenhuma = false;
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
                        'Hipertensão (Pressão Alta)',
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
                        value: isCheckedHipertensao,
                        onChanged: (value) {
                          setState(() {
                            isCheckedHipertensao = value ?? false;
                            isCheckedNenhuma = false;
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
                        'Pressão Baixa',
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
                        value: isCheckedPressao,
                        onChanged: (value) {
                          setState(() {
                            isCheckedPressao = value ?? false;
                            isCheckedNenhuma = false;
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
                        'Problemas Cardíacos',
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
                        value: isCheckedCardiaco,
                        onChanged: (value) {
                          setState(() {
                            isCheckedCardiaco = value ?? false;
                            isCheckedNenhuma = false;
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
                        'Anemia',
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
                        value: isCheckedAnemia,
                        onChanged: (value) {
                          setState(() {
                            isCheckedAnemia = value ?? false;
                            isCheckedNenhuma = false;
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
                        'Fumante',
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
                        value: isCheckedFumante,
                        onChanged: (value) {
                          setState(() {
                            isCheckedFumante = value ?? false;
                            isCheckedNenhuma = false;
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
                        'Nenhuma',
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
                        value: isCheckedNenhuma,
                        onChanged: (value) {
                          setState(() {
                            isCheckedNenhuma = value ?? false;
                            isCheckedDiabetes = false;
                            isCheckedHipertensao = false;
                            isCheckedPressao = false;
                            isCheckedCardiaco = false;
                            isCheckedAnemia = false;
                            isCheckedFumante = false;
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
                            context, RoutesAssets.registerQuestion6);
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
                        if (isCheckedNenhuma == true ||
                            isCheckedDiabetes == true ||
                            isCheckedHipertensao == true ||
                            isCheckedPressao == true ||
                            isCheckedCardiaco == true ||
                            isCheckedAnemia == true ||
                            isCheckedFumante == true) {
                          Navigator.popAndPushNamed(
                              context, RoutesAssets.registerQuestion8);
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
