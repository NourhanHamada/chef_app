import 'package:chef_app/view/constants/colors.dart';
import 'package:chef_app/view/constants/data.dart';
import 'package:chef_app/view/constants/extentions.dart';
import 'package:chef_app/view/core/custom_button.dart';
import 'package:chef_app/view/core/custom_text.dart';
import 'package:chef_app/view/core/custom_text_form_field.dart';
import 'package:chef_app/view/screens/home_screen.dart';
import 'package:chef_app/view_model/cubit/forget_password/forget_password_cubit.dart';
import 'package:chef_app/view_model/cubit/reset_password/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../constants/assets.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordCubit resetPasswordCubit =
        BlocProvider.of<ResetPasswordCubit>(context, listen: true);
    ForgetPasswordCubit forgetPasswordCubit =
        BlocProvider.of<ForgetPasswordCubit>(context, listen: true);
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: mainColor,
                  ),
                );
              });
        }
        if (state is ResetPasswordSuccess) {
          context.pop();
          context.push(const HomeScreen());
        }
        if (state is ResetPasswordFail) {
          context.pop();
        }
      },
      builder: (context, state) {
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
              text: S.of(context).createNewPassword,
              fontSize: 16,
              color: whiteColor,
            ),
            centerTitle: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: ListView(
                children: [
                  Image.asset(
                    lock,
                  ),
                  CustomText(
                    text: S.of(context).createNewPassword,
                    fontSize: 16,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Form(
                    key: resetPasswordCubit.key,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: resetPasswordCubit.newPasswordController,
                          hintText: S.of(context).newPassword,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return '';
                            } else if (!RegExp(validationPassword)
                                .hasMatch(value.trim())) {
                              return '';
                            }
                            return null;
                          },
                          textInputType: TextInputType.visiblePassword,
                          isPassword: resetPasswordCubit.isPasswordOne,
                          suffixIcon: resetPasswordCubit.isPasswordOne
                              ? IconButton(
                                  onPressed: () {
                                    resetPasswordCubit
                                        .changePasswordVisibility();
                                  },
                                  icon: const Icon(
                                    Icons.visibility,
                                    color: mainColor,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    resetPasswordCubit
                                        .changePasswordVisibility();
                                  },
                                  icon: const Icon(
                                    Icons.visibility_off,
                                    color: mainColor,
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                          controller:
                              resetPasswordCubit.confirmNewPasswordController,
                          hintText: S.of(context).confirmPassword,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return '';
                            } else if (!RegExp(validationPassword)
                                .hasMatch(value.trim())) {
                              return '';
                            } else if (value !=
                                resetPasswordCubit.newPasswordController.text) {
                              return '';
                            }
                            return null;
                          },
                          textInputType: TextInputType.visiblePassword,
                          isPassword: resetPasswordCubit.isPasswordTwo,
                          suffixIcon: resetPasswordCubit.isPasswordTwo
                              ? IconButton(
                                  onPressed: () {
                                    resetPasswordCubit
                                        .changeConfirmPasswordVisibility();
                                  },
                                  icon: const Icon(
                                    Icons.visibility,
                                    color: mainColor,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    resetPasswordCubit
                                        .changeConfirmPasswordVisibility();
                                  },
                                  icon: const Icon(
                                    Icons.visibility_off,
                                    color: mainColor,
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                          controller: resetPasswordCubit.codeController,
                          hintText: S.of(context).code,
                          textInputType: TextInputType.number,
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6),
                          ],
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return '';
                            } else if (value.trim().length < 4) {
                              return '';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomButton(
                    borderRadius: 8,
                    color: mainColor,
                    onTap: () {
                      if (resetPasswordCubit.key.currentState!.validate()) {
                        resetPasswordCubit.resetPassword(
                          email: forgetPasswordCubit.emailController.text,
                          newPassword:
                              resetPasswordCubit.newPasswordController.text,
                          confirmNewPassword: resetPasswordCubit
                              .confirmNewPasswordController.text,
                          code: resetPasswordCubit.codeController.text,
                        );
                      }
                    },
                    title: S.of(context).resetPassword,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
