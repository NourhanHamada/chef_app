part of 'meal_cubit.dart';

@immutable
abstract class MealState {}

class MealInitial extends MealState {}

class AddMealLoadingState extends MealState {}

class AddMealSuccessfulState extends MealState {}

class AddMealFailedState extends MealState {}

class GetMealsLoadingState extends MealState {}

class GetMealsSuccessfulState extends MealState {}

class GetMealsFailedState extends MealState {}
