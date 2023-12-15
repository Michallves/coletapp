import 'package:coletapp/layers/views/home_view.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/coletapp.png'),
      backgroundColor: const Color.fromARGB(255, 255, 183, 0),
      showLoader: true,
      loaderColor: Colors.white,
      logoWidth: 120,
      loadingText: const Text(
        "Carregando...",
        style: TextStyle(color: Colors.white),
      ),
      navigator: ComplaintsView(),
      durationInSeconds: 10,
    );
  }
}
