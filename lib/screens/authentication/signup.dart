import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:motchill/core/routes/routes.dart';
import 'package:motchill/utils/consstants.dart';
class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  var _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: deviceHeight * 0.15,
                    child: FittedBox(
                      child: Image.asset('assets/images/motchill.png', height:200.0, width:700.0),
                    )
                ),
                Container(
                  height: deviceHeight * 0.75,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: LayoutBuilder(builder: (ctx, constraints){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Đăng ký',
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),

                        ),
                        SizedBox(height: constraints.maxHeight * 0.02,),
                        Text('Chào mừng bạn đến với Motchill'),
                        SizedBox(height: constraints.maxHeight * 0.06,),
                        Container(
                            height: constraints.maxHeight * 0.12,
                            decoration: BoxDecoration(
                              color: const Color(0xffB4B4B4).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left:15),
                              child: Center(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Tên tài khoản',
                                  ),
                                ),
                              ),
                            )
                        ),
                        SizedBox(height: constraints.maxHeight * 0.04),
                        Container(
                            height: constraints.maxHeight * 0.12,
                            decoration: BoxDecoration(
                              color: const Color(0xffB4B4B4).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left:15),
                              child: Center(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                  ),
                                ),
                              ),
                            )
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
                              child: TextField(
                                obscureText: _isVisible ? false : true,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                        },
                                        icon: Icon(
                                            _isVisible? Icons.visibility: Icons.visibility_off,
                                            color: Colors.grey
                                        )
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Mật khẩu'
                                ),
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
                              child: TextField(
                                obscureText: _isVisible ? false : true,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                        },
                                        icon: Icon(
                                            _isVisible? Icons.visibility: Icons.visibility_off,
                                            color: Colors.grey
                                        )
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Nhập lại mật khẩu'
                                ),
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
                              onPressed: (){
                                Navigator.pushNamed(context, AppRoutes.SplashRoutes, arguments: "a");
                              },
                              child: Text(
                                  'Đăng ký',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22
                                  )
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: kRedColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)
                                  )
                              )
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.03,),
                        RichText(text: TextSpan(
                          text: 'Đã có tài khoản!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                                text: ' Đăng nhập',
                                style: TextStyle(
                                    color: kRedColor,
                                    fontSize: 18
                                ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  Navigator.pushNamed(context, AppRoutes.LoginRoute, arguments: "a");
                                }
                            )
                          ],
                        )),
                      ],
                    );
                  },),
                )
              ],
            ),
          ),
        )
    );
  }
}
