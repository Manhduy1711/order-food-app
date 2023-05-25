import 'package:dhk_food/screen/auth/login-screen.dart';
import 'package:dhk_food/screen/auth/register-screen.dart';
import 'package:flutter/material.dart';

class Authenicate extends StatefulWidget {
  const Authenicate({Key? key}) : super(key: key);

  @override
  State<Authenicate> createState() => _AuthenicateState();
}

class _AuthenicateState extends State<Authenicate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn) {
      return LoginScreen(toggleView: toggleView,);
    }
    else {
      return RegisterScreen(toggleView: toggleView);
    }
  }
}
