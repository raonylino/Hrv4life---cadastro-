
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:hrv4life_flutter/src/constants/routes_assets.dart';
import 'package:hrv4life_flutter/src/modules/onbording/onbording_controller.dart';
import 'package:hrv4life_flutter/src/modules/onbording/onbording_page_1.dart';
import 'package:hrv4life_flutter/src/modules/onbording/onbording_page_2.dart';
import 'package:hrv4life_flutter/src/modules/onbording/onbording_page_3.dart';


class OnbordingModule  extends FlutterGetItModule{

  @override
  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<OnbordingController>((i) => OnbordingController()),
  ];

  @override
  String get moduleRouteName =>  RoutesAssets.onbording;

  @override

  Map<String, WidgetBuilder> get pages => {
    RoutesAssets.onbording: (_) => const OnbordingPage1(),
    RoutesAssets.onbording2: (_) => const OnbordingPage2(),
    RoutesAssets.onbording3: (_) => const OnbordingPage3(),
  };
 
  
}