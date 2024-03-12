import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:hrv4life_core/hrv4life_core_config.dart';
import 'package:hrv4life_flutter/src/binding/hrv4life_aplication_binding.dart';
import 'package:hrv4life_flutter/src/constants/routes_assets.dart';
import 'package:hrv4life_flutter/src/modules/auth/auth_module.dart';
import 'package:hrv4life_flutter/src/modules/home/home_module.dart';
import 'package:hrv4life_flutter/src/modules/onbording/onbording_module.dart';
import 'package:hrv4life_flutter/src/pages/splash_page.dart';

void main() {
  runZonedGuarded((){
    runApp(const hrv4lifeFlutter());
  }, (error, stack) { 
    log('erro não tradado $error', error: error, stackTrace: stack);
    throw error;
  });
}

// ignore: camel_case_types
class hrv4lifeFlutter extends StatelessWidget {
  const hrv4lifeFlutter({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Hrv4lifeCoreConfig(
      title: 'Hrv4Life',
      bindings: Hrv4lifeAplicationBinding(),
      pagesBuilders: [
        FlutterGetItPageBuilder(
          page: (_) => const SplashPage(),
          path: RoutesAssets.home,
           )
      ],
      modules: [AuthModule(), OnbordingModule(),HomeModule()],
      );
  }
}

