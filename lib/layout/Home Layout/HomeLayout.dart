import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nemo_app/shared/Cubit/cubit.dart';

import '../../shared/Cubit/states.dart';

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}
//AppCubit cubit = AppCubit.get(context);
class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates > (
        listener: (context, state) {},
         builder: (context, state) {
           AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body:  cubit.currentScreen[cubit.currentIndex],
            bottomNavigationBar: Material(
              elevation: 20.0,
              child: CurvedNavigationBar(
                index: cubit.currentIndex,
                height: 50.0,
                items: [
                  Icon(
                    Icons.home,
                    color: Color(0xFFF3B812),
                  ),
                  Icon(
                    Icons.shopping_cart,
                    color: Color(0xFFF3B812),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Color(0xFFF3B812),
                  ),
                  Icon(
                    Icons.person,
                    color: Color(0xFFF3B812),
                  ),
                ],
                color: Colors.white,
                buttonBackgroundColor: Color(0xFF3A2A08),
                backgroundColor: Color(0xEA000000),
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                animationDuration: Duration(milliseconds: 300),
                animationCurve: Curves.easeInOut,
              ),
            ),
          );
         },
    ),
    );
  }
}
