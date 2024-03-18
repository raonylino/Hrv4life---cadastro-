import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hrv4life_flutter/src/constants/app_colors.dart';
import 'package:hrv4life_flutter/src/constants/app_text_styles.dart';
import 'package:hrv4life_flutter/src/constants/routes_assets.dart';

class ReadingPage extends StatelessWidget {
  const ReadingPage({super.key});
  
  get constraintsmaxHeight => null;

  @override
  Widget build(BuildContext context) {
    final sizeOF = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        alignment: AlignmentDirectional.topCenter,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Text(
                'Medidas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: TextStyles.instance.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Escolha o estilo de medida',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: TextStyles.instance.secondary,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: const Divider(
                height: 4,
                color: AppColors.secondaryLight,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height:  MediaQuery.of(context).size.width < 250 ? constraintsmaxHeight * 0.3 : 160,
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 8),
                              child: Container(
                                height: 32,
                                width: 32,
                                decoration: const BoxDecoration(
                                  color: AppColors.primaryPure,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                ),
                                child: const Icon(Icons.wb_sunny_outlined,
                                    color: Colors.white, size: 20),
                              ),
                            ),
                            Text(
                              'Avaliação Funcional',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: TextStyles.instance.secondary,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/reading/morning');
                          },
                          icon: const Icon(
                            Icons.chevron_right_outlined,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: const Divider(
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
                    child: Text(
                        'Faça essa medida logo após acordar e receba orientação para saber como melhorar o seu dia',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                          fontFamily: TextStyles.instance.secondary,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
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
          TabItem(icon: Icons.people, title: 'Perfil'),
        ],
        initialActiveIndex: 1,
        onTap: (int i) {
          switch (i) {
            case 0:
              Navigator.pushReplacementNamed(context, RoutesAssets.homePage);
            case 1:
              Navigator.pushReplacementNamed(context, RoutesAssets.readingHome);
          }
        },
      ),
    );
  }
}
