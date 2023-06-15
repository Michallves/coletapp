import 'package:coletapp/layers/views/home_view.dart';
import 'package:coletapp/layers/views/create_complaint_view.dart';
import 'package:coletapp/layers/views/initial_view.dart';
import 'package:coletapp/layers/views/routes_view.dart';
import 'package:coletapp/layers/views/termos_view.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names

  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const InitialView(),
    ),
    GetPage(name: Routes.COMPLAINTS, page: () => ComplaintsView()),
    GetPage(name: Routes.ROUTES, page: () => RoutesView()),
    GetPage(name: Routes.CREATECOMPLAINT, page: () => const CreateComplaintView()),
    GetPage(name: Routes.TERMOS, page: () => const TermosView())
  ];
}
