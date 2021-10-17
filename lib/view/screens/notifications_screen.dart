import 'package:flutter/material.dart';
import 'package:zedge/view/constant/header.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Header(
      title: "Notifications",
    );
  }
}