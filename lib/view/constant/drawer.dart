import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List icons = [
      Icons.image,
      Icons.wallpaper,
      Icons.ring_volume,
      Icons.notifications,
      Icons.upload,
      Icons.favorite,
      Icons.settings,
      Icons.help,
      Icons.info
    ];
    List names = [
      "Wallpapers",
      "Video Wallpapers",
      "Ringtones",
      "Notifications",
      "Upload Content",
      "Saved",
      "Settings",
      "Help",
      "Information",
    ];
    return Drawer(
      child: Column(
        // padding: EdgeInsets.zero,
        children: [
          Expanded(
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(
                      0.8, 0.0), // 10% of the width, so there are ten blinds.
                  colors: <Color>[
                    Color(0xff9D50BB),
                    Color(0xff5E48AA)
                  ], // red to yellow
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.hindustantimes.com/img/2021/05/05/1600x900/abd-new-getty_1620192405891_1620192410254.jpg"),
                radius: 10,
                // backgroundColor: Colors.cyanAccent,
              ),
              accountName: Text("Devilliars"),
              accountEmail: Text("abd@17gmail.com"),
            ),
          ),
          Container(
            color: Color(0xff0a0a0a),
            child: Column(
              children: [
                DrawerListItem(
                  icon: icons[0],
                  name: names[0],
                  inActive: false,
                  ontap: () {
                    Navigator.pushNamed(context, '/wallpaper');
                  },
                ),
                DrawerListItem(
                  icon: icons[1],
                  name: names[1],
                  inActive: false,
                  ontap: () {
                    Navigator.pushNamed(context, '/videowallpaper');
                  },
                ),
                DrawerListItem(
                  icon: icons[2],
                  name: names[2],
                  inActive: false,
                  ontap: () {
                    Navigator.pushNamed(context, '/ringtones');
                  },
                ),
                DrawerListItem(
                  icon: icons[3],
                  name: names[3],
                  inActive: false,
                  ontap: () {
                    Navigator.pushNamed(context, '/notifications');
                  },
                ),
                Divider(
                  color: Colors.white,
                  height: 3,
                ),
                DrawerListItem(
                  icon: icons[4],
                  name: names[4],
                  inActive: false,
                ),
                DrawerListItem(
                  icon: icons[5],
                  name: names[5],
                  inActive: false,
                ),
                Divider(
                  color: Colors.grey,
                  height: 3,
                ),
                DrawerListItem(
                  icon: icons[6],
                  name: names[6],
                  inActive: true,
                ),
                DrawerListItem(
                  icon: icons[7],
                  name: names[7],
                  inActive: true,
                ),
                DrawerListItem(
                  icon: icons[8],
                  name: names[8],
                  inActive: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerListItem extends StatelessWidget {
  final icon;
  final name;
  bool inActive;
  final ontap;
  DrawerListItem(
      {Key? key, this.icon, this.name, required this.inActive, this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Icon(
        icon,
        color: inActive ? Colors.grey : Colors.white,
      ),
      title: Text(
        name,
        style: TextStyle(
            color: inActive ? Colors.grey : Colors.white, fontSize: 17),
      ),
    );
  }
}
