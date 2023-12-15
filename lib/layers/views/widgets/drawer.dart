import 'package:coletapp/core/routes/app_routes.dart';
import 'package:coletapp/layers/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          Container(
            alignment: Alignment.center,
            color: const Color.fromARGB(255, 255, 183, 0),
            width: double.infinity,
            height: 180,
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.all(30)),
                Image.asset(
                  'assets/images/coletapp menu.png',
                  fit: BoxFit.contain,
                  width: 250,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
              child: Column(
            children: [
              ListTile(
                onTap: () => Get.toNamed(Routes.COMPLAINTS),
                leading: const Icon(
                  Icons.warning,
                ),
                style: ListTileStyle.drawer,
                title: const Text('Denúncias'),
                iconColor: Colors.black,
                textColor: Colors.black,
              ),
              ListTile(
                onTap: () => Get.toNamed(Routes.ROUTES),
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
                onTap: () => Get.toNamed(Routes.TERMOS),
                leading: const Icon(
                  Icons.description_outlined,
                ),
                style: ListTileStyle.drawer,
                title: const Text('Termos e condições'),
                iconColor: Colors.black,
                textColor: Colors.black,
              ),
            ],
          )),
        ]),
        Container(
          height: 120,
          width: double.infinity,
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.recycling,
                size: 80,
                color: Color.fromARGB(255, 255, 183, 0),
              ),
              Text('Versão 1.0')
            ],
          ),
        ),
      ],
    ));
  }
}
