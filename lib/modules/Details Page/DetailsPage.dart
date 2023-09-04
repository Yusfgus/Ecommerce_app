import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/Home Layout/HomeLayout.dart';
import '../../shared/Cubit/cubit.dart';
import '../../shared/Cubit/states.dart';
import '../../shared/components/components.dart';
import '../../shared/constants/constants.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({
    required Map<String, dynamic> product,
  }) {
    myProduct = product;
    super.key;
  }
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {


  @override
  Widget build(BuildContext context) {
    int stock = myProduct['stock'];
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, index) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          cubit.inCart = userCart.contains(myProduct['id']);
          cubit.favorite = userFavourites.contains(myProduct['id']);
          cubit.max_items = myProduct['stock'];
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  CustomAppBar(
                    title: "Details Products",
                    backcolor: Colors.white,
                    textColor: Colors.black,
                    isPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomeLayout()));
                    },
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius
                                                .circular(15),
                                            color: Colors.grey.shade300,
                                            border: Border.all(
                                                color: Colors.amber)),
                                        clipBehavior: Clip
                                            .antiAliasWithSaveLayer,
                                        height: 350,
                                        width: double.infinity,
                                        child: Image(
                                          image: NetworkImage(cubit.isTap
                                              ? myProduct['images'][cubit
                                              .currentImage]
                                              : myProduct['thumbnail']),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10.0),
                                        child: Container(
                                          height: 280,
                                          width: 60,
                                          child: ListView.separated(
                                              itemBuilder: (context,
                                                  index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    cubit.imageClick(index);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(15),
                                                        border: Border.all(
                                                            color: Colors
                                                                .white,
                                                            width: 1)),
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    //padding: EdgeInsetsDirectional.only(end: 20),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          myProduct['images'][index]),
                                                      width: 60,
                                                      height: 40,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                );
                                              },
                                              separatorBuilder: (context,
                                                  index) {
                                                return SizedBox(
                                                  height: 10,
                                                );
                                              },
                                              itemCount: myProduct['images']
                                                  .length,
                                              scrollDirection: Axis
                                                  .vertical),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 15,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              cubit.imageClick(index);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(15),
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1,
                                                ),
                                                color: cubit.currentImage ==
                                                    index
                                                    ? Colors.grey
                                                    : Colors.white,
                                              ),
                                              width: cubit.currentImage ==
                                                  index ? 25 : 15,
                                              height: 15,
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            width: 6,
                                          );
                                        },
                                        itemCount: myProduct['images']
                                            .length,
                                        shrinkWrap: true),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                                  mainAxisAlignment: MainAxisAlignment
                                      .center,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      myProduct['title'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " (${myProduct['brand']})",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  myProduct['description'],
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.baseline,
                                  //textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      "\$ ${(myProduct['price'] -
                                          myProduct['price'] *
                                              (myProduct['discountPercentage'] /
                                                  100)).toStringAsFixed(
                                          2)} ",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional
                                          .only(top: 7),
                                      child: Text.rich(
                                        TextSpan(
                                          text: "\$ ${myProduct['price']
                                              .toString()}",
                                          style: TextStyle(
                                              color: Colors.red,
                                              decoration: TextDecoration
                                                  .lineThrough,
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
                                        InkWell(
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          onHighlightChanged: (value) {
                                            cubit.isHighlightedClick();
                                          },
                                          onTap: () {
                                            cubit.isPressedClick();
                                          },
                                          child: AnimatedContainer(
                                            margin: EdgeInsets.all(cubit.isHighlighted ? 0 : 2.5),
                                            height: cubit.isHighlighted ? 40 : 45,
                                            width: cubit.isHighlighted ? 50 : 45,
                                            curve: Curves.fastLinearToSlowEaseIn,
                                            duration: Duration(milliseconds: 300),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.3),
                                                  blurRadius: 20,
                                                  offset: Offset(5, 10),
                                                ),
                                              ],
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child:  IconButton(
                                                onPressed: () {
                                                  cubit.favorite? userFavourites.remove(myProduct['id']): userFavourites.add(myProduct['id']);
                                                  cubit.favouriteChange();
                                                },
                                                icon: cubit.favorite
                                                    ? Icon(
                                                  Icons.favorite,
                                                  color: Colors.amber,
                                                )
                                                    : Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.black,
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        // "rating":4.69
                                        Text(
                                          "Rate : ${myProduct["rating"]} ",
                                          style: TextStyle(
                                              color: Colors.grey.shade900,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        cubit.itemCountChange();
                                      },
                                      icon: cubit.itemCount == 1
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
                                      padding: const EdgeInsetsDirectional
                                          .only(
                                          start: 2, end: 2, top: 5),
                                      child: Text(
                                        "${cubit.itemCount}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        cubit.itemCountCondition();
                                      },
                                      icon: cubit.itemCount ==
                                          cubit.max_items
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
                                      const EdgeInsetsDirectional.only(
                                          top: 5, start: 3),
                                      child: Text(
                                        "Stock : ${stock - cubit.itemCount}",
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
                                          borderRadius: BorderRadius
                                              .circular(10.0),
                                          color: Colors.amber,
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {
                                            cubit.inCart? userCart.remove(myProduct['id']): userCart.add(myProduct['id']);
                                            cubit.inCartChange();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                5.0),
                                            child: Text(
                                              cubit.inCart? "Remove from Cart": "Add to Cart",
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
                      ),),),
                ],
              ),),
          );
        }
        ,),
    );

  }

}
