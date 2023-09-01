import 'package:chef_app/view_model/cubit/theme/theme_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() :super(ThemeInitial());

  ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  changeThemeMode(){
    isDark =!isDark;
    print('Theme!!!!!!!!!!!!!');
    emit(ChangeThemeState());
  }
}