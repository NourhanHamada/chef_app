import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../core/custom_text.dart';

//ignore: must_be_immutable
class ProfileScreenItems extends StatelessWidget {
  ProfileScreenItems({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    required this.icon,
  });

  void Function()? onTap;
  String title;
  Color? color;
  String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            icon,
            color: color ?? greyBorder,
          ),
          const SizedBox(
            width: 12,
          ),
          CustomText(
            text: title,
            fontSize: 16,
            color: color,
          ),
        ],
      ),
    );
  }
}