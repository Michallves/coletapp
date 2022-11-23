import 'package:coletapp/app/views/home_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const HOME = Routes.HOME;

  static final routes = [GetPage(name: Routes.HOME, page: () => HomePage())];
}
