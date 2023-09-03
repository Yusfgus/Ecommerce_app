import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:nemo_app/shared/components/components.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool bottomSheet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      body: Column(
        children: [
          CustomAppBar(
              title: "My Cart",
              backcolor: Colors.white,
              textColor: Colors.black),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              //physics: NeverScrollableScrollPhysics(),
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
          ),
          DottedBorder(
            dashPattern: [20, 15],
            color: Colors.grey.shade400,
            strokeWidth: 2,
            child: Container(
              width: double.infinity,
              height: 80,
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 25.0),
                    child: Text(
                      "Total : ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 70),
                    child: Text(
                      "\$ 450",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (bottomSheet) {
            Navigator.pop(context);
            bottomSheet = false;
          } else {
            scaffoldKey.currentState?.showBottomSheet(elevation: 20, (context) {
              return Container(
                // height: 300,
                width: double.infinity,
                color: Colors.white,

                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 20, right: 20),
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      "Laptop",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.grey.shade700),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: double.maxFinite,
                                      ),
                                    ),
                                    Text(
                                      "\$ 500",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: 9),
                      ),
                      DottedBorder(
                        dashPattern: [20, 15],
                        color: Colors.grey.shade400,
                        strokeWidth: 2,
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 25.0),
                                child: Text(
                                  "Total : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: double.maxFinite,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(end: 70),
                                child: Text(
                                  "\$ 450",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
            bottomSheet = true;
          }
          //setState(() {});
        },
        backgroundColor: Colors.white,
        child: bottomSheet
            ? Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              )
            : Icon(
                Icons.keyboard_arrow_up_outlined,
                color: Colors.grey,
                shadows: [Shadow(color: Colors.white, blurRadius: 0)],
              ),
      ),
    ));
  }
}
