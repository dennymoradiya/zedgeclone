import 'package:flutter/material.dart';

class Lstcircle extends StatelessWidget {
  const Lstcircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List bgcolor=[
      Colors.green,
      Colors.red,
      Colors.purple,
      Colors.yellow,
      Colors.white,
      Colors.green,
      Colors.red,
      Colors.purple,
      Colors.yellow,
      Colors.white,
       
    ];
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) =>
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                   
                  radius: 35,
                  backgroundColor:  bgcolor[index],
                ),
              )
      ),
    );
  }
}
