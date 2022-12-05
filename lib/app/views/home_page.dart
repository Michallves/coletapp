import 'package:coletapp/app/models/routes_modal.dart';
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
                onTap: () {
                  controller.readRoutes();
                },
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
          child: GetBuilder<HomeController>(
              builder: (_) => ListView.separated(
                  padding: const EdgeInsets.all(10),
                  separatorBuilder: (_, ___) => const Divider(),
                  itemCount: controller.routesList.value.length,
                  itemBuilder: ((context, index) {
                    final RoutesModal route =
                        controller.routesList.value[index];
                    return ListTile(
                      textColor: Colors.black,
                      title: Text(
                        route.address!,
                      ),
                    );
                  })))),
    );
  }
}
