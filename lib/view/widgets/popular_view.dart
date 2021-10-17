import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zedge/view/api/wall_model.dart';
import 'package:zedge/view/screens/wallpaper_screenview.dart';
import 'package:zedge/view/widgets/carousel.dart';

class PopularGridview extends StatefulWidget {
  final bool isVideo;
  List<ImageResponse>? data;
  List? links;
  PopularGridview({Key? key, required this.isVideo, this.links, this.data})
      : super(key: key);

  @override
  _PopularGridviewState createState() => _PopularGridviewState();
}

class _PopularGridviewState extends State<PopularGridview> {


  @override
  Widget build(BuildContext context) {

    return load!
        ? SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.5,
              mainAxisSpacing: 6,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                );
              },
              childCount: 30,
            ),
          )
        : SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.5,
              mainAxisSpacing: 6,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Craousal(
                          data: widget.data,
                          links: widget.links,
                          imgindex: index,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: new DecorationImage(
                            image: NetworkImage(widget.links![index]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      widget.isVideo
                          ? Positioned(
                              bottom: 15,
                              left: 15,
                              child: Container(
                                alignment: Alignment.center,
                                height: 17,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.videocam,
                                      size: 15,
                                      color: Colors.black,
                                    )),
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                ),
              );
            }, childCount: widget.data!.length),
          );
  }
}
