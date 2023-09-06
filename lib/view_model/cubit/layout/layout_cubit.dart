import 'package:chef_app/view/screens/layout/home_screen.dart';
import 'package:chef_app/view/screens/layout/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
  ];


  // List<BottomNavigationBarItem> bottomNavBarItems = [
  //    BottomNavigationBarItem(
  //     activeIcon: Padding(
  //       padding: const EdgeInsets.only(bottom: 8),
  //       child: Image.asset(homeEnable, color: primaryColor,),
  //     ),
  //     icon: Padding(
  //       padding: const EdgeInsets.only(bottom: 8),
  //       child: Image.asset(homeDisable),
  //     ),
  //     label: S.of(context).meal
  //   ),
  //   BottomNavigationBarItem(
  //       activeIcon: Padding(
  //         padding: const EdgeInsets.only(bottom: 8),
  //         child: Image.asset(profileEnable),
  //       ),
  //       icon: Padding(
  //         padding: const EdgeInsets.only(bottom: 8),
  //         child: Image.asset(profileDisable),
  //       ),
  //       label: 'Profile'
  //   ),
  // ];

  changeIndex({required int index}) {
    currentIndex = index;
    emit(ChangeIndexState());
  }
}
