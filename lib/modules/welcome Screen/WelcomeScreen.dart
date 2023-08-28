import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nemo_app/modules/Login%20Page/LoginScreen.dart';
import 'package:nemo_app/modules/Register%20Screen/RegisterScreen.dart';

import '../../shared/components/components.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children:
          [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 10.0,
                end: 10.0,
                top: 170.0,
                bottom: 130.0,
              ),
              child: Container(
                height: 250,
                child: Image(image: AssetImage('assets/welcome.png'),
                fit: BoxFit.cover,),
              ),
            ),
            Column(
              children:
              [
                //login
                defaultMaterialButton(
                  valid: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  },
                  text: 'Login',
                  haveBorder: false,
                  textColor:  Colors.white,
                ),
                SizedBox(
                  height: 20.0,
                ),
                //sign up
                defaultMaterialButton(
                  valid: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  text: 'Sign up',
                  borderColor: Color(0xFF3A2A08),
                  containerColor: Colors.white,
                  haveBorder: true,
                  textColor: Color(0xFF3A2A08),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
