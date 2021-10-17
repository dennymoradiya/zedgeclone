

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:zedge/view/api/wall_model.dart';

String url =
    "https://api.unsplash.com/photos?per_page=50&client_id=C1g0wg37kJ2Xvr6cHerGhPUDCOxcyRLtpPZu1fJKlFI";

Future<List<ImageResponse>> getResponse(String? queries) async {
  if (queries == "") {
    queries = "wallaper";
  }

  try {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<ImageResponse> imgUrl = imageResponseFromJson(response.body);
      return imgUrl;
    } else {
      List<ImageResponse> imgUrl = [];
      return imgUrl;
    }
  } catch (e) {
    print("error is $e");
    List<ImageResponse> imgUrl = [];
    return imgUrl;
  }
}

Future<ImageResponse> getQuery(String query) async {
  String query =
      "https://api.unsplash.com/search/photos?per_page=30&query=wallpaper&client_id=3HzERgtDIRkOj9GJyEkW6hGruPQztdhLYHJHyEB8dPQ";

  var options = BaseOptions(
    baseUrl: query,
    validateStatus: (status) {
      return status! < 500;
    },
    responseType: ResponseType.json,
    followRedirects: false,
  );
  Dio dio = Dio(options);
  Response response = await dio.post("listCategories");
  try {
    final imageResponse = ImageResponse.fromJson(response.data);
    return imageResponse;
  } catch (error) {
    print("error on query $error");
    var imageResponse = ImageResponse();
    return imageResponse;
  }
}
