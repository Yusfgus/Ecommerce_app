import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nemo_app/shared/components/components.dart';

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
                physics:
                BouncingScrollPhysics(parent: NeverScrollableScrollPhysics()),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: Duration(milliseconds: 100),
                    child: SlideAnimation(
                      duration: Duration(milliseconds: 2500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: FadeInAnimation(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: Duration(milliseconds: 2500),
                        child:myItems(
                            imagePath: "assets/myItemImage.png",
                            title: "Laptop",
                            description:
                            "Lorem Ipsum is simply dummy text of \nthe printing and typesetting industry",
                            price: 145000,
                            discount: 25),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
