import 'package:chef_app/view_model/database/networking/dio_helper.dart';
import 'package:chef_app/view_model/database/networking/end_points.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  SignUpCubit get(context) => BlocProvider.of(context);

  // final formKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormBuilderState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController minChargeController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController frontIdController = TextEditingController();
  TextEditingController backIdController = TextEditingController();
  TextEditingController profilePicController = TextEditingController();
  String? frontIdImage;
  String? backIdImage;
  String? profileImage;

  signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    // required String location,
    required String brandName,
    required String minCharge,
    required String disc,
    required String frontId,
    required String backId,
    required String profile,
  }) async {
    emit(SignUpLoadingState());
    var data = {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      // 'location': '{"name":"methalfa","address":"meet halfa","coordinates":[1214451511,12541845]}',
      'location':
          '{"name": "Egypt", "address": "Cairo", "coordinates": [121,121]}',
      'brandName': brandName,
      'minCharge': minCharge,
      'disc': disc,
      // 'frontId': logo,
      'frontId': frontId,
      'backId': backId,
      'profilePic': profile,
    };
    await DioHelper.postData(
      endPoint: signUpEndPoint,
      data: data,
    ).then((value) {
      debugPrint(value.data);
      emit(SignUpSuccessState());
    }).catchError((onError) {
      debugPrint(onError.response.toString());
      emit(SignUpFailState());
    });
  }
}
