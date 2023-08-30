import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.currentScreen[cubit.currentIndex],
            bottomNavigationBar: Material(
              elevation: 20.0,
              child: CurvedNavigationBar(
                index: cubit.currentIndex,
                height: 50.0,
                items: [
                  Icon(
                    Icons.home,
                    color: cubit.currentIndex == 0
                        ? Color(0xFFF3B812)
                        : Colors.grey,
                  ),
                  Icon(
                    Icons.shopping_cart,
                    color: cubit.currentIndex == 1
                        ? Color(0xFFF3B812)
                        : Colors.grey,
                  ),
                  Icon(
                    Icons.favorite,
                    color: cubit.currentIndex == 2
                        ? Color(0xFFF3B812)
                        : Colors.grey,
                  ),
                  Icon(
                    Icons.person,
                    color: cubit.currentIndex == 3
                        ? Color(0xFFF3B812)
                        : Colors.grey,
                  ),
                ],
                color: Colors.white,

                buttonBackgroundColor: Colors.grey.shade100,
                backgroundColor: Colors.amber.shade100,
                // buttonBackgroundColor: Colors.amber.shade100,
                // backgroundColor: Colors.grey.shade400,
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
