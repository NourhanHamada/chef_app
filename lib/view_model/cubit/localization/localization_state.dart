part of 'localization_cubit.dart';

@immutable
abstract class LocalizationState {}

class LocalizationInitial extends LocalizationState {}

class ChangeLanguageToArabic extends LocalizationState {}

class ChangeLanguageToEnglish extends LocalizationState {}

class SwitchLangState extends LocalizationState {}