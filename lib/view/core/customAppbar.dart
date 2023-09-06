import 'package:chef_app/view/constants/extentions.dart';
import 'package:chef_app/view/core/custom_text.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
   const CustomAppbar({super.key, this.title, this.leading});
   @override
   // TODO: implement preferredSize
   Size get preferredSize => throw UnimplementedError();

  final String? title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading ?? IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: whiteColor,
        ),
        onPressed: () {
          context.pop();
        },
      ),
      title: CustomText(
        text: title!,
        color: whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }


}
