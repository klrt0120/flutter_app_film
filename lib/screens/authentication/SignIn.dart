import 'package:flutter/material.dart';
import 'package:motchill/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../../providers/app.provider.dart';
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MovieProvide>(context);
    print(moviesProvider.onDisplayMovies) ;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [
          ...moviesProvider.onDisplayMovies.map((e) {
            return Text("${e.id}");
          })
        ],
      ),
    );
  }
}
