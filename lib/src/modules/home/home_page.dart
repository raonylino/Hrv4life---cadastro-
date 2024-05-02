import 'package:auto_size_text/auto_size_text.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hrv4life_flutter/src/constants/app_colors.dart';
import 'package:hrv4life_flutter/src/constants/app_text_styles.dart';
import 'package:hrv4life_flutter/src/constants/routes_assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOF = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.centerStart,
            height: sizeOF.height * 0.15,
            width: sizeOF.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                  Color(0xFFFF9000),
                  Color(0xffFD821C),
                  Color(0xffF37221),
                ], // Gradient from https://learnui.design/tools/gradient-generator.html
                tileMode: TileMode.mirror,
              ),
              boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.normal,
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
            ),
            child: SizedBox(
              width: sizeOF.width *.9,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 50),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white24,
                      ),
                      child: const Icon(
                        Icons.person_outline_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bom dia,',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: TextStyles.instance.secondary,
                          ),
                        ),
                        Text(
                          'Nome do Usuario',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: TextStyles.instance.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(
                     width: sizeOF.width * 0.28,
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 40, left: 10),
                    child: IconButton(
                      onPressed: () {
                           Navigator.pushReplacementNamed(context, RoutesAssets.menuPage);
                      },
                     icon: const Icon(
                      Icons.menu,
                      size: 25,
                      color: Colors.white,
                     ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: sizeOF.height * 0.03),
          Container(
            height: sizeOF.height * .22,
            width: sizeOF.width * .9,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.normal,
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Avliação Diária',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: TextStyles.instance.secondary,
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: const Divider(
                  color: Colors.black12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: AutoSizeText('Ainda não registramos a sua Avaliação de \nhoje',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                      fontFamily: TextStyles.instance.secondary,
                    )),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: sizeOF.width * 0.5,
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
                        Navigator.of(context).pushNamed('/home/morning');
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        textStyle: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      child: const Text("Iniciar Avaliação"),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(height: sizeOF.height * 0.02),
          Container(
            alignment: AlignmentDirectional.centerStart,
            height: sizeOF.height * 0.16,
            width: MediaQuery.of(context).size.width * .9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                  Color(0xFFFF9000),
                  Color(0xffFD821C),
                  Color(0xffF37221),
                ], // Gradient from https://learnui.design/tools/gradient-generator.html
                tileMode: TileMode.mirror,
              ),
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.normal,
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.wb_sunny_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Dica do dia',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: TextStyles.instance.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: const Divider(
                  color: Colors.white38,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, left: 15, right: 15),
                child: AutoSizeText(
                    'Aqui vamos montar um banco de dados local com algumas dicas de saúde e ai o app sorteia uma delas a cada dia para aparecer aqui',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: TextStyles.instance.secondary,
                    )),
              ),
            ]),
          ),
           SizedBox(height: sizeOF.height * 0.02),
          Container(
            height: sizeOF.height * 0.21,
            width: sizeOF.width * .9,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.normal,
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Diário de Saúde',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: TextStyles.instance.secondary,
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: const Divider(
                  color: Colors.black12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: AutoSizeText(
                    'Quer anotar seu peso, pressão, glicemia, \ntemperatura',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                      fontFamily: TextStyles.instance.secondary,
                    )),
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
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        textStyle: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      child: const Text("Preencher Diário"),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        color: Colors.white,
        backgroundColor: AppColors.primaryPure,
        style: TabStyle.titled,
        items: const [
          TabItem(icon: Icons.home, title: 'Inicio'),
          // TabItem(icon: Icons.edit_note, title: 'Diario'),
          TabItem(icon: Icons.add, title: 'Leitura'),
          // TabItem(icon: Icons.message, title: 'Chat'),
          TabItem(icon: Icons.calendar_month_rounded, title: 'Historico'),
        ],
        initialActiveIndex: 0,
        onTap: (int i) {
          switch (i) {
            case 0:
              Navigator.pushReplacementNamed(context, RoutesAssets.homePage);
            case 1:
              Navigator.pushReplacementNamed(context, RoutesAssets.readingHome);
            case 2:
              Navigator.pushReplacementNamed(context, RoutesAssets.historicPage);
          }
        },
      ),
    );
  }
}
