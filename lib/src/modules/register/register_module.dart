import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:hrv4life_flutter/src/constants/routes_assets.dart';
import 'package:hrv4life_flutter/src/modules/register/register_name_page.dart';
import 'package:hrv4life_flutter/src/modules/register/register_question2_page.dart';
import 'package:hrv4life_flutter/src/modules/register/register_question3_page.dart';
import 'package:hrv4life_flutter/src/modules/register/register_question4_page.dart';
import 'package:hrv4life_flutter/src/modules/register/register_question5_page.dart';
import 'package:hrv4life_flutter/src/modules/register/register_question6_page.dart';
import 'package:hrv4life_flutter/src/modules/register/register_question7_page.dart';
import 'package:hrv4life_flutter/src/modules/register/register_question8_page.dart';
import 'package:hrv4life_flutter/src/modules/register/register_question_page.dart';


class RegisterModule extends FlutterGetItModule{
  @override
  String get moduleRouteName => RoutesAssets.registerHome;
  @override

  Map<String, WidgetBuilder> get pages => {
    RoutesAssets.splash :(context) => const RegisterNamePage(),
    '/question' :(context) => const RegisterQuestionPage(),
    '/question2' :(context) => const RegisterQuestion2Page(),
    '/question3' :(context) => const RegisterQuestion3Page(),
    '/question4' :(context) => const RegisterQuestion4Page(),
    '/question5' :(context) => const RegisterQuestion5Page(),
    '/question6' :(context) => const RegisterQuestion6Page(),
    '/question7' :(context) => const RegisterQuestion7Page(),
    '/question8' :(context) => const RegisterQuestion8Page(),
    
    };
  
}