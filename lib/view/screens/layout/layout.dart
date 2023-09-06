import 'package:chef_app/view/constants/colors.dart';
import 'package:chef_app/view_model/cubit/layout/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutCubit layoutCubit = BlocProvider.of(context, listen: true);
    return Scaffold(
      body: layoutCubit.screens[layoutCubit.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: layoutCubit.bottomNavBarItems,
        currentIndex: layoutCubit.currentIndex,
        onTap: (index){
          layoutCubit.changeIndex(index: index);
        },
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: mainColor,
        unselectedItemColor: greyBorder,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600
        ),
        unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
