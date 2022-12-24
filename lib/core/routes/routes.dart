import 'package:motchill/screens/authentication/SignIn.dart';
import 'package:motchill/screens/detail_movie.dart';

import 'package:motchill/screens/home.dart';
import 'package:motchill/screens/search.dart';

import '../../screens/authentication/signup.dart';
import '../../screens/trailer.dart';

class AppRoutes {
  static const String LoginRoute = "/login";
  static const String SignupRoutes = "/signup";
  static const String HomeRoutes = "/home";
  static const String DetailMovieRoutes = "/detail_movie";
  static const String TrailerRoutes = "/trailer";
  static const String SearchRoutes = "/search";
  static final routes = {
    LoginRoute: (context) => LoginView(),
    HomeRoutes: (context) => HomePage(),
    DetailMovieRoutes: (context) => DetailMovieView(),
    TrailerRoutes: (context) => WebViewVideo(),
    SearchRoutes: (context) => SearchScreen(),
    SignupRoutes:(context) => SignupView() ,

/*    SignupRoutes: (context) => SignupView(),
    HomeRoutes: (context) => HomeView(),*/
  };
}
