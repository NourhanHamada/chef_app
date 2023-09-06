import 'package:chef_app/view/constants/colors.dart';
import 'package:chef_app/view_model/cubit/theme/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

//ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign = TextAlign.start,
    this.height = 1.5,
    this.textDecoration = TextDecoration.none,
  });

  final String text;
  Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  TextAlign textAlign;
  double height;
  TextDecoration textDecoration;
  Color? decorationColor;

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of(context, listen: true);
    return Text(
      text.tr().toString(),
      textAlign: textAlign,
      style: GoogleFonts.lato(
          color: color ?? (themeCubit.isDark ? whiteColor : blackColor),
          fontSize: fontSize ?? 14,
          fontWeight: fontWeight ?? FontWeight.w500,
        decoration: textDecoration,
        decorationColor: decorationColor,
        decorationThickness: 1.5,
        height: height,
      ),
    );
  }
}
