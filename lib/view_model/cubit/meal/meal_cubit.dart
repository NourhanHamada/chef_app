import 'package:chef_app/view_model/database/networking/dio_helper.dart';
import 'package:chef_app/view_model/database/networking/end_points.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealInitial());

  MealCubit get(context) => BlocProvider.of(context);

  deleteMeal() {}

  addMeal({
    required String name,
  }) async {
    var data = {
      'name': 'Meat',
      'description': '',
      'price': '250',
      'category': 'Beef',
      'howToSell': 'number',
    };
    emit(AddMealLoadingState());
    await DioHelper.postData(endPoint: addMealEndPoint, data: data)
        .then((value) {
      debugPrint(value.data.toString());
      debugPrint('SUCCESS');
      emit(AddMealSuccessfulState());
    }).catchError((onError) {
      debugPrint(onError.response.data.toString());
      debugPrint('FAIL');
      emit(AddMealFailedState());
    });
  }

  getMeals() async {
    var token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZTBhNmY0NjEwNjJmMzhmYzg3MjlmNiIsImVtYWlsIjoiYW5hcy5yb3V0ZUBnbWFpbC5jb20iLCJuYW1lIjoiQW5hcyIsImlhdCI6MTY5NDAzODAyMH0.FpW3ujuFjuFuB-Gg_ha_fkLsFad2z-VeKkFRMRC4EHM';
    emit(GetMealsLoadingState());
    await DioHelper.getData(
      endPoint: getMealsEndPoint,
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZTBhNmY0NjEwNjJmMzhmYzg3MjlmNiIsImVtYWlsIjoiYW5hcy5yb3V0ZUBnbWFpbC5jb20iLCJuYW1lIjoiQW5hcyIsImlhdCI6MTY5NDAzODAyMH0.FpW3ujuFjuFuB-Gg_ha_fkLsFad2z-VeKkFRMRC4EHM',
    ).then((value) {
      debugPrint('SUCCESS');
      emit(AddMealSuccessfulState());
      emit(GetMealsSuccessfulState());
    }).catchError((onError) {
      debugPrint(onError.response.data.toString());
      debugPrint('FAIL');
      emit(GetMealsFailedState());
    });
  }
}
