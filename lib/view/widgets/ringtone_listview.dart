import 'package:flutter/material.dart';

class Ringlistview extends StatelessWidget {
  final title;
  final subtitle;

  final download;
  const Ringlistview({Key? key, this.title, this.subtitle, this.download})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: NetworkImage(
                "https://c4.wallpaperflare.com/wallpaper/245/434/468/macbook-colorful-minimalism-simple-background-wallpaper-preview.jpg"),
            fit: BoxFit.cover,
          ),
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 1,
            ),
            Icon(
              Icons.play_circle_outline,
              size: 70,
              color: Colors.white,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:8.0,top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                 
                  Row(
                    children: [
                      Icon(Icons.download, size: 15, color: Colors.white),
                      Text(
                        download,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Icon(Icons.favorite_border_outlined, color: Colors.white)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
