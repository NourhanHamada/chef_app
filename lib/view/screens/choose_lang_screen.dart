import 'package:chef_app/view/constants/assets.dart';
import 'package:chef_app/view/constants/colors.dart';
import 'package:chef_app/view/constants/extentions.dart';
import 'package:chef_app/view/screens/auth_screens/signin_screen.dart';
import 'package:flutter/material.dart';
import '../core/custom_button.dart';

class ChooseLangScreen extends StatelessWidget {
  const ChooseLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(background, fit: BoxFit.fill,),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(logo2),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Welcome to Chef App',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                const Text(
                  'Please choose your language',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 56,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      onTap: (){
                        context.push(const LoginScreen());
                      },
                      borderRadius: 10,
                      color: blackColor,
                      title: 'English',
                      width: 140,
                    ),
                    CustomButton(
                      onTap: (){
                        context.push(const LoginScreen());
                      },
                      borderRadius: 10,
                      color: blackColor,
                      title: 'العربية',
                      width: 140,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}