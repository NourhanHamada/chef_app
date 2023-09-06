part of 'reset_password_cubit.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ChangeNewPasswordVisibilityState extends ResetPasswordState {}

class ChangeConfirmPasswordVisibilityState extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordFail extends ResetPasswordState {}
