import 'package:chef_app/view/constants/colors.dart';
import 'package:chef_app/view/constants/extentions.dart';
import 'package:chef_app/view/core/customAppbar.dart';
import 'package:chef_app/view/core/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbar(title: S.of(context).forgetPasswordScreen,),
    );
  }
}
