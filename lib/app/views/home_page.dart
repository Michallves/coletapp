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
        drawer: Drawer(child: SingleChildScrollView()),
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
            Expanded(flex: 2, child: Container(child: Text('sdfsdfasdf'))),
            Container(
              height: 60,
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
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
                  Container(
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
