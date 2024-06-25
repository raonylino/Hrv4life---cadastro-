import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrv4life_flutter/src/constants/app_assets.dart';
import 'package:hrv4life_flutter/src/constants/app_colors.dart';
import 'package:hrv4life_flutter/src/constants/app_text_styles.dart';
import 'package:hrv4life_flutter/src/constants/routes_assets.dart';
import 'package:lottie/lottie.dart';
import 'package:validatorless/validatorless.dart';

class RegisterQuestion8Page extends StatefulWidget {
  const RegisterQuestion8Page({super.key});

  @override
  State<RegisterQuestion8Page> createState() => _RegisterQuestion8PageState();
}

class _RegisterQuestion8PageState extends State<RegisterQuestion8Page> {
  final formKey = GlobalKey<FormState>();
  final alturaEC = TextEditingController();

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
                  value: .95,
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
                  'Está acabando',
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
                textAlign: TextAlign.justify,
                'Para finalizar, informe o seu Cep para localizar você no no mapa do HRV4Life',
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
                  'Qual é o seu CEP?',
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
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                width: sizeOF.width * .8,
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: alturaEC,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CepInputFormatter(),
                        ],
                        validator: Validatorless.multiple([
                          Validatorless.required('CEP é obrigatório'),
                        ]),
                        decoration: const InputDecoration(
                          labelText: 'CEP',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 12), // Definir altura do campo de texto
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                'Mapa do HRV4Life',
                style: TextStyle(
                  color:AppColors.secondaryBar,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: TextStyles.instance.secondary,
                )
              ),
            ),
             SizedBox(
              height: sizeOF.height * 0.12,
            ),
                   Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          alignment: Alignment.topCenter,
                          height: sizeOF.height * 0.12,
                          width: sizeOF.width * 0.8,
                          child: Transform.scale(
                            scale: 2.0,
                            child: Lottie.asset(
                              AppAssets.mapLottie,
                              fit: BoxFit.contain,
                            ),
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
                            context, RoutesAssets.registerQuestion5);
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
                       final valid = formKey.currentState?.validate() ?? false;
                       if(valid){
                        Navigator.pushNamed(context, RoutesAssets.homePage);
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
