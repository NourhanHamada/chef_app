import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../core/custom_text.dart';


//ignore: must_be_immutable
class SettingScreenItem extends StatelessWidget {
  SettingScreenItem(
      {super.key,
        required this.title,
        required this.value,
        required this.onChanged});

  final String title;
  final bool value;
  void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          fontSize: 16,
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: whiteColor,
          activeTrackColor: mainColor,
          inactiveThumbColor: whiteColor,
          inactiveTrackColor: greyBorder,
        ),
      ],
    );
  }
}