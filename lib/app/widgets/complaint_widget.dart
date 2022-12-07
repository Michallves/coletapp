import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class Complaintwidget extends StatefulWidget {
  const Complaintwidget(
      {super.key,
      this.image,
      this.district,
      this.street,
      this.description,
      this.date});
  final String? image;
  final String? description;
  final String? district;
  final String? street;
  final Timestamp? date;

  @override
  State<Complaintwidget> createState() => _ComplaintwidgetState();
}

class _ComplaintwidgetState extends State<Complaintwidget> {
  bool plus = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.warning_amber,
              size: 40,
            ),
            iconColor: Colors.green,
            title: Text(
              widget.street!,
            
            ),
            subtitle: Text(
                widget.district!,
            ),
            trailing: Text(
              textAlign: TextAlign.end,
              formatDate(
                widget.date!.toDate(),
                [dd, '/', mm, '/', yyyy, '\n', hh, ':', mm],
              ),
            ),
          ),
          Image.network(widget.image!, errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Container();
          }, loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Container(
              alignment: Alignment.center,
              height: 200,
              width: double.infinity,
              child: CircularProgressIndicator(
                color: Colors.green,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          }),
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Denúncia:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Text(
                  "${widget.description}",
                  maxLines: plus == true ? 300 : 3,
                  style: const TextStyle(fontSize: 16, wordSpacing: 2),
                ),
                widget.description!.length > 100
                    ? GestureDetector(
                        onTap: () => setState(() => plus = !plus),
                        child: Container(
                            alignment: Alignment.bottomCenter,
                            width: double.infinity,
                            height: 40,
                            child: Icon(
                              plus == true
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                            )),
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
