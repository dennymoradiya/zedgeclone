import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:wallpaper/wallpaper.dart';
import 'package:zedge/view/api/wall_model.dart';

class Craousal extends StatefulWidget {
  List<ImageResponse>? data;
  List? links;
  int? imgindex;

  Craousal({Key? key, this.data, this.links, this.imgindex}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CraousalState();
  }
}

class _CraousalState extends State<Craousal> {
 
  String home = "Home Screen",
      lock = "Lock Screen",
      both = "Both Screen",
      system = "System";

       String? bgimag;
      int? changedIndex;





  @override
  void initState() {
    try {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        widget.links!.forEach((imageUrl) {
          precacheImage(NetworkImage(imageUrl), context);
        });
      });
      
      bgimag = widget.links![widget.imgindex!];
 changedIndex = widget.imgindex!;


      super.initState();
      
    } catch (e) {}
  }


  Stream<String>? progressString;
  String? res;
  bool downloading = false;
  @override
  Widget build(BuildContext context) {
    
    try {
      List indextoLast = widget.links!
          .getRange(widget.imgindex!, widget.links!.length)
          .toList();
      List firsttoIndex = widget.links!.getRange(0, widget.imgindex!).toList();
      indextoLast.addAll(firsttoIndex);
 


      Future<String> createFolder(String wallpaper) async {
        final folderName = wallpaper;
        final path = Directory("/storage/emulated/0/$folderName");
        //  print("manual path = ${path.path}");
        var status = await Permission.storage.status;
        if (!status.isGranted) {
          await Permission.storage.request();
        }
        if ((await path.exists())) {
          return path.path;
        } else {
          path.create();
          return path.path;
        }
      }

      _saveImage(int saveindex) async {
     
        await Permission.storage.request();
        var savePath = await createFolder("wallpaper");
        savePath = savePath + "/zedge$saveindex.jpeg";
        // print("savePath $savePath");
        
        await Dio().download(bgimag!, savePath);
           await ImageGallerySaver.saveFile(savePath);
        print("object");

       

     
       
    //     Fluttertoast.showToast(
    //     msg: "download successfully",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.grey,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );

      }

      return widget.data == null
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: Colors.black,
              body: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  decoration: new BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.grey, Colors.grey],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(0.5, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.35), BlendMode.dstATop),
                      image: new NetworkImage(
                        "$bgimag",
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                try {
                                  progressString =
                                      Wallpaper.ImageDownloadProgress(
                                          indextoLast[changedIndex!]);
                                  progressString!.listen((data) {
                                    setState(() {
                                      res = data;
                                      downloading = true;
                                    });
                                  }, onDone: () async {
                                    both = await Wallpaper.bothScreen();
                                    setState(() {
                                      downloading = false;
                                      both = both;
                                      lock = both;
                                    });
                                    // print("Task Done");
                                  }, onError: (error) {
                                    setState(() {
                                      downloading = false;
                                    });
                                    print("Some Error");
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Wallpaper set sucessfully"),
                                  ));
                                } catch (e) {
                                  print("error is $e");
                                }
                              },
                              child: Icon(
                                Icons.more_vert,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CarouselSlider.builder(
                        itemCount: 30,
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.70,
                          aspectRatio: 2.0,
                          onPageChanged: (val, reason) {
                            changedIndex = val;
                                    print("changedIndex $changedIndex");

                            setState(() {
                              bgimag = indextoLast[changedIndex!];
                            });
                          },
                          enlargeCenterPage: true,
                        ),
                        itemBuilder: (context, index, realIdx) {
                          return Container(
                            child: Center(
                                child: Image.network(
                              indextoLast[index],
                              height: MediaQuery.of(context).size.height * 0.70,
                              fit: BoxFit.cover,
                            )),
                          );
                        },
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () async {
                                await _saveImage(changedIndex!);
                                var save =
                                    "storage/emulated/0/wallpaper/zedge$changedIndex.jpeg";
                                await Share.shareFiles(['$save'],
                                    text: 'Wallpaper App');
                              },
                              child: Icon(
                                Icons.share,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                
                                _saveImage(changedIndex!);
                                
                              },
                              child: Icon(
                                Icons.download_for_offline_rounded,
                                size: 70,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.favorite_border_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
    } catch (e) {
      print("courasel error $e");
      return Center(child: CircularProgressIndicator());
    }
  }
}
