import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/Login Page/LoginScreen.dart';

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

void showAlertDialog({
  required BuildContext context,
  required String label,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: AlertDialog(
          title: Text('Warning'),
          content: Text(label),
          actions: [
            Center(
              child: Container(
                width: 120.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Color(0xFF3A2A08),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget ItemBuilder() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 5.0,
        end: 5.0,
        bottom: 30.0,
      ),
      child: Container(
        height: 200,
        width: 174,
        decoration: BoxDecoration(
          color: Color(0xFFE2F2FA),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Image(
              image: NetworkImage(
                  'https://www.asus.com/media/Odin/Websites/global/Series/9.png'),
              fit: BoxFit.cover,
              height: 150.0,
              width: 130.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 5.0,
                  ),
                  child: Container(
                    width: 100.0,
                    child: Text(
                      'Producfweqfwt Name',
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
                  child: Text(
                    '12220\$',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );


Widget UserInfo(
    {required String title,
    required String value,
    required IconData icon}) => Container(
  margin: EdgeInsets.only(top: 25),
    width: 345,
    height: 50,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Color.fromRGBO(125, 125, 125, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              Text(value,
                  style: TextStyle(
                      color: Color.fromRGBO(58, 42, 8, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        //edit? IconButton(onPressed: () {}, icon: Icon(Icons.mode_edit_outlined), color: Color.fromRGBO(127, 127, 127, 1),) : SizedBox(),
        IconButton(onPressed: () {}, icon: Icon(Icons.mode_edit_outlined), color: Color.fromRGBO(127, 127, 127, 1),),
      ],
    ),
  );
