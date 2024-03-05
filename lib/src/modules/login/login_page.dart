import 'package:flutter/material.dart';
import 'package:hrv4life_flutter/src/components/social_button.dart';
import 'package:hrv4life_flutter/src/constants/app_assets.dart';
import 'package:hrv4life_flutter/src/constants/app_colors.dart';
import 'package:hrv4life_flutter/src/constants/app_text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOF = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 40, top: 40),
              child: Image(
                image: AssetImage(AppAssets.splash),
                height: 40,
                width: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 38.0),
              child: Text(
                'Entrar',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: TextStyles.instance.secondary,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 1.0),
              child: Text(
                'Informe seu\n usuário e senha',
                style: TextStyle(
                  fontSize: 28,
                  height: 1.2,
                  fontFamily: TextStyles.instance.primary,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
              child: Form(
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Email'),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Form(
                child: SizedBox(
                  height: 40 ,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Senha'),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 184, top: 8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor:AppColors.primary,
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Esqueci minha senha'),
                ),
              ),
            ),
                     Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        thickness: 0.1,
                        color: Colors.black,
                        height: 36,
                      )),
                ),
                const Text("ou"),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        thickness: 0.1,
                        color: Colors.black,
                        height: 36,
                      )),
                ),
              ]),
            ),
   
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
                  child: ElevatedButton.icon(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    icon: const Icon(
                      color: Colors.white,
                      Icons.arrow_circle_right_rounded,
                    ),
                    label: const Text('Entrar'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
