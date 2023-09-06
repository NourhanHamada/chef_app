import 'package:chef_app/view_model/database/networking/dio_helper.dart';
import 'package:chef_app/view_model/database/networking/end_points.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  ResetPasswordCubit get(context) => BlocProvider.of(context);

  var key = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  bool isPasswordOne = true;
  bool isPasswordTwo = true;

  changePasswordVisibility() {
    isPasswordOne = !isPasswordOne;
    emit(ChangeNewPasswordVisibilityState());
  }

  changeConfirmPasswordVisibility() {
    isPasswordTwo = !isPasswordTwo;
    emit(ChangeConfirmPasswordVisibilityState());
  }

  Future resetPassword({
    required String email,
    required String newPassword,
    required String confirmNewPassword,
    required String code,
  }) async {
    emit(ResetPasswordLoading());
    var data = {
      'email': email,
      'password': newPassword,
      'confirmPassword': confirmNewPassword,
      'code': code,
    };
    await DioHelper.patchData(
      endPoint: resetPasswordEndPoint,
      data: data,
    ).then((value) {
      debugPrint(value.data.toString());
      debugPrint('SUCCESS');
      emit(ResetPasswordSuccess());
    }).catchError((onError) {
      debugPrint(onError.response.toString());
      debugPrint('FAIL');
      emit(ResetPasswordFail());
    });
  }
}
