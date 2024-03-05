import 'package:flutter/material.dart';
import 'package:hrv4life_flutter/src/constants/app_assets.dart';
import 'package:hrv4life_flutter/src/constants/app_text_styles.dart';


class OnbordingPage3 extends StatelessWidget {
  const OnbordingPage3 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.pressentation3),
            fit: BoxFit.cover,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding:EdgeInsets.all(8.0),
                  child:Row(
                    
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    
                         Icon(
                        Icons.fiber_manual_record_outlined,
                        color: Colors.white,
                        size:11
                      ),
                    
                         Icon(
                        Icons.fiber_manual_record_outlined,
                        color: Colors.white,
                        size: 11,
                      ),
                          Icon(
                        Icons.panorama_wide_angle_select_rounded,
                        color: Colors.white,
                        size: 11,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Tenha controle da\n sua saúde',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: TextStyles.instance.primary,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Tenha dados e indicadores para ser o\n protagonista do seu estilo de vida!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: TextStyles.instance.secondary,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: TextButton(
                          child: Text(
                            'Pular',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: TextStyles.instance.secondary,
                                fontSize: 16),
                          ),
                          onPressed: () {
                      
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: ElevatedButton(
                        onPressed: () {
                         
                        },
                        style: ElevatedButton.styleFrom(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.w600)),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Avançar'),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
