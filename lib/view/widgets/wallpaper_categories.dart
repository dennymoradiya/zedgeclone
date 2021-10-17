import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zedge/view/api/wall_model.dart';
import 'categories_wallpaper_popular_list.dart';

class WallpaperCategories extends StatefulWidget {
 List<ImageResponse>? data;
 WallpaperCategories({Key? key,   this.data}) : super(key: key);

  @override
  _WallpaperCategoriesState createState() => _WallpaperCategoriesState();
}

class _WallpaperCategoriesState extends State<WallpaperCategories> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "Popular Searches",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          WallpaperCategoriesPopularList(data :widget.data),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "Categories",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          // Grideview(),
        ],
    );
  }
}
