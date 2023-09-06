import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  LocalizationCubit get(context) => BlocProvider.of(context);

  String local = 'en';

  changeLanguageToArabic(){
    local = 'ar';
    print(local);
    emit(ChangeLanguageToArabic());
  }
  changeLanguageToEnglish(){
    local = 'en';
    print(local);
    emit(ChangeLanguageToEnglish());
  }
}
