import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hrv4life_core/hrv4life_core.dart';
import 'package:hrv4life_flutter/src/constants/app_assets.dart';
import 'package:hrv4life_flutter/src/constants/app_colors.dart';
import 'package:hrv4life_flutter/src/constants/app_text_styles.dart';
import 'package:hrv4life_flutter/src/constants/routes_assets.dart';
import 'package:hrv4life_flutter/src/modules/register/register_controller.dart';

class RegisterQuestionPage extends StatelessWidget {
  const RegisterQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    late RegisterController controller;
    controller = GetIt.instance<RegisterController>();

    final sizeOF = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(
                height: sizeOF.height * 0.07,
              ),
              SizedBox(
                height: 121,
                width: 121,
                child: Image.asset(
                  AppAssets.splash,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: sizeOF.height * 0.05,
              ),
              SizedBox(
                child: Text(
                  'Que bom ter você no HRV4Life, ${controller.nome}!',
                  style: Hrv4lifeThema.titleStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Agora que você já conheceu um pouco mais sobre nós, precisamos saber um pouco mais sobre os seus interesses',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: TextStyles.instance.secondary,
                      color: AppColors.black,
                    ),
                  )),
              const Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: sizeOF.width * 0.7,
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
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesAssets.registerQuestion2);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        textStyle: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      child: Text(
                        'Vamos Lá!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: TextStyles.instance.secondary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
