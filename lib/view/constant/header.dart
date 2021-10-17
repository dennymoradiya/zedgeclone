import 'package:flutter/material.dart';
import 'package:zedge/view/constant/drawer.dart';
import '../screens/notification_screenview.dart';
import '../screens/ringtone_screenview.dart';
import '../screens/videowallpaper_screenview.dart';
import '../screens/wallpaper_screenview.dart';

class Header extends StatefulWidget {
  final title;
  const Header({Key? key, this.title}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}


class _HeaderState extends State<Header> {

 



  var view;
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    if (widget.title == "Wallpapers") {
      view = WallpaperTabView();
    }
    else if (widget.title == "Video Wallpapers") {
      view = VideoWallpaperTabView();
    } else if (widget.title == "Ringtones") {
      view = RingtoneTabView();
    } else if (widget.title == "Notifications") {
      view = NotificationTabView();
    } else {
      view = WallpaperTabView();
    }
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xff0a0a0a),
        drawer: DrawerWidget(),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                SliverAppBar(
                  backgroundColor: Color(0xff2e2e2e),
                  title: isSearch
                      ? TextField(
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.0,
                              fontSize: 18),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0)),
                              hintText: 'Search',
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        )
                      : Text(widget.title),
                  actions: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (isSearch == false) {
                            isSearch = true;
                          } else {
                            isSearch = false;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.search,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                  ],
                  floating: true,
                  pinned: true,
                  snap: true,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(55),
                    child: TabBar(
                      indicatorColor: Colors.white,
                      indicatorWeight: 3.5,
                      labelColor: Colors.white,
                      unselectedLabelStyle: TextStyle(color: Colors.grey),
                      unselectedLabelColor: Colors.grey[300],
                      tabs: [
                        Text(
                          "HOME",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "CATAGORIES",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "PREMIUM",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: view),
      ),
    );
  }
}
