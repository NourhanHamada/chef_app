import 'package:chef_app/view/constants/colors.dart';
import 'package:chef_app/view/constants/extentions.dart';
import 'package:chef_app/view/core/customAppbar.dart';
import 'package:chef_app/view/core/custom_text.dart';
import 'package:chef_app/view_model/cubit/localization/localization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

bool x = false;

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    LocalizationCubit localizationCubit = BlocProvider.of(context, listen: true,);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
        ),
        title: CustomText(
          text: S.of(context).setting,
          color: whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'العربية',
                  fontSize: 16,
                ),
                Switch(
                  value: localizationCubit.isArabic,
                  onChanged: (value) {
                    localizationCubit.switchLang(value);
                    // setState(() {
                    //   x = value;
                    //   value = !value;
                    //   print(x);
                    // });
                  },
                  activeColor: whiteColor,
                  activeTrackColor: mainColor,
                  inactiveThumbColor: whiteColor,
                  inactiveTrackColor: greyBorder,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
