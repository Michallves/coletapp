import 'package:coletapp/app/views/create_complaint_page.dart';
import 'package:coletapp/app/views/termos_page.dart';
import 'package:get/get.dart';

import '../views/complaints_page.dart';
import '../views/initial_page.dart';
import '../views/routes_page.dart';
import 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names

  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPage(),
    ),
    GetPage(name: Routes.COMPLAINTS, page: () => ComplaintsPage()),
    GetPage(name: Routes.ROUTES, page: () => RoutesPage()),
    GetPage(name: Routes.CREATECOMPLAINT, page: () => const CreateComplaintPage()),
    GetPage(name: Routes.TERMOS, page: () => TermosPage())
  ];
}
