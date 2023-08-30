import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool favorite = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Center(
              child: Row(children: [
                IconButton(
                    onPressed: () {
                      print("Back Button Pressed (Detail Page)");
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                Expanded(
                    child: Text(
                  "Detail Products",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ]),
            )),
      ),
      Expanded(
        child: Container(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: NetworkImage(
                      'https://www.asus.com/media/Odin/Websites/global/Series/9.png'),
                  fit: BoxFit.fitHeight,
                  height: 350,
                  width: double.infinity,
                ),
                Text(
                  "Lenovo WH-100xM4",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever ",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "\$ 1806",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$ 1906",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.minPositive,
                      ),
                    ),
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
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_circle,
                          color: Colors.amber,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 18, end: 12, top: 5),
                        child: Text(
                          "1",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle,
                          size: 30,
                          color: Colors.amber,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.only(top: 5, start: 3),
                        child: Text(
                          "Stock : 17",
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]));
  }
}
