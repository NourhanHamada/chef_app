import 'package:chef_app/view/constants/assets.dart';
import 'package:chef_app/view/constants/extentions.dart';
import 'package:chef_app/view/core/custom_text.dart';
import 'package:chef_app/view/screens/profile_screens/setting_screen.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../widgets/profile/profile_screen_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Expanded(
              child: Column(
                children: [
                  CustomText(
                    text: 'Nourhan Hamada',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomText(
                    text: 'nourhan.hamada996@gmail.com',
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ProfileScreenItems(
                    onTap: () {},
                    title: S.of(context).editProfile,
                    icon: profile,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ProfileScreenItems(
                    onTap: () {},
                    title: S.of(context).password,
                    icon: hide,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ProfileScreenItems(
                    onTap: () {
                      context.push(const SettingScreen());
                    },
                    title: S.of(context).setting,
                    icon: setting,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ProfileScreenItems(
                    onTap: () {},
                    title: S.of(context).logout,
                    icon: logout,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


