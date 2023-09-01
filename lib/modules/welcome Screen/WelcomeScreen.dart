import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nemo_app/modules/Login%20Page/LoginScreen.dart';
import 'package:nemo_app/modules/Register%20Screen/RegisterScreen.dart';

import '../../shared/components/components.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenHeight = mediaQueryData.size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onVerticalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! > 0) {
            // Swipe down
            if (pageController.page!.toInt() > 0) {
              pageController.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          } else if (details.primaryVelocity! < 0) {
            // Swipe up
            if (pageController.page!.toInt() < 2) {
              pageController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          }
        },
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            // First page
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFDEBB9),//F3B812
                  borderRadius: BorderRadius.circular(40.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF020202).withOpacity(1.0),
                      spreadRadius: 3,
                      blurRadius: 12,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: screenHeight * 0.47,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 30.0,
                            top: 11.0,
                          end: 50.0,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Nemo',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                color: Color(0xFF3A2A08),
                                fontSize: 70.0,
                                fontFamily: 'LilitaOne',
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Unlock a world of seamless shopping with our e-commerce app,'
                                ' where style meets convenience at your fingertips.',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                             fontStyle: FontStyle.italic,
                             fontFamily: 'BebasNeue',
                            ),
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                     width: double.maxFinite,
                     height: screenHeight * 0.50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image1.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Second page
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF6F0D8),//F3B812
                  borderRadius: BorderRadius.circular(40.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF020202).withOpacity(1.0),
                      spreadRadius: 3,
                      blurRadius: 12,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: screenHeight * 0.47,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 30.0,
                          top: 120.0,
                          end: 50.0,
                        ),
                        child: Column(
                          children: [

                            SizedBox(
                              height: 20,
                            ),
                            Text('Now you can buy our products through our application Nemo, more surprises are waiting for you there, come on...',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'BebasNeue',
                              ),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: screenHeight * 0.50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image2.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Third page
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 10.0,
                      end: 10.0,
                      top: 70.0,
                      bottom: 130.0,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Welcome back ! ...',
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Color(0xFF3A2A08),
                            fontSize: 50.0,
                            fontFamily: 'LilitaOne',
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          height: 250,
                          child: Image(
                            image: AssetImage('assets/welcome.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      // Login
                      defaultMaterialButton(
                        valid: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        text: 'Login',
                        haveBorder: false,
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      // Sign up
                      defaultMaterialButton(
                        valid: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
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
          ],
        ),
      ),
    );
  }
}