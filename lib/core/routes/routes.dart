import 'package:motchill/screens/authentication/SignIn.dart';
import 'package:motchill/screens/detail_movie.dart';

import 'package:motchill/screens/home.dart';

import '../../screens/trailer.dart';

class AppRoutes {
  static const String LoginRoute = "/login";

  static const String SignupRoutes = "/signup";

  static const String HomeRoutes = "/";
  static const String DetailMovieRoutes = "/detail_movie";
  static const String TrailerRoutes = "/trailer";
  static final routes = {
    LoginRoute: (context) => LoginView(),
    HomeRoutes: (context) => HomePage(),
    DetailMovieRoutes: (context) => DetailMovieView(),
    TrailerRoutes: (context) => WebViewVideo(),


/*    SignupRoutes: (context) => SignupView(),
    HomeRoutes: (context) => HomeView(),*/
  };
}
