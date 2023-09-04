import 'package:chef_app/view/constants/assets.dart';
import 'package:chef_app/view/constants/colors.dart';
import 'package:chef_app/view/constants/extentions.dart';
import 'package:chef_app/view/screens/auth_screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';
import '../../view_model/cubit/localization/localization_cubit.dart';
import '../core/custom_button.dart';

class ChooseLangScreen extends StatelessWidget {
  const ChooseLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocalizationCubit localizationCubit =
        BlocProvider.of<LocalizationCubit>(context, listen: true);
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                background,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(logo2),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  S.of(context).chooseLangTitle,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Text(
                  S.of(context).chooseLangSubTitle,
                  style: const TextStyle(
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
                      onTap: () {
                        localizationCubit.changeLanguageToEnglish();
                        context.push(const LoginScreen());
                      },
                      borderRadius: 10,
                      color: blackColor,
                      title: 'English',
                      width: 140,
                    ),
                    CustomButton(
                      onTap: () {
                        context.push(const LoginScreen());
                        localizationCubit.changeLanguageToArabic();
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
