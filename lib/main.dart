import 'package:chef_app/generated/l10n.dart';
import 'package:chef_app/view/core/dark_theme.dart';
import 'package:chef_app/view/core/light_theme.dart';
import 'package:chef_app/view/screens/splash_screen.dart';
import 'package:chef_app/view_model/cubit/Login/login_cubit.dart';
import 'package:chef_app/view_model/cubit/localization/localization_cubit.dart';
import 'package:chef_app/view_model/cubit/sign_up/sign_up_cubit.dart';
import 'package:chef_app/view_model/cubit/theme/theme_cubit.dart';
import 'package:chef_app/view_model/database/networking/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  DioHelper.init();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => LocalizationCubit(),
        )
      ],
          child: const MyApp(),),
  );
  // FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    LocalizationCubit localizationCubit = BlocProvider.of<LocalizationCubit>(context, listen: true);
    return MaterialApp(
      locale: Locale(localizationCubit.local),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: themeCubit.isDark ? ThemeMode.dark : ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
