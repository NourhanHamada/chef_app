import 'package:chef_app/view/constants/extentions.dart';
import 'package:chef_app/view/core/custom_text.dart';
import 'package:chef_app/view/screens/auth_screens/signin_screen.dart';
import 'package:chef_app/view_model/cubit/sign_up/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import '../../../generated/l10n.dart';
import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../constants/data.dart';
import '../../core/custom_button.dart';
import '../../core/custom_text_form_field.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    SignUpCubit signUpCubit = BlocProvider.of(
      context,
      listen: true,
    );
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    topBackground,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    S.of(context).welcome,
                    style: const TextStyle(
                      color: whiteColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: FormBuilder(
                key: signUpCubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      controller: signUpCubit.nameController,
                      textInputType: TextInputType.text,
                      hintText: S.of(context).name,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "name must be not Empty";
                        } else if (!RegExp(validationName)
                            .hasMatch(value.trim())) {
                          return "name is not Valid";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        signUpCubit.nameController.text = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: signUpCubit.phoneController,
                      textInputType: TextInputType.phone,
                      hintText: S.of(context).phone,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "phone must be not Empty";
                        } else if (!RegExp(validationPhone)
                            .hasMatch(value.trim())) {
                          return "phone is not Valid";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        signUpCubit.phoneController.text = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: signUpCubit.emailController,
                      textInputType: TextInputType.emailAddress,
                      hintText: S.of(context).email,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "email must be not Empty";
                        } else if (!RegExp(validationEmail)
                            .hasMatch(value.trim())) {
                          return "email is not Valid";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        signUpCubit.emailController.text = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: signUpCubit.passwordController,
                      isPassword: true,
                      textInputType: TextInputType.visiblePassword,
                      hintText: S.of(context).password,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "password must be not Empty";
                        } else if (!RegExp(validationPassword)
                            .hasMatch(value.trim())) {
                          return "password is not Valid";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        signUpCubit.passwordController.text = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: signUpCubit.confirmPasswordController,
                      textInputType: TextInputType.visiblePassword,
                      hintText: S.of(context).confirmPassword,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "confirm password must be not Empty";
                        } else if (!RegExp(validationPassword)
                            .hasMatch(value.trim())) {
                          return "confirm password is not Valid";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        signUpCubit.confirmPasswordController.text = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      onTap: () {},
                      controller: signUpCubit.locationController,
                      hintText: S.of(context).location,
                      validator: (value) {
                        // if (value!.trim().isEmpty) {
                        //   return "location must be not Empty";
                        // } else if (!RegExp(validationEmail)
                        //     .hasMatch(value.trim())) {
                        //   return "location is not Valid";
                        // }
                        return null;
                      },
                      onChanged: (value) {
                        signUpCubit.locationController.text = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: signUpCubit.brandNameController,
                      textInputType: TextInputType.emailAddress,
                      hintText: S.of(context).brandName,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "brand name must be not Empty";
                        } else if (!RegExp(validationName)
                            .hasMatch(value.trim())) {
                          return "brand is not Valid";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: signUpCubit.minChargeController,
                      textInputType: TextInputType.emailAddress,
                      hintText: S.of(context).minCharge,
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "min charge must be not Empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: signUpCubit.descController,
                      textInputType: TextInputType.emailAddress,
                      hintText: S.of(context).desc,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "description must be not Empty";
                        } else if (!RegExp(validationName)
                            .hasMatch(value.trim())) {
                          return "description is not Valid";
                        } else if (value.trim().length < 20) {
                          return 'description length must be at least 20 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomText(
                      text: S.of(context).frontId,
                      color: blackColor,
                    ),
                    FormBuilderImagePicker(
                      name: 'noCamera',
                      maxImages: 1,
                      availableImageSources: const [ImageSourceOption.gallery],
                      backgroundColor: greyBorder.withOpacity(.4),
                      iconColor: mainColor,
                      onChanged: (pickedImage) {
                        setState(() {
                          signUpCubit.frontIdImage = pickedImage?.first;
                          signUpCubit.frontIdController.text =
                              signUpCubit.frontIdImage!;
                        });
                      },
                    ),
                    CustomText(
                      text: S.of(context).backId,
                      color: blackColor,
                    ),
                    FormBuilderImagePicker(
                      name: 'noCamera',
                      maxImages: 1,
                      availableImageSources: const [ImageSourceOption.gallery],
                      backgroundColor: greyBorder.withOpacity(.4),
                      iconColor: mainColor,
                      onChanged: (pickedImage) {
                        setState(() {
                          signUpCubit.backIdImage = pickedImage?.first;
                          signUpCubit.backIdController.text =
                              signUpCubit.backIdImage!;
                        });
                      },
                    ),
                    CustomText(
                      text: S.of(context).profilePic,
                      color: blackColor,
                    ),
                    FormBuilderImagePicker(
                      name: 'noCamera',
                      maxImages: 1,
                      availableImageSources: const [ImageSourceOption.gallery],
                      backgroundColor: greyBorder.withOpacity(.4),
                      iconColor: mainColor,
                      onChanged: (pickedImage) {
                        setState(() {
                          signUpCubit.profileImage = pickedImage?.first;
                          signUpCubit.profilePicController.text =
                              signUpCubit.profileImage!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                  borderRadius: 10,
                  color: mainColor,
                  onTap: () {
                    if (signUpCubit.formKey.currentState!.validate()) {
                      debugPrint('Form Validate Successfully!!!!!');

                      signUpCubit.signUp(
                          name: signUpCubit.nameController.text,
                          phone: signUpCubit.phoneController.text,
                          email: signUpCubit.emailController.text,
                          password: signUpCubit.passwordController.text,
                          confirmPassword:
                              signUpCubit.confirmPasswordController.text,
                          brandName: signUpCubit.brandNameController.text,
                          minCharge: signUpCubit.minChargeController.text,
                          disc: signUpCubit.descController.text,
                          backId: signUpCubit.backIdController.text,
                          frontId: signUpCubit.frontIdController.text,
                          profile: signUpCubit.profilePicController.text);
                    } else {
                      debugPrint('FAIL!!!!!!');
                    }
                  },
                  title: S.of(context).signUp,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).alreadyHaveAccount,
                      style: const TextStyle(
                          color: greyBorder,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push(const LoginScreen());
                      },
                      child: Text(
                        S.of(context).signIn,
                        style: const TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
