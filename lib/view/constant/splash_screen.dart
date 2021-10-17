import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zedge/view/screens/wallpaper_screen.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({ Key? key }) : super(key: key);

  @override
  _SpashScreenState createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  @override
  void initState() { 
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WallpaperScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:   
          Image.asset("assets/splash.jpg",
          fit: BoxFit.cover,
          ),
       
       
    );
  }
}
