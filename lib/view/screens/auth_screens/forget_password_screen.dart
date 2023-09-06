import 'package:chef_app/view/constants/colors.dart';
import 'package:chef_app/view/constants/data.dart';
import 'package:chef_app/view/constants/extentions.dart';
import 'package:chef_app/view/core/custom_button.dart';
import 'package:chef_app/view/core/custom_text.dart';
import 'package:chef_app/view/core/custom_text_form_field.dart';
import 'package:chef_app/view/screens/auth_screens/reset_password_screen.dart';
import 'package:chef_app/view_model/cubit/forget_password/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if(state is ForgetPasswordLoading) {
          showDialog(context: context, builder: (context) {
            return const Center(
              child: CircularProgressIndicator(color: mainColor,),
            );
          });
        }
        if(state is ForgetPasswordSuccess) {
          context.pop();
          context.push(const ResetPasswordScreen());
        }
        if(state is ForgetPasswordFail) {
          context.pop();
        }
      },
      child: Scaffold(
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
                Form(
                  key: forgetPasswordCubit.key,
                  child: CustomTextFormField(
                    controller: forgetPasswordCubit.emailController,
                    hintText: S.of(context).email,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return S.of(context).emailMustBeNotEmpty;
                      } else if (!RegExp(validationEmail)
                          .hasMatch(value.trim())) {
                        return S.of(context).emailIsNotValid;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomButton(
                  borderRadius: 8,
                  color: mainColor,
                  onTap: () {
                    if (forgetPasswordCubit.key.currentState!.validate()) {
                      forgetPasswordCubit.forgetPasswordSendCode(
                          email: forgetPasswordCubit.emailController.text);
                    }
                  },
                  title: S.of(context).sendCode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
