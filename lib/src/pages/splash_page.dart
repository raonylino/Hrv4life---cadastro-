
import 'package:flutter/material.dart';
import 'package:hrv4life_flutter/src/constants/image_assets.dart';
import 'package:hrv4life_flutter/src/constants/routes_assets.dart';

class SplashPage extends StatefulWidget {

  const SplashPage({ super.key });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


    @override
      void initState() {
        super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
       Navigator.of(context).pushReplacementNamed(RoutesAssets.authLogin);
     });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImageAssets.splash,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
