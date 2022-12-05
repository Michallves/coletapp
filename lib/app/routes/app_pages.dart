import 'package:coletapp/app/views/create_complaint_page.dart';
import 'package:coletapp/app/views/home_page.dart';
import 'package:get/get.dart';

import '../views/initial_page.dart';
import 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names

  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPage(),
    ),
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.CREATECOMPLAINT, page: () => CreateComplaintPage())
  ];
}
