import 'package:flutter/material.dart';
import 'package:hrv4life_flutter/src/constants/app_assets.dart';
import 'package:hrv4life_flutter/src/constants/app_colors.dart';
import 'package:hrv4life_flutter/src/constants/app_text_styles.dart';

class ReadingDailyModal extends StatelessWidget {

  const ReadingDailyModal({ super.key });

   @override
   Widget build(BuildContext context) {
      final sizeOF = MediaQuery.sizeOf(context);
       return SizedBox(
        height: sizeOF.height * 0.7,
         child: Scaffold(
             body: Container(
              width: sizeOF.width,
              height: sizeOF.height,
               alignment: Alignment.center,
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(20),
                     child: Text('Como medir com a câmera',
                       textAlign: TextAlign.center, 
                       style: TextStyle(
                         color: AppColors.black,
                         fontSize: 18,
                         fontWeight: FontWeight.w700,
                         fontFamily: TextStyles.instance.secondary,
                       ),
                     ),
                   ),
                   Image.asset(AppAssets.readingGif, width: 200, height: 200),
                     Padding(
                     padding: const EdgeInsets.all(40),
                     child: Text('Cubra a lente da câmera com a ponta do seu dedo. Mantenha o dedo na posição até a medição ser concluída',
                       textAlign: TextAlign.center, 
                       style: TextStyle(
                         color: AppColors.secondaryPure,
                         fontSize: 14,
                         fontWeight: FontWeight.w700,
                         fontFamily: TextStyles.instance.secondary,
                       ),
                     ),
                   ),
                    Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                     child: Text('• Realize a medição de preferência em locais bem iluminados',
                       textAlign: TextAlign.left, 
                       style: TextStyle(
                         color: Colors.black45,
                         fontSize: 14,
                         fontWeight: FontWeight.w400,
                         fontFamily: TextStyles.instance.secondary,
                       ),
                     ),
                   ),
                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                     child: Text('• Relaxe e mantenha o dedo imóvel até o fim da medição',
                       textAlign: TextAlign.left, 
                       style: TextStyle(
                         color: Colors.black45,
                         fontSize: 14,
                         fontWeight: FontWeight.w400,
                         fontFamily: TextStyles.instance.secondary,
                       ),
                     ),
                   ),
                 ],
               ),
             )
         ),
       );
  }
}