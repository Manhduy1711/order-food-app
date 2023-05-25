import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhk_food/providers/cart-provider.dart';
import 'package:dhk_food/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting"), centerTitle: true,),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await authService.signOut();
            },
            child: Text("SignOut"),
          ),
          ElevatedButton(
              onPressed: () async {
                CollectionReference users = FirebaseFirestore.instance.collection("users");
                await users.doc(authService.auth.currentUser!.uid).set({"day": "23/5/2023"});
                print(authService.auth.currentUser!.uid);
              }, child: Text("Test")
          )
        ],
      ),
    );
  }
}
