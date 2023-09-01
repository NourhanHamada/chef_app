import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
        required this.borderRadius,
        required this.color,
        required this.onTap,
        this.width,
        this.height,
        required this.title,
      });

  final double borderRadius;
  final Color color;
  final Function() onTap;
  final double? width;
  final double? height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
        child: SizedBox(
          width: width ?? double.infinity,
          height: height ?? 48,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}