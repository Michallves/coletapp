import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
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
                  leading: Icon(Icons.home),
                  style: ListTileStyle.drawer,
                  title: Text('Inicio'),
                  textColor: Colors.grey[600],
                ),
                const Divider(),
                ListTile(
                  leading: Image.asset(
                    'assets/images/rotas.png',
                    color: Colors.grey[500],
                    width: 30,
                  ),
                  style: ListTileStyle.drawer,
                  title: const Text('Rotas'),
                  textColor: Colors.grey[600],
                ),
                const Divider(),
                ListTile(
                  leading: Icon(
                    Icons.warning,
                  ),
                  style: ListTileStyle.drawer,
                  title: Text('Dénuncias'),
                  textColor: Colors.grey[600],
                ),
                Divider(),
              ],
            )),
          ],
        )),
        body: SafeArea(
            child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Center(
                child: Text('Frase de impacto'),
              ),
            ),
            const Divider(
              thickness: 5,
            ),
            const Expanded(flex: 2, child: Text('sdfsdfasdf')),
            Container(
              height: 60,
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 140,
                    child: Text(
                      'Termo de uso e politica de privacidade',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1?.color,
                          fontSize: 14),
                    ),
                  ),
                  Image.asset(
                    'assets/images/coletapp.png',
                    fit: BoxFit.contain,
                    width: 60,
                  ),
                  SizedBox(
                    width: 140,
                    child: Text(
                      'Termo de uso e politica de privacidade',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1?.color,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
            )
          ],
        )));
  }
}
