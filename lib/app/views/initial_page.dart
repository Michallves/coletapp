import 'package:coletapp/app/controllers/auth_controller.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final controller = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    controller.authUser();
  }

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
      durationInSeconds: 3,
    );
  }
}
