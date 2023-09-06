import 'package:chef_app/view/constants/colors.dart';
import 'package:chef_app/view/constants/data.dart';
import 'package:chef_app/view/constants/extentions.dart';
import 'package:chef_app/view/core/custom_button.dart';
import 'package:chef_app/view/core/custom_text_form_field.dart';
import 'package:chef_app/view/screens/auth_screens/signup_screen.dart';
import 'package:chef_app/view/screens/layout/home_screen.dart';
import 'package:chef_app/view/widgets/login/login_custom_clipper.dart';
import 'package:chef_app/view_model/cubit/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';
import '../../../view_model/cubit/Login/login_cubit.dart';
import '../../core/custom_text.dart';
import '../../widgets/login/login_second_custom_clipper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = BlocProvider.of(
      context,
      listen: true,
    );
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            showDialog(
                context: context,
                barrierColor: Colors.transparent,
                builder: (BuildContext context) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: mainColor,
                    ),
                  );
                });
          }
          if(state is LoginSuccessState) {
            context.pop();
            context.push(const HomeScreen());
          }
          if(state is LoginFailState) {
            context.pop();
          }
        },
        builder: (context, state) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipPath(
                      clipper: LoginCustomClipper(),
                      child: Container(
                        color: mainColor,
                        width: double.infinity,
                        height: 400,
                      ),
                    ),
                    ClipPath(
                      clipper: LoginSecondCustomClipper(),
                      child: Container(
                        color: mainColorWithOpacity,
                        width: double.infinity,
                        height: 400,
                      ),
                    ),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: Image.asset(
                    //     topBackground,
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: CustomText(
                        text: S.of(context).welcomeBack,
                        color: whiteColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  // height: MediaQuery.sizeOf(context).height / 1.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          key: loginCubit.formKey,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                controller: loginCubit.emailController,
                                textInputType: TextInputType.emailAddress,
                                hintText: S.of(context).email,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return  S.of(context).emailMustBeNotEmpty;
                                  } else if (!RegExp(validationEmail)
                                      .hasMatch(value.trim())) {
                                    return S.of(context).emailIsNotValid;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              CustomTextFormField(
                                controller: loginCubit.passwordController,
                                textInputType: TextInputType.visiblePassword,
                                isPassword: loginCubit.isVisiblePassword,
                                hintText: S.of(context).password,
                                suffixIcon: loginCubit.isVisiblePassword
                                    ? GestureDetector(
                                        onTap: () {
                                          loginCubit.changePasswordVisibility();
                                        },
                                        child: const Icon(
                                          Icons.visibility,
                                          color: mainColor,
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          loginCubit.changePasswordVisibility();
                                        },
                                        child: const Icon(
                                          Icons.visibility_off,
                                          color: mainColor,
                                        ),
                                      ),
                                // validator: (value) {
                                //   if (value!.trim().isEmpty) {
                                //     return S.of(context).passwordMustBeNotEmpty;
                                //   } else if (!RegExp(validationPassword)
                                //       .hasMatch(value.trim())) {
                                //     return S.of(context).passwordIsNotValid;
                                //   }
                                //   return null;
                                // },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                         Text(
                          S.of(context).forgetPassword,
                          style: const TextStyle(
                            color: greyBorder,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 56,
                        ),
                        CustomButton(
                          borderRadius: 10,
                          color: mainColor,
                          onTap: () {

                            if (loginCubit.formKey.currentState!.validate()) {
                              loginCubit.signIn(
                                email: loginCubit.emailController.text,
                                password: loginCubit.passwordController.text,
                              );
                              debugPrint('Form Validate Successfully!!!!!');
                            } else {
                              debugPrint('FAIL!!!!!!');
                            }
                          },
                          title: S.of(context).signIn,
                        ),
                        const SizedBox(
                          height: 84,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                               S.of(context).dontHaveAccount,
                              style: const TextStyle(
                                  color: greyBorder,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                            InkWell(
                              onTap: () {
                                context.push(const SignUpScreen());
                              },
                              child: Text(
                                S.of(context).signUp,
                                style: const TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     IconButton(
                        //         onPressed: () {
                        //           themeCubit.changeThemeMode();
                        //         },
                        //         icon: themeCubit.isDark
                        //             ? const Icon(
                        //                 Icons.dark_mode,
                        //                 color: mainColor,
                        //               )
                        //             : const Icon(
                        //                 Icons.light_mode,
                        //                 color: mainColor,
                        //               )),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: whiteColor,
        elevation: 0,
        onPressed: () {
          themeCubit.changeThemeMode();
        },
        child: themeCubit.isDark
            ? const Icon(
                Icons.dark_mode,
                color: mainColor,
              )
            : const Icon(
                Icons.light_mode,
                color: mainColor,
              ),
      ),
    );
  }
}
