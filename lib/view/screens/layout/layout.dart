import 'package:chef_app/view/constants/colors.dart';
import 'package:chef_app/view_model/cubit/layout/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../constants/assets.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutCubit layoutCubit = BlocProvider.of(context, listen: true);
    return Scaffold(
      body: layoutCubit.screens[layoutCubit.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items:  [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Image.asset(homeEnable, color: primaryColor,),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Image.asset(homeDisable),
              ),
              label: S.of(context).meal
          ),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Image.asset(profileEnable),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Image.asset(profileDisable),
              ),
              label: S.of(context).profile
          ),
        ],
        currentIndex: layoutCubit.currentIndex,
        onTap: (index){
          layoutCubit.changeIndex(index: index);
        },
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: primaryColor,
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
