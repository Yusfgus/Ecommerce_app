import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nemo_app/shared/components/components.dart';

import '../../shared/constants/constants.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
                title: "Favorite",
                backcolor: Colors.white,
                // backcolor:Color(0xFFEFBA3F),
                textColor: Colors.black),
            AnimationLimiter(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(_w / 200),
                physics: BouncingScrollPhysics(
                    parent: NeverScrollableScrollPhysics()),
                itemCount: userFavourites.length,
                itemBuilder: (BuildContext context, int index) {
                  var pro = AppProducts.where(
                      (product) => product['id'] == userFavourites[index]).toList();
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      delay: Duration(milliseconds: 100),
                      child: SlideAnimation(
                        duration: Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(milliseconds: 2500),
                          child: myItems(
                              proId: userFavourites[index],
                              imagePath: pro[0]['thumbnail'],
                              title: pro[0]['title'],
                              description: pro[0]['description'],
                              price: pro[0]['price'] * 1.0,
                              discount: pro[0]['discountPercentage'],
                              fav: true),
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
