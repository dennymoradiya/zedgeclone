import 'package:flutter/material.dart';
import 'package:zedge/view/api/wall_model.dart';
import 'package:zedge/view/screens/wallpaper_screenview.dart';
import 'package:zedge/view/widgets/feature_view.dart';
import 'video_screen.dart';

List feturedWallpaper = [
  {"icon": Icons.verified, "title": "summer time", "image": "assets/img1.jpg"},
  {"icon": Icons.image, "title": "winter time", "image": "assets/img1.jpg"},
  {"icon": Icons.verified, "title": "monsoon time", "image": "assets/img1.jpg"},
  {
    "icon": Icons.mark_as_unread,
    "title": " summer time",
    "image": "assets/img1.jpg"
  },
  {"icon": Icons.verified, "title": "summer time", "image": "assets/img1.jpg"},
  {"icon": Icons.verified, "title": "summer time", "image": "assets/img1.jpg"},
  {"icon": Icons.image, "title": "winter time", "image": "assets/img1.jpg"},
  {"icon": Icons.verified, "title": "monsoon time", "image": "assets/img1.jpg"},
  {
    "icon": Icons.mark_as_unread,
    "title": " summer time",
    "image": "assets/img1.jpg"
  },
  {"icon": Icons.verified, "title": "summer time", "image": "assets/img1.jpg"},
  {"icon": Icons.verified, "title": "summer time", "image": "assets/img1.jpg"},
  {"icon": Icons.image, "title": "winter time", "image": "assets/img1.jpg"},
  {"icon": Icons.verified, "title": "monsoon time", "image": "assets/img1.jpg"},
  {
    "icon": Icons.mark_as_unread,
    "title": " summer time",
    "image": "assets/img1.jpg"
  },
  {"icon": Icons.verified, "title": "summer time", "image": "assets/img1.jpg"},
  {"icon": Icons.verified, "title": "summer time", "image": "assets/img1.jpg"},
  {"icon": Icons.image, "title": "winter time", "image": "assets/img1.jpg"},
   {"icon": Icons.image, "title": "winter time", "image": "assets/img1.jpg"},
  {"icon": Icons.verified, "title": "monsoon time", "image": "assets/img1.jpg"},
  {
    "icon": Icons.mark_as_unread,
    "title": " summer time",
    "image": "assets/img1.jpg"
  },
  {"icon": Icons.verified, "title": "monsoon time", "image": "assets/img1.jpg"},
  {
    "icon": Icons.mark_as_unread,
    "title": " summer time",
    "image": "assets/img1.jpg"
  },
  {"icon": Icons.verified, "title": "summer time", "image": "assets/img1.jpg"},
];

class FeatureList extends StatefulWidget {
  List<ImageResponse>? data;
  FeatureList({Key? key, this.data, }) : super(key: key);
  @override
  _FeatureListState createState() => _FeatureListState();
}

class _FeatureListState extends State<FeatureList> {
 
  @override
  Widget build(BuildContext context) {
    print(" ${widget.data}");
    return Row(
      children: [
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return InkWell(
                // onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => VideoScreen(
                //         data: widget.data!,
                //       )));
                // },
                child: load! ?FeatureListView(
                  title: feturedWallpaper[index]["title"],
                  icon: feturedWallpaper[index]["icon"],
                  image: feturedWallpaper[index]["image"],
                ) : FeatureListView(
                  title: feturedWallpaper[index]["title"],
                  icon: feturedWallpaper[index]["icon"],
                  image: widget.data![index].urls!.small,
                ) 
              );
            },
          ),
        ),
      ],
    );
  }
}
