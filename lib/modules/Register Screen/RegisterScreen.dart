import 'package:flutter/material.dart';
import 'package:nemo_app/modules/Login%20Page/LoginScreen.dart';
import '../../shared/components/components.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    image: AssetImage('assets/register.png'),
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'LilitaOne',
                  color: Color(0xFF3A2A08),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              //username
              defaultTextFormField(
                label: 'Username',
                controller: userController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Username must not be empty';
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
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 14.0,
                ),
                child: CheckboxListTile(
                  title: const Text("Remember me"),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              // sign up button
              defaultMaterialButton(
                valid: () {
                  if (formKey.currentState!.validate()) {
                    showAlertDialog(context : context ,label : 'Registration Done Successfully!');
                  }
                },
                text: 'Sign up',
                textColor: Colors.white,
                haveBorder: true,
                containerColor: Color(0xFFF3B812),
              ),
              SizedBox(
                height: 20.0,
              ),
              // sign up with google button
              defaultMaterialButton(
                valid: () {},
                text: 'Sign up with Google',
                borderColor: Color(0xFF3A2A08),
                containerColor: Colors.white,
                haveBorder: true,
                textColor:Color(0xFF3A2A08),
                isGoogle: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'already have account?...',
                    style: TextStyle(
                      color:Color(0xFF3A2A08),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(color: Color(0xFFF3B812)),
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
