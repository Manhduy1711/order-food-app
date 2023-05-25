import 'package:dhk_food/routing/home-route.dart';
import 'package:dhk_food/routing/routing-scaffold.dart';
import 'package:dhk_food/screen/auth/authenicate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User?>(context);
    if(user == null) {
      return const Authenicate();
    }
    else {
      print("DJKlasjkldjaklsdjaslkdjkl");
      return RoutingScaffold();
    }
  }
}
