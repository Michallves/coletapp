import 'package:coletapp/app/views/home_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static const HOME = Routes.HOME;

  static final routes = [GetPage(name: Routes.HOME, page: () => HomePage())];
}
