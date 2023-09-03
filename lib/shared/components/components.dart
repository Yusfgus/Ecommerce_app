import 'package:flutter/material.dart';

double? number = double.tryParse("12.34");

Widget defaultMaterialButton({
  required String text,
  bool haveBorder = false,
  bool isGoogle = false,
  Color borderColor = Colors.transparent,
  Color containerColor = const Color(0xFFF3B812),
  Color textColor = Colors.black,
  required Function()? valid,
  // required void Function() function,
}) =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 10.0,
        end: 10.0,
      ),
      child: Stack(
        children: [
          Container(
            width: 374,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: containerColor,
              border: haveBorder
                  ? Border.all(
                      color: borderColor, // Set the desired border color here
                      width: 2.0, // Set the desired border width here
                    )
                  : null,
            ),
            child: MaterialButton(
              onPressed: valid,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: isGoogle
                ? Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 20.0,
                    ),
                    child: Icon(
                      Icons.gpp_good_sharp,
                      color: Color(0xFF3A2A08),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );

Widget defaultTextFormField({
  required IconData prefix,
  required String label,
  required String? Function(String? value) validate,
  required TextEditingController controller,
  IconData? sufIcon,
  TextInputType? keyboard,
  bool isObscure = false,
  void Function()? obscure,
}) =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 25.0,
        end: 25.0,
      ),
      child: TextFormField(
        controller: controller,
        validator: validate,
        obscureText: isObscure,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: sufIcon != null
              ? IconButton(
                  onPressed: obscure,
                  icon: Icon(
                    sufIcon,
                  ))
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            // borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF3A2A08),
            ),
          ),
        ),
      ),
    );

Widget itemBuilder({
  required String url,
  required String productName,
  required int price,
  required double discount,
}) {
  // double? Price = double.tryParse(price);
  // double? Discount = double.tryParse(discount);
  // double? result = (Price! - Price! * (Discount! /100)) ;
  return Padding(
    padding: const EdgeInsetsDirectional.only(
      start: 5.0,
      end: 5.0,
      bottom: 12.0,
    ),
    child: Container(
      height: 260,
      width: 174,
      decoration: BoxDecoration(
        // color: Color(0xFFE2F2FA),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Color(0xFF3A2A08),
          // Set the desired border color here
          width: 1, // Set the desired border width here
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 160,
              width: double.infinity,
              // width: 182,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                image: NetworkImage(url),
                fit: BoxFit.cover,
                height: 150.0,
                // width: 130.0,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 5.0,
                ),
                child: Container(
                  width: 100.0,
                  child: Text(
                    productName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                    // width: 15.0,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  end: 5.0,
                ),
                child: Column(
                  children: [
                    Text(
                      "${(price - price * (discount / 100)).toStringAsFixed(1)} \$",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 13.0,
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "${price.toString()} \$",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12.0,
                        color: Colors.grey[900],
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget tapBarItem({
  required String label,
  double width = 100.0,
  void Function()? tapping,
  Color? coloor,
}) =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 2.0,
        end: 10.0,
      ),
      child: GestureDetector(
        onTap: tapping,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 10.0,
              ),
              child: Container(
                width: width,
                height: 35.0,
                decoration: BoxDecoration(
                  color: coloor,
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget UserInfo(
    {required String title,
    required String value,
    required IconData icon,
    required bool enable}) {
  final TextEditingController _textEditingController =
      TextEditingController(text: value);
  return Container(
    margin: EdgeInsets.only(top: 25),
    width: 345,
    //height: 50,
    // color: Colors.red,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          //the circle
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color.fromRGBO(217, 217, 217, 1), // Set the border color

              width: 3.0, // Set the border width
            ),
          ),

          child: Icon(
            icon,
            color: Color.fromRGBO(217, 217, 217, 1),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Color.fromRGBO(125, 125, 125, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              // Text(value,
              //     style: TextStyle(
              //         color: Color.fromRGBO(58, 42, 8, 1),
              //         fontSize: 18,
              //         fontWeight: FontWeight.w500)),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  //width: 20,  // Set the desired width
                  height: 25, // Set the desired height
                  //color: Colors.red,
                  child: TextField(
                    enabled: enable,
                    controller: _textEditingController,
                    onChanged: (value) {
                      // Handle the text value
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    textAlignVertical: TextAlignVertical.top,
                    textAlign: TextAlign.start,
                  ))
            ],
          ),
        ),
        //edit? IconButton(onPressed: () {}, icon: Icon(Icons.mode_edit_outlined), color: Color.fromRGBO(127, 127, 127, 1),) : SizedBox(),
        // IconButton(onPressed: () {},
        //   icon: Icon(Icons.mode_edit_outlined),
        //   color: Color.fromRGBO(127, 127, 127, 1),),
      ],
    ),
  );
}

Widget CustomAppBar({
  required String title,
  required Color backcolor,
  required Color textColor,
  void Function()? isPressed,
}) =>
    Container(
      height: 60,
      decoration: BoxDecoration(
        color: backcolor,
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
                  onPressed: isPressed,
                  icon: Icon(Icons.arrow_back_ios_rounded)),
              Expanded(
                  child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              )),
            ]),
          )),
    );

Widget myItems(
        {required String imagePath,
        required String title,
        required String description,
        required double price,
        required double discount}) =>
    Dismissible(
      key: Key("gus"),
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,

                //color: Color(0xFFEAB96C),

                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(0, 10),
              ),
            ],
            color: Colors.white
            //color: Color(0xFFFDF5D2),

            //border: Border.all(color: Colors.black12, width: 2),
            ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 110,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                color: Colors.green,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          // height: 20,
                          // width: double.infinity,
                          // color: Colors.red,
                          child: Text(
                            title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$ ${price - price * (discount / 100)}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "\$ ${price}",
                              style: TextStyle(
                                color: Color(0xff7d7d7d),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        )
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                        color: Color(0xff7d7d7d),
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {},
    );
