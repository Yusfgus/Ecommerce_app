import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nemo_app/layout/Home%20Layout/HomeLayout.dart';
import 'package:nemo_app/modules/Register%20Screen/RegisterScreen.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.hasData) {
          return HomeLayout();
        } else
          return RegisterScreen();
      },
    ));
  }
}
