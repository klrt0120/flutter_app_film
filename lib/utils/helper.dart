import 'package:motchill/providers/movies_provider.dart';
import 'package:provider/provider.dart';

Future<void> fetchDataVideoTrailer(String category, String id,
    Function router_func, MovieProvide video) async {
  print('Dữ liệu đang tải...');

  var respon = await video.getVideo(category, id);
  print("respon ${respon}");
  router_func();
}

Future<void> fetchDetailFilm(String category, String id, Function router_func,
    MovieProvide video) async {
  print('Dữ liệu đang tải...');
  await video.getDetail(category, id);
  // if (video.dataDetail != null) {
  //   var response = await video.getGenresFilm(category, video.dataDetail.genres![0].name);
  // }
  router_func();
}
