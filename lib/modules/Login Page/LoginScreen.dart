import 'package:flutter/material.dart';
import 'package:nemo_app/modules/Login%20Page/LoginScreen.dart';
import 'package:nemo_app/modules/Register%20Screen/RegisterScreen.dart';
import '../../layout/Home Layout/HomeLayout.dart';
import '../../shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<LoginScreen> {
  var userController = TextEditingController();

  var passController = TextEditingController();

  bool isPassword = true;

  bool isChecked = false;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 10.0,
                  end: 10.0,
                  top: 20.0,
                ),
                child: Center(
                  child: Image(
                    image: AssetImage('assets/login.png'),
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
              Text(
                'Log in',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'LilitaOne',
                  color: Color(0xFF0B181A),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              //username
              defaultTextFormField(
                label: 'Username or Email',
                controller: userController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Username/Email must not be empty';
                  }
                  return null;
                },
                prefix: Icons.person_outline,
                keyboard: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 15.0,
              ),
              //password
              defaultTextFormField(
                label: 'Password',
                controller: passController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Password must not be empty';
                  }
                  return null;
                },
                prefix: Icons.lock_outline_rounded,
                isObscure: isPassword,
                keyboard: TextInputType.visiblePassword,
                obscure: () {
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
                sufIcon: isPassword ? Icons.visibility : Icons.visibility_off,
              ),
              CheckboxListTile(
                title: const Text("Remember me"),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(
                height: 60.0,
              ),
              // Login button
              defaultMaterialButton(
                valid: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeLayout()));
                  }
                },
                text: 'Login',
                textColor: Colors.white,
                haveBorder: true,
                containerColor: Color(0xFFFFB500),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Does not have account?...',
                    style: TextStyle(
                      color: Color(0xFF005C6C),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Color(0xFFFFB500)),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
