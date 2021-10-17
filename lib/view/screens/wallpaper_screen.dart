import 'package:flutter/material.dart';

import '../constant/header.dart';

class WallpaperScreen extends StatelessWidget {
  const WallpaperScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Header(
      title: "Wallpapers",
    );
  }
}