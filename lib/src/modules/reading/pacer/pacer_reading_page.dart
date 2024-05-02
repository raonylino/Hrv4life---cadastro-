import 'package:flutter/material.dart';
import 'package:hrv4life_flutter/src/constants/app_assets.dart';
import 'package:lottie/lottie.dart';

class PacerReadingPage extends StatefulWidget {

  const PacerReadingPage({ super.key });

  @override
  State<PacerReadingPage> createState() => _PacerReadingPageState();
}

class _PacerReadingPageState extends State<PacerReadingPage> {

   @override
   Widget build(BuildContext context) {
     final sizeOF = MediaQuery.sizeOf(context);
       return Scaffold(
           appBar: AppBar(title: const Text('Pacer'),),
           body: Container(
            alignment: Alignment.center,
            child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          alignment: Alignment.topCenter,
                          height: sizeOF.height * 0.12,
                          width: sizeOF.width * 0.8,
                          child: Transform.scale(
                            scale: 5.0,
                            child: Lottie.asset(
                              AppAssets.pacerCompleto,
                              fit: BoxFit.contain,
                             
                            ),
                          ),
                        ),
                      ),
           ),
       );
  }
}