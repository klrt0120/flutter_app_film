import 'package:flutter/material.dart';
import 'package:motchill/core/routes/routes.dart';
import 'package:motchill/screens/authentication/SignIn.dart';
import 'package:motchill/screens/home.dart';
import 'package:motchill/screens/profile.dart';

import '../core/supabase/supabase.dart';

class AuthenciationNotifier extends ChangeNotifier {
  // Đăng nhập
  Future<void> SigninnUser(
    context, {
    String? email,
    String? password,
  }) async {
    print(email);
    print(password);

    try {
      final result = await SupabaseSetting.supabaseClient.auth
          .signInWithPassword(email: email, password: password!);

      if (result.session != null) {
        var snackBar = SnackBar(content: Text("Đăng nhập thành công !"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {}
    } catch (e) {
      print("Đăng nhập thất bại");
    }
  }

  // Đănng ký
  Future<void> SignupUser(
    context, {
    String? email,
    String? password,
    required String username,
  }) async {
    try {
      final result = await SupabaseSetting.supabaseClient.auth.signUp(
          email: email, password: password!, data: {"username": username});
      if (result.session != null) {
        print("Đăng ký thành công ");
        var snackBar = SnackBar(content: Text("Xin chào, ${username}"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushReplacementNamed(context, '${AppRoutes.LoginRoute}');
      }
    } catch (e) {
      print("Đăng ký thất bại");
      var snackBar =
          SnackBar(content: Text("Vui lòng kiểm tra lại email và tài khoản !"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> SignOut(context) async {
    try {
      await SupabaseSetting.supabaseClient.auth.signOut();
      var snackBar = SnackBar(content: Text("Đã đăng xuất !"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginView()));
    } catch (e) {}

    return;
  }

  Future<void> getProfile() async {
    try {
      final userId = SupabaseSetting.supabaseClient.auth.currentUser!.id;
      final data =
          await SupabaseSetting.supabaseClient.from('users').select("username");
      print(data);
    } catch (error) {}
  }
}
