import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zedge/view/widgets/ringtone_listview.dart';

List title = [
  "new song",
  "old song",
  "best song",
  "new song",
  "hollywood song",
  "classic song",
  "rock song",
  "new song",
  "new song",
  "new song",
];
List subtitle = [
  "Love,shiva,motivation",
  "shiva,new,rock",
  "new,shiva,motivation",
  "Love,shiva,rock",
  "Love,new,classic",
  "rock,shiva,new",
  "Love,shiva,shiva",
  "shiva,shiva,classic",
  "rock,new,motivation",
  "Love,shiva,motivation",
];
List download = [
  "5 M",
  "1 K",
  "3 M",
  "6 K",
  "5 M",
  "6 M",
  "8 M",
  "8 M",
  "8 M",
  "8 M",
];

class Ringscreen extends StatefulWidget {
  Ringscreen({Key? key}) : super(key: key);

  @override
  _RingscreenState createState() => _RingscreenState();
}

class _RingscreenState extends State<Ringscreen> {
  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index){
        return Ringlistview(
            title: title[index],
            subtitle: subtitle[index],
            download: download[index],
          );

      },
      childCount: download.length
      
    ),
    
    );
     
    
  }
}
