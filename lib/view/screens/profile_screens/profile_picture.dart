import 'package:flutter/material.dart';

import '../../constants/colors.dart';

//ignore: must_be_immutable
class ProfilePicture extends StatelessWidget {
   ProfilePicture({super.key, this.onTap});

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            color: mainColor,
            width: 150,
            height: 150,
          ),
        ),
        Transform.translate(
          offset: const Offset(60, 50),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              width: 30,
              height: 30,
              child: const Center(
                child: Icon(
                  Icons.edit,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
