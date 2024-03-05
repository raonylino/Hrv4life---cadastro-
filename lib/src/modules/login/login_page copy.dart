import 'package:flutter/material.dart';
import 'package:hrv4life_flutter/src/components/social_button.dart';
import 'package:hrv4life_flutter/src/constants/app_assets.dart';
import 'package:hrv4life_flutter/src/constants/app_colors.dart';
import 'package:hrv4life_flutter/src/constants/app_text_styles.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.background,
      body: SafeArea(child: 
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 88.0, vertical: 8.0),
              child: Image(
                image: AssetImage(AppAssets.logowide),
                height: 67.49,
                width: 199,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
              child: Text(
                'Chegou a hora de assumir o\ncontrole da sua saúde!',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: TextStyles.instance.primary,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
              child: Text(
                'Crie sua conta e melhore seu estilo\nde vida',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
                    icon:const Icon(
                      color: Colors.white,
                      Icons.email_outlined,
                    ),
                    label: const Text('Cadastrar com email'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                child: SocialButton(
                  label: 'Cadastrar com Google',
                  type: SocialButtotype.google,
                  image: AppAssets.google,
                  onTap: () {},
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
              child: SocialButton(
                label: 'Cadastrar com Facebook',
                type: SocialButtotype.facebook,
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
              child: SocialButton(
                label: 'Cadastrar com Apple',
                type: SocialButtotype.apple,
                onTap: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 68),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Já possui cadastro?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Entre por aqui!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff319795),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                    textStyle:const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline
                    )
                  ),
                  onPressed: () {},
                  child:const Text('Termos de Uso e Política de Privacidade'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

