import 'package:chef_app/view_model/database/networking/dio_helper.dart';
import 'package:chef_app/view_model/database/networking/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  ForgetPasswordCubit get(context) => BlocProvider.of(context);

  var key = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  late String errorMessage;
  Future forgetPasswordSendCode({
    required String email,
  }) async {
    emit(ForgetPasswordLoading());
    var data = {
      'email': email,
      // 'email': 'nourhan.hamada996@gmail.com',
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
      // errorMessage = onError.response.data['ErrorMessage'].toString();
      // print('error---------> $errorMessage');
      debugPrint(onError.response.toString());
      emit(ForgetPasswordFail());
    });
  }
}
