import 'package:flutter/material.dart';
import 'package:zedge/view/api/server_comunication.dart';
import 'package:zedge/view/api/wall_model.dart';
import 'package:zedge/view/screens/feature_list.dart';
import 'package:zedge/view/widgets/categories_gridview.dart';
import 'package:zedge/view/widgets/popular_view.dart';
import 'package:zedge/view/widgets/title_widget.dart';
import 'package:zedge/view/widgets/wallpaper_categories.dart';

import 'wallpaper_screenview.dart';


class VideoWallpaperTabView extends StatefulWidget {
  const VideoWallpaperTabView({Key? key}) : super(key: key);

  @override
  _VideoWallpaperTabViewState createState() => _VideoWallpaperTabViewState();
}

List urls = [];
class _VideoWallpaperTabViewState extends State<VideoWallpaperTabView> {
   @override
  void initState() {
    super.initState();
    load = true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ImageResponse>>(
      future: getResponse("wallpaper"),
      builder:
          (BuildContext context, AsyncSnapshot<List<ImageResponse>> snapshot) {
        if (snapshot.data == null ||
            snapshot.connectionState == ConnectionState.waiting) {
          load = true;
          return TabBarView(
            children: [
              CustomScrollView(
                semanticChildCount: 1,
                slivers: <Widget>[
                  SliverToBoxAdapter(
                      child: HeadingWidget(
                    title: "Featured",
                  )),
                  SliverToBoxAdapter(
                    child: FeatureList(
                      data: [],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: HeadingWidget(
                      title: "Popular",
                    ),
                  ),
                  PopularGridview(
                    data: [],
                    links: [],
                    isVideo: false,
                  )
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: WallpaperCategories(
                      data: [],
                    ),
                  ),
                  Categoriesgrid(),
                ],
              ),
              CustomScrollView(
                slivers: [
                  PopularGridview(
                    links: [],
                    data: [],
                    isVideo: true,
                  )
                ],
              )
            ],
          );
        }
        if (snapshot.data != null ||
            snapshot.connectionState == ConnectionState.done) {
          var data = snapshot.data!;
          load = false;
          for (var i = 0; i < data.length; i++) {
            var img = data[i].urls!.small;
            urls.add(img);
          }
          return TabBarView(
            children: [
              CustomScrollView(
                semanticChildCount: 1,
                slivers: <Widget>[
                  SliverToBoxAdapter(
                      child: HeadingWidget(
                    title: "Featured",
                  )),
                  SliverToBoxAdapter(
                    child: FeatureList(
                      data: data,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: HeadingWidget(
                      title: "Popular",
                    ),
                  ),
                  PopularGridview(
                    data: data,
                    links: urls,
                    isVideo: false,
                  ),
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: WallpaperCategories(
                      data: data,
                    ),
                  ),
                  Categoriesgrid(),
                ],
              ),
              CustomScrollView(
                slivers: [
                  PopularGridview(
                    links: urls,
                    data: data,
                    isVideo: true,
                  )
                ],
              )
            ],
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
