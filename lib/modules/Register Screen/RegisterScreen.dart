import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nemo_app/modules/Login%20Page/LoginScreen.dart';

import '../../shared/Cubit/cubit.dart';
import '../../shared/Cubit/states.dart';
import '../../shared/components/components.dart';
import '../../shared/constants/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  var userController = TextEditingController();
  var passController = TextEditingController();

  void SignUp() async {
    print(userController.text);
    print(
        "=====================================================================");
    print(passController.text);
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userController.text.trim(),
        password: passController.text.trim()).then((value) {
          Navigator.of(context).pushNamed('A');
          user = FirebaseAuth.instance.currentUser!;
          username = user.email!;
        })
        .catchError((error){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => RegisterScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, index) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
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
                    SlideFadeTransition(
                      curve: Curves.elasticOut,
                      delayStart: Duration(milliseconds: 700),
                      animationDuration: Duration(milliseconds: 1200),
                      offset: 2.5,
                      direction: Direction.horizontal,
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'LilitaOne',
                          color: Color(0xFF3A2A08),
                        ),
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
                      isObscure: cubit.isPasswordReg,
                      keyboard: TextInputType.visiblePassword,
                      obscure: () {
                        cubit.passwordChangeReg();
                      },
                      sufIcon: cubit.isPasswordReg
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 14.0,
                      ),
                      child: CheckboxListTile(
                        title: const Text("Remember me"),
                        value: cubit.isCheckedReg,
                        onChanged: (bool? value) {
                          cubit.checkedChangeReg(value!);
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
                          SignUp();
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
                      textColor: Color(0xFF3A2A08),
                      isGoogle: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'already have account?...',
                          style: TextStyle(
                            color: Color(0xFF3A2A08),
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
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
