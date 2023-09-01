import 'package:chef_app/view/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(
            color: mainColor,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
