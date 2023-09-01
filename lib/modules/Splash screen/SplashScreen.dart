import 'package:flutter/material.dart';
import '../welcome Screen/WelcomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF3B812),//F3B812
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Nemo',
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Color(0xFF3A2A08),
                    fontSize: 96.0,
                    fontFamily: 'LilitaOne',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
