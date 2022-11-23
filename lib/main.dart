import 'package:coletapp/app/routes/app_routes.dart';
import 'package:coletapp/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'config.dart';


Future<void> main() async {
  await initConfigurations();

  runApp(GetMaterialApp(
    title: 'ColetaApp',
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
    getPages: AppPages.routes,
    initialRoute: Routes.HOME,
  ));
}
