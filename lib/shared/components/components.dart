import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/Login Page/LoginScreen.dart';

Widget defaultMaterialButton({
  required String text,
  bool haveBorder = false,
  bool isGoogle = false,
  Color borderColor = Colors.transparent,
  Color containerColor = const Color(0xFFFFB500),
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
                  fontSize: 22.0,
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
                      color: Color(0xFF005C6C),
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
              color: Color(0xFF005C6C),
            ),
          ),
        ),
      ),
    );


void showAlertDialog({
  required BuildContext context ,
  required String label,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: AlertDialog(
          title: Text('Hint'),
          content: Text(label),
          actions: [
            Center(
              child: Container(
                width: 120.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Color(0xFF005C6C),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: MaterialButton(
                  onPressed: (){
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