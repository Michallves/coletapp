import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/coletapp.png'),
      backgroundColor: Colors.green,
      showLoader: true,
      loaderColor: Colors.white,
      logoWidth: 60,
      loadingText: const Text(
        "Carregando...",
        style: TextStyle(color: Colors.white),
      ),
      navigator: HomePage(),
      durationInSeconds: 0,
    );
  }
}
