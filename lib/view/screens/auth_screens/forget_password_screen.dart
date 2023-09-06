import 'package:chef_app/view/constants/colors.dart';
import 'package:chef_app/view/constants/data.dart';
import 'package:chef_app/view/constants/extentions.dart';
import 'package:chef_app/view/core/customAppbar.dart';
import 'package:chef_app/view/core/custom_button.dart';
import 'package:chef_app/view/core/custom_text.dart';
import 'package:chef_app/view/core/custom_text_form_field.dart';
import 'package:chef_app/view_model/cubit/forget_password/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../generated/l10n.dart';
import '../../constants/assets.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordCubit forgetPasswordCubit = BlocProvider.of(
      context,
      listen: true,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: false,
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
          text: S.of(context).forgetPasswordScreen,
          color: whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Image.asset(
                lock,
              ),
              CustomText(
                text: S.of(context).enterYourEmail,
                fontSize: 18,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32,
              ),
              CustomTextFormField(
                controller: forgetPasswordCubit.emailController,
                hintText: S.of(context).email,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return S.of(context).emailMustBeNotEmpty;
                  } else if (!RegExp(validationEmail).hasMatch(value.trim())) {
                    return S.of(context).emailIsNotValid;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                borderRadius: 8,
                color: mainColor,
                onTap: () {
                  forgetPasswordCubit.forgetPasswordSendCode(email: forgetPasswordCubit.emailController.text);
                  print('Hello');
                },
                title: S.of(context).sendCode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
