import 'package:flutter/material.dart';

class DoubleAvatar extends StatelessWidget {
  final String imagePath1;
  final String imagePath2;
  final Color? strokeColor;
  const DoubleAvatar(
      {super.key,
      required this.imagePath1,
      required this.imagePath2,
      this.strokeColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38 * 3,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath1),
            radius: 38,
          ),
          Positioned(
            left: 38,
            child: CircleAvatar(
              backgroundImage: AssetImage(imagePath2),
              radius: 38,
            ),
          ),
        ],
      ),
    );
  }
}
