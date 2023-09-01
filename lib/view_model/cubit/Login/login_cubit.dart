import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../database/networking/dio_helper.dart';
import '../../database/networking/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>(debugLabel: '');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String errorMessage;
  signIn({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    var data = {
      "email": email,
      "password": password,
    };
    await DioHelper.postData(
      endPoint: signInEndPoint,
      data: data,
    ).then((value) {
      debugPrint(value.data.toString());
      debugPrint('Success');
      emit(LoginSuccessState());
    }).catchError((onError) {
      debugPrint(onError.response.data.toString());
      errorMessage = onError.response.data['ErrorMessage'].toString();
      debugPrint('errorMessage ======> $errorMessage');
      debugPrint('Fail');
      emit(LoginFailState());
    });
  }
  
  bool isVisiblePassword = true;
  changePasswordVisibility(){
    isVisiblePassword = !isVisiblePassword;
    emit(ChangePasswordVisibilityState());
  }
}
