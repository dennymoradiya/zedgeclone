import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zedge/view/screens/wallpaper_screenview.dart';

class HeadingWidget extends StatefulWidget {
  final title;
  const HeadingWidget({Key? key, this.title}) : super(key: key);

  @override
  _HeadingWidgetState createState() => _HeadingWidgetState();
}

class _HeadingWidgetState extends State<HeadingWidget> {
  @override
  Widget build(BuildContext context) {
    
   Future loaddata()  {
      return  Future.delayed(
          Duration(
            seconds: 3,
          ), () {
        setState(() {
          load = false;
        });
      });
    }
loaddata();   
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 0, 7),

      child: load! ? Shimmer.fromColors( baseColor: Colors.white, highlightColor: Colors.grey,
        child: Text(
          widget.title,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ): Text(
          widget.title,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
    );
  }
}
