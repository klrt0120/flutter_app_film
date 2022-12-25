import 'package:flutter/material.dart';
import 'package:motchill/core/routes/routes.dart';
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
      print(result.hashCode);
      if (result.session != null) {
     
        print("Đăng nhập thành công ");
        print(result.user);
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
        Navigator.pushReplacementNamed(context, '${AppRoutes.LoginRoute}');
      }
    } catch (e) {
      print("Đăng ký thất bại");
    }
  }
}
