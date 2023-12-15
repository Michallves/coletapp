import 'package:flutter/material.dart';

class RouteWidget extends StatefulWidget {
  const RouteWidget({super.key, this.district, this.street, this.date});
  final Map? date;
  final String? district;
  final String? street;

  @override
  State<RouteWidget> createState() => _RouteWidgetState();
}

class _RouteWidgetState extends State<RouteWidget> {
  late bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => setState(() {
            isOpen = !isOpen;
          }),
          textColor: Colors.black,
          leading: Image.asset(
            'assets/images/rotas.png',
            color: const Color.fromARGB(255, 255, 183, 0),
            width: 35,
          ),
          title: Text(
            widget.street!,
          ),
          subtitle: Text(widget.district!),
          trailing: Icon(
            isOpen == false ? Icons.arrow_drop_down : Icons.arrow_drop_up,
            size: 30,
            color: Colors.black,
          ),
        ),
        if (isOpen == true)
          Column(
            children: [
              widget.date?["segunda"] != null
                  ? Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'SEGUNDA-FEIRA',
                                style: TextStyle(),
                              ),
                              Text(widget.date!["segunda"]),
                            ],
                          ),
                        ),
                        const Divider()
                      ],
                    )
                  : Container(),
              widget.date?["terca"] != null
                  ? Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'TERÇA-FEIRA',
                                style: TextStyle(),
                              ),
                              Text(widget.date!["terca"]),
                            ],
                          ),
                        ),
                        const Divider()
                      ],
                    )
                  : Container(),
              widget.date?["quarta"] != null
                  ? Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'QUARTA-FEIRA',
                                style: TextStyle(),
                              ),
                              Text(widget.date!["quarta"]),
                            ],
                          ),
                        ),
                        const Divider()
                      ],
                    )
                  : Container(),
              widget.date?["quinta"] != null
                  ? Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'QUINTA-FEIRA',
                                style: TextStyle(),
                              ),
                              Text(widget.date!["quinta"]),
                            ],
                          ),
                        ),
                        const Divider()
                      ],
                    )
                  : Container(),
              if (widget.date?["sexta"] != null)
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'SEXTA-FEIRA',
                            style: TextStyle(),
                          ),
                          Text(widget.date!["sexta"]),
                        ],
                      ),
                    ),
                    const Divider()
                  ],
                )
              else
                Container(),
            ],
          )
        else
          Container(),
      ],
    );
  }
}
