import 'package:chef_app/view_model/database/networking/dio_helper.dart';
import 'package:chef_app/view_model/database/networking/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  ForgetPasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();

  Future forgetPasswordSendCode({
    required String email,
  }) async {
    emit(ForgetPasswordLoading());
    var data = {
      'email': email,
    };
    await DioHelper.postData(
      endPoint: forgetPasswordSendCodeEndPoint,
      data: data,
    ).then((value) {
      debugPrint('SUCCESS');
      debugPrint(value.data.toString());
      emit(ForgetPasswordSuccess());
    }).catchError((onError) {
      debugPrint('FAIL');
      debugPrint(onError.toString());
      emit(ForgetPasswordFail());
    });
  }
}
