import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class VerticalIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String color;
  final void Function() onTap;

  const VerticalIconButton(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onTap,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: HexColor("$color"),
            size: 28,
          ),
          const SizedBox(height: 2.0),
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                color: HexColor("$color"),
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins"),
          ),
        ],
      ),
    );
  }
}
