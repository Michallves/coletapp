import 'package:coletapp/core/routes/app_pages.dart';
import 'package:coletapp/core/routes/app_routes.dart';
import 'package:coletapp/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/config.dart';

Future<void> main() async {
  await initConfigurations();

  runApp(GetMaterialApp(
    title: 'ColetaApp',
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
    getPages: AppPages.routes,
    initialRoute: Routes.INITIAL,
  ));
}
