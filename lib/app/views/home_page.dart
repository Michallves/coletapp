import 'package:coletapp/app/models/complaint_model.dart';
import 'package:coletapp/app/models/route_model.dart';
import 'package:coletapp/app/routes/app_routes.dart';
import 'package:coletapp/app/widgets/complaint_widget.dart';
import 'package:coletapp/app/widgets/route_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      floatingActionButton: Obx(() => controller.screen == 'complaints'
          ? FloatingActionButton(
              onPressed: () => Get.toNamed(Routes.CREATECOMPLAINT),
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            )
          : Container()),
      appBar: AppBar(
          title: Obx(() => Text('${controller.screenTitle()}')),
          actions: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              width: 60,
              child: Image.asset(
                'assets/images/coletapp.png',
                fit: BoxFit.contain,
              ),
            )
          ]),
      drawer: Drawer(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.green,
            width: double.infinity,
            height: 150,
            child: Image.asset(
              'assets/images/coletapp.png',
              fit: BoxFit.contain,
              width: 100,
            ),
          ),
          SingleChildScrollView(
              child: Column(
            children: [
              ListTile(
                onTap: () => controller.screen.value = 'home',
                leading: const Icon(Icons.home),
                style: ListTileStyle.drawer,
                title: const Text('Inicio'),
                iconColor: Colors.black,
                textColor: Colors.black,
              ),
              ListTile(
                onTap: () => controller.screen.value = 'routes',
                leading: Image.asset(
                  'assets/images/rotas.png',
                  width: 20,
                  color: Colors.black,
                ),
                style: ListTileStyle.drawer,
                title: const Text('Rotas'),
                textColor: Colors.black,
              ),
              ListTile(
                onTap: () => controller.screen.value = 'complaints',
                leading: const Icon(
                  Icons.warning,
                ),
                style: ListTileStyle.drawer,
                title: const Text('Dénuncias'),
                iconColor: Colors.black,
                textColor: Colors.black,
              ),
            ],
          )),
        ],
      )),
      body: SafeArea(
          child: Obx(() => controller.isLoading == false
              ? controller.screen == 'home'
                  ? ListView.separated(
                      padding: const EdgeInsets.all(10),
                      separatorBuilder: (_, ___) => const Divider(),
                      itemCount: controller.routesList.length,
                      itemBuilder: ((context, index) {
                        final RoutesModal route = controller.routesList[index];
                        return ListTile(
                          textColor: Colors.black,
                          title: Text(
                            route.district!,
                          ),
                        );
                      }))
                  : controller.screen == 'complaints'
                      ? ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: controller.complaintsList.length,
                          itemBuilder: ((context, index) {
                            final ComplaintModel complaint =
                                controller.complaintsList[index];
                            return Complaintwidget(
                              description: complaint.description,
                              district: complaint.district,
                              street: complaint.street,
                            );
                          }))
                      : controller.screen == 'routes'
                          ? ListView.builder(
                              padding: const EdgeInsets.all(10),
                              itemCount: controller.routesList.length,
                              itemBuilder: ((context, index) {
                                final RoutesModal route =
                                    controller.routesList[index];
                                return RouteWidget(
                                  district: route.district,
                                  street: route.street,
                                  date: route.date,
                                );
                              }))
                          : Container()
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ))),
    );
  }
}
