import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
late final Map<String,dynamic> myProduct;
class DetailsPage extends StatefulWidget {

    DetailsPage({
    required Map<String,dynamic> product,
}){
    myProduct = product;
    super.key;
  }

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isTap = false;
  bool favorite = true;
  int itemCount = 1;
  int currentImage = 0;
  int stock = myProduct['stock'];
  final int max_items = myProduct['stock'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        CustomAppBar(
            title: "Details Products",
            backcolor: Colors.white,
            textColor: Colors.black),
        Expanded(
            child: Container(
                child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image(
                    image: NetworkImage(
                        isTap? myProduct['images'][currentImage] : myProduct['thumbnail']),
                    fit: BoxFit.fitHeight,
                    height: 330,
                    width: double.infinity,
                  ),
                  Container(
                    height: 300,
                    width: 70,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                print(
                                    "pressed in this pic num $index that will be show");
                                currentImage = index;
                                isTap = true;
                              });
                            },
                            child: Image(
                              image: NetworkImage(
                                  myProduct['images'][index]),
                              width: 70,
                              height: 60,
                              fit: BoxFit.fitHeight,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: myProduct['images'].length,
                        scrollDirection: Axis.vertical),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: 10,
                child: Align(
                  alignment: Alignment.center,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentImage = index;
                              print("currentImage $currentImage");
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              color: currentImage == index
                                  ? Colors.grey
                                  : Colors.white,
                            ),
                            width: 10,
                            height: 10,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 6,
                        );
                      },
                      itemCount: myProduct['images'].length,
                      shrinkWrap: true),
                ),
              ),
              Text(
                myProduct['title'],
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                myProduct['description'],
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.baseline,
                //textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                  (myProduct['price'] - myProduct['price'] * (myProduct['discountPercentage'] / 100)).toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 7),
                    child: Text.rich(
                      TextSpan(
                       text : myProduct['price'].toString(),
                        style: TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.minPositive,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              favorite = !favorite;
                            });
                          },
                          icon: favorite
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.amber,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                )),
                      Text(
                        "+800 people favorite",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (itemCount != 1) itemCount--;
                          });
                        },
                        icon: itemCount == 1
                            ? Icon(
                                Icons.remove_circle_outline,
                                size: 30,
                                color: Colors.grey,
                              )
                            : Icon(
                                Icons.remove_circle,
                                color: Colors.amber,
                                size: 30,
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 18, end: 12, top: 5),
                        child: Text(
                          "$itemCount",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (itemCount < max_items) itemCount++;
                          });
                        },
                        icon: itemCount == max_items
                            ? Icon(
                                Icons.add_circle_outline_rounded,
                                size: 30,
                                color: Colors.grey,
                              )
                            : Icon(
                                Icons.add_circle,
                                size: 30,
                                color: Colors.amber,
                              ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.only(top: 5, start: 3),
                        child: Text(
                          "Stock : ${stock - itemCount}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.amber,
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Add To Cart",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        )))
      ],
    )));
  }
}
