import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:motchill/core/routes/routes.dart';
import 'package:motchill/utils/consstants.dart';

import '../../providers/authenciation_provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _supabaseClient = AuthenciationNotifier();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _isVisible = false;
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    confirmpasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                  height: deviceHeight * 0.15,
                  child: FittedBox(
                    child: Image.asset('assets/images/motchill.png',
                        height: 200.0, width: 700.0),
                  )),
              Container(
                height: deviceHeight * 0.75,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(
                  builder: (ctx, constraints) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '????ng k??',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        Text('Ch??o m???ng b???n ?????n v???i Motchill'),
                        SizedBox(
                          height: constraints.maxHeight * 0.06,
                        ),
                        Container(
                            height: constraints.maxHeight * 0.12,
                            decoration: BoxDecoration(
                              color: const Color(0xffB4B4B4).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Center(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return "T??n t??i kho???n kh??ng ???????c ????? tr???ng !";
                                    else {
                                      return null;
                                    }
                                  },
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'T??n t??i kho???n',
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: constraints.maxHeight * 0.04),
                        Container(
                            height: constraints.maxHeight * 0.12,
                            decoration: BoxDecoration(
                              color: const Color(0xffB4B4B4).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Center(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return "Email kh??ng ???????c ????? tr???ng !";
                                    else if (!value.contains("@")) {
                                      return "Email kh??ng h???p l???!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: constraints.maxHeight * 0.04),
                        Container(
                          height: constraints.maxHeight * 0.12,
                          decoration: BoxDecoration(
                            color: const Color(0xffB4B4B4).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Center(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return "M???t kh??ng ???????c ????? tr???ng !";
                                  else if (value.toString().length < 8) {
                                    return "M???t kh???u ph???i c?? ??t nh???t 8 k?? t???!";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: passwordController,
                                obscureText: _isVisible ? false : true,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                        },
                                        icon: Icon(
                                            _isVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.grey)),
                                    border: InputBorder.none,
                                    hintText: 'M???t kh???u'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.04),
                        Container(
                          height: constraints.maxHeight * 0.12,
                          decoration: BoxDecoration(
                            color: const Color(0xffB4B4B4).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Center(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return "Vui l??ng nh???p l???i m???t kh???u !";
                                  else if (value != passwordController.text) {
                                    return "M???t kh???u kh??ng kh???p !";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: confirmpasswordController,
                                obscureText: _isVisible ? false : true,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                        },
                                        icon: Icon(
                                            _isVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.grey)),
                                    border: InputBorder.none,
                                    hintText: 'Nh???p l???i m???t kh???u'),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: constraints.maxHeight * 0.12,
                          margin: EdgeInsets.only(
                            top: constraints.maxHeight * 0.04,
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                 
                                  _supabaseClient.SignupUser(
                                    context,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    username: usernameController.text,
                                  );
                                }
                              },
                              child: Text('????ng k??',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22)),
                              style: ElevatedButton.styleFrom(
                                  primary: kRedColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(16)))),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.03,
                        ),
                        RichText(
                            text: TextSpan(
                          text: '???? c?? t??i kho???n!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                                text: '????ng nh???p',
                                style:
                                    TextStyle(color: kRedColor, fontSize: 18),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, AppRoutes.LoginRoute,
                                        arguments: "a");
                                  })
                          ],
                        )),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
