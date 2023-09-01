import 'package:chef_app/view/constants/colors.dart';
import 'package:chef_app/view/core/custom_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText(text: 'Home screen', color: mainColor,),),
    );
  }
}
