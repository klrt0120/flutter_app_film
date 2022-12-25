import 'package:flutter/material.dart';
import 'package:motchill/core/routes/routes.dart';

import '../core/supabase/supabase.dart';

class AuthenciationNotifier extends ChangeNotifier {
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
        Navigator.pushReplacementNamed(context, '${AppRoutes.HomeRoutes}');
      } else {}
    } catch (e) {
    
      print("Đăng nhập thất bại");
    }
  }
}
