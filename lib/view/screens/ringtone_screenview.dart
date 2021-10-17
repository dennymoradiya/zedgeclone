import 'package:flutter/material.dart';
import 'package:zedge/view/api/server_comunication.dart';
import 'package:zedge/view/api/wall_model.dart';
import 'package:zedge/view/screens/feature_list.dart';
import 'package:zedge/view/widgets/categories_gridview.dart';
import 'package:zedge/view/widgets/title_widget.dart';
import 'package:zedge/view/widgets/wallpaper_categories.dart';

import '../widgets/ring_screen.dart';

class RingtoneTabView extends StatelessWidget {
  const RingtoneTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ImageResponse>>(
      future: getResponse("wallpaper"),
      builder:
          (BuildContext context, AsyncSnapshot<List<ImageResponse>> snapshot) {
        if (snapshot.data == null ||
            snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.data != null ||
            snapshot.connectionState == ConnectionState.done) {
          var data = snapshot.data!;
          List urls = [];

          for (var i = 0; i < data.length; i++) {
            var img = data[i].urls!.small;
            urls.add(img);
          }
          return TabBarView(
            children: [
              CustomScrollView(
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
                  Ringscreen()
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
                  Ringscreen(),
                ],
              )
            ],
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
