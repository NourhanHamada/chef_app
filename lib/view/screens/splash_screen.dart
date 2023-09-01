import 'package:chef_app/view/constants/colors.dart';
import 'package:chef_app/view/constants/extentions.dart';
import 'package:chef_app/view/screens/choose_lang_screen.dart';
import 'package:flutter/material.dart';
import '../constants/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isAnimate = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isAnimate = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  isAnimate = true;
                });
              },
              child: Image.asset(logo2),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 65,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    curve: Curves.fastOutSlowIn,
                    bottom: isAnimate ? 30 : 0,
                    duration: const Duration(seconds: 3),
                    onEnd: (){
                      context.push(const ChooseLangScreen());
                    },
                    child: const Text(
                      'Chef App',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
