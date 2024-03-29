import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:hrv4life_flutter/src/constants/app_assets.dart';
import 'package:hrv4life_flutter/src/constants/app_colors.dart';
import 'package:hrv4life_flutter/src/constants/app_text_styles.dart';
import 'package:hrv4life_flutter/src/modules/login/login_page.dart';

class OnboardingLoginPage extends StatelessWidget {
  final Color kDarkBlueColor = const Color(0xFF053149);
  const OnboardingLoginPage({ super.key });

   @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Cadastro',
      onFinish: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: AppColors.primary,
      ),
      skipTextButton: const Text(
        'Proximo',
        style: TextStyle(
          fontSize: 16,
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Text(
        'Login',
        style: TextStyle(
          fontSize: 16,
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailingFunction: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
      controllerColor: AppColors.primary,
      totalPage: 3,
      headerBackgroundColor: const Color.fromRGBO(63, 46, 32,1),
      pageBackgroundColor: Colors.black,
      background: [
        Image.asset(
          AppAssets.pressentation1,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Image.asset(
          AppAssets.pressentation2,
            height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Image.asset(
          AppAssets.pressentation3, 
           height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          opacity: const AlwaysStoppedAnimation(.5),

        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 450,
              ),
              Text(
                'Sua saúde na\n ponta do dedo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: TextStyles.instance.primary,
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
               Text(
                'A qualquer momento, em qualquer lugar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: TextStyles.instance.secondary,
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 450,
              ),
              Text(
                'Conheça o seu\n Corpo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: TextStyles.instance.primary
                ),
              ),
              const SizedBox(
                height: 20,
              ),
               Text(
                'Veja os resultados após cada leitura e\n avalie como está sua saúde',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: TextStyles.instance.secondary
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 450,
              ),
              Text(
                'Tenha controle da sua saúde',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: TextStyles.instance.primary
                ),
              ),
              const SizedBox(
                height: 20,
              ),
               Text(
                'Tenha dados e indicadores para ser o protagonista do seu estilo de vida!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: TextStyles.instance.secondary
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}