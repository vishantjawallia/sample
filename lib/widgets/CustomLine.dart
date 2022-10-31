import 'package:flutter/material.dart';

class CustomLine extends StatelessWidget {
  final double width;
  final double borderWidth;
  final double height;
  final Color color;
  const CustomLine({
    Key? key,
    this.width = 50,
    this.borderWidth = 1,
    this.height = 1,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(width: borderWidth, color: color),
      ),
      child: const SizedBox(),
    );
  }
}
