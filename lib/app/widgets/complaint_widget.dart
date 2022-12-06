import 'package:coletapp/app/models/complaint_model.dart';
import 'package:flutter/material.dart';

class Complaintwidget extends StatelessWidget {
  const Complaintwidget(
      {super.key, this.image, this.district, this.street, this.description});
  final String? image;
  final String? description;
  final String? district;
  final String? street;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.warning_amber,
          size: 40,
        ),
        iconColor: Colors.green,
        title: Text("${district!}, ${street!}"),
        subtitle: Text(description!),
        isThreeLine: true,
      ),
    );
  }
}
