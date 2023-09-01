import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/colors.dart';

//ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.autoFocus,
    this.readOnly,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.validator,
    required this.controller,
    this.textInputType,
    this.isPassword,
    this.onTap,
    this.onChanged,
    this.inputFormatter
  });

  final bool? autoFocus;
  final bool? readOnly;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  TextEditingController controller;
  final String? Function(String?)? validator;
  TextInputType? textInputType;
  final bool? isPassword;
  final Function()? onTap;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onChanged: onChanged,
      autofocus: autoFocus ?? false,
      readOnly: readOnly ?? false,
      controller: controller,
      keyboardType: textInputType,
      obscureText: isPassword ?? false,
      inputFormatters: inputFormatter,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: greyBorder),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: greyBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: blackColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: orangeColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: const BorderSide(color: orangeColor),
        ),
        contentPadding: const EdgeInsets.all(16),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
