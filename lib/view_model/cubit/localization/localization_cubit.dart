import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  LocalizationCubit get(context) => BlocProvider.of(context);


  bool isArabic = true;
  String local = 'ar';

  switchLang(bool value){
    isArabic = value;
    value = !value;
    if(isArabic == true) {
      local = 'ar';
    } else {
      local = 'en';
    }
    emit(SwitchLangState());
  }

  changeLanguageToArabic(){
    local = 'ar';
    emit(ChangeLanguageToArabic());
  }
  changeLanguageToEnglish(){
    local = 'en';
    emit(ChangeLanguageToEnglish());
  }
}
