import 'package:chef_app/view/constants/colors.dart';
import 'package:chef_app/view/constants/data.dart';
import 'package:chef_app/view/constants/extentions.dart';
import 'package:chef_app/view/core/custom_button.dart';
import 'package:chef_app/view/core/custom_text.dart';
import 'package:chef_app/view/core/custom_text_form_field.dart';
import 'package:chef_app/view/screens/profile_screens/profile_picture.dart';
import 'package:chef_app/view_model/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EditProfileCubit editProfileCubit =
        BlocProvider.of<EditProfileCubit>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: S.of(context).editProfile,
          color: whiteColor,
          fontSize: 16,
        ),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: ListView(
            children: [
              ProfilePicture(
                //todo: change profile pic!!!!!!
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                key: editProfileCubit.key,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: editProfileCubit.newNameController,
                      hintText: S.of(context).name,
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '';
                        } else if (!RegExp(validationName)
                            .hasMatch(value.trim())) {
                          return '';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: editProfileCubit.newPhoneController,
                      hintText: S.of(context).phone,
                      textInputType: TextInputType.phone,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '';
                        } else if (!RegExp(validationPhone)
                            .hasMatch(value.trim())) {
                          return '';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: editProfileCubit.newBrandNameController,
                      hintText: S.of(context).brandName,
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '';
                        } else if (!RegExp(validationName)
                            .hasMatch(value.trim())) {
                          return '';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: editProfileCubit.newMinimumChargeController,
                      hintText: S.of(context).minCharge,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '';
                        } else if (value.trim().length < 3) {
                          return '';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: editProfileCubit.newDescController,
                      hintText: S.of(context).desc,
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '';
                        } else if (value.trim().length < 20) {
                          return '';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: editProfileCubit.newLocationController,
                      hintText: S.of(context).location,
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                borderRadius: 8,
                color: mainColor,
                onTap: () {},
                title: S.of(context).update,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


