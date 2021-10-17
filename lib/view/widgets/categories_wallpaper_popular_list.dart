import 'package:flutter/material.dart';
import 'package:zedge/view/api/wall_model.dart';
import 'dart:ui';
import 'package:zedge/view/screens/categories_popularsearch_page.dart';

List lst = [
  "Anime",
  "Naruto",
  "Rick And Morty",
  "Demon Slayer",
  "Loki",
  "Black",
  "Star Wars",
  "Juice Wrld",
  "Skulls",
  "Wolf",
];

class WallpaperCategoriesPopularList extends StatelessWidget {
  List<ImageResponse>? data;
    WallpaperCategoriesPopularList({
    Key? key,   this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List gradient = [
      [0xff92FE9D, 0xff00C9FF],
      [0xfff46b45, 0xff3498db],
      [0xff00dbde, 0xfffc00ff],
      [0xff2c3e50, 0xff3498db],
      [0xffdc2430, 0xff7b4397],
      [0xfff46b45, 0xff3498db],
      [0xff00dbde, 0xfffc00ff],
      [0xff2c3e50, 0xff3498db],
      [0xffdc2430, 0xff7b4397],
      [0xffdc2430, 0xff7b4397],
    ];

    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: lst.length,
          itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (contex)=>Childpage(data:data)));
                  },
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Color(gradient[index][0]),
                        Color(gradient[index][1])
                      ]
                    ),
                    ),
                    child: Center(
                      child: Stack(
                        children: [
                          Text(
                            lst[index],
                            style: TextStyle(
                              color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
