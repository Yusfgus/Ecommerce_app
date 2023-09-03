import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nemo_app/modules/Register%20Screen/RegisterScreen.dart';
import '../../layout/Home Layout/HomeLayout.dart';
import '../../shared/Cubit/cubit.dart';
import '../../shared/Cubit/states.dart';
import '../../shared/components/components.dart';
import '../../shared/constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<LoginScreen> {


  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
      listener:(context , index){},
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
                        image: AssetImage('assets/login.png'),
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
                      'Log in',
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
                    label: 'Username or Email',
                    controller: cubit.userController,
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
                    controller: cubit.passController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Password must not be empty';
                      }
                      return null;
                    },
                    prefix: Icons.lock_outline_rounded,
                    isObscure: cubit.isPassword,
                    keyboard: TextInputType.visiblePassword,
                    obscure: () {
                      cubit.passwordChange();
                    },
                    sufIcon: cubit.isPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 14.0,
                    ),
                    child: CheckboxListTile(
                      title: const Text("Remember me"),
                      value: cubit.isChecked,
                      onChanged: (bool? value) {
                        cubit.checkedChange(value!);
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  // Login button
                  defaultMaterialButton(
                    valid: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => HomeLayout()));
                      }
                    },
                    text: 'Login',
                    textColor: Colors.white,
                    haveBorder: true,
                    containerColor: Color(0xFFF3B812),
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
                          color: Color(0xFF3A2A08),
                          fontWeight: FontWeight.w500,
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
                            style: TextStyle(color: Color(0xFFF3B812)),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      } ,
    ),
    );
  }
}
