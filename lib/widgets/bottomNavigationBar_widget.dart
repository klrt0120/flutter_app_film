import 'package:flutter/material.dart';
class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: Row(
        //   children: <Widget>[
        //     buildNavBarItem(Icons.home, 0, true),
        //     buildNavBarItem(Icons.list, 1, false),
        //     buildNavBarItem(Icons.notifications, 0, false),
        //   ],
        // ),
    );
  }
  // Container buildNavBarItem(IconData icon, isActive){
  //   return Container(
  //     height: 60,
  //     width: MediaQuery.of(context).size.width / 3,
  //     decoration: BoxDecoration(color: isActive? Colors.grey: Colors.black),
  //     child: Icon(icon),
  //   );
  // }
}


