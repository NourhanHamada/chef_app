import 'package:chef_app/view/constants/assets.dart';
import 'package:chef_app/view/constants/colors.dart';
import 'package:chef_app/view/core/custom_button.dart';
import 'package:chef_app/view/core/custom_text.dart';
import 'package:chef_app/view_model/cubit/meal/meal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MealCubit mealCubit = BlocProvider.of(context, listen: true);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: ListTile(
                        leading: Image.asset(
                          logo2,
                        ),
                        title: CustomText(
                          text: 'New Meal',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Meal Description',
                              fontSize: 14,
                              color: greyBorder,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomText(
                              text: '200 LE',
                              fontSize: 14,
                              color: greyBorder,
                            ),
                          ],
                        ),
                        trailing: GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            width: 50,
                            height: 50,
                            child: const Icon(Icons.close, color: whiteColor, size: 32,),
                          ),
                        ),

                      ),
                    );
                  }),
            ),
            CustomButton(
              borderRadius: 8,
              color: mainColor,
              onTap: () {
                mealCubit.getMeals();
              },
              title: S.of(context).addMeal,
            )
          ],
        ),
      ),
    );
  }
}
