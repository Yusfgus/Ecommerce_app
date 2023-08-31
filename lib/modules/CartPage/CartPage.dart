import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nemo_app/shared/components/components.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(
                    title: "Favorite",
                    backcolor: Colors.white,
                    textColor: Colors.black),
                ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => myItems(
                      imagePath: "assets/myItemImage.png",
                      title: "Laptop",
                      description:
                      "Lorem Ipsum is simply dummy text of \nthe printing and typesetting industry",
                      price: 150,
                      discount: 20),
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 0,
                    );
                  },
                  itemCount: 10,
                ),
              ],
            ),
          ),
        ));
  }
}
