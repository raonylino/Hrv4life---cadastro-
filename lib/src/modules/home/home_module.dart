

import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:hrv4life_flutter/src/constants/routes_assets.dart';
import 'package:hrv4life_flutter/src/modules/home/home_page.dart';

class HomeModule extends FlutterGetItModule {
  @override

  String get moduleRouteName => RoutesAssets.homePage;

  @override

  Map<String, WidgetBuilder> get pages => {RoutesAssets.home :(context) => const HomePage()};

}