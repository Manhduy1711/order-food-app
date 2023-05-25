import 'package:dhk_food/config/theme.dart';
import 'package:dhk_food/screen/wrapper.dart';
import 'package:dhk_food/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dhk_food/providers/cart-provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => Cart())
    ],child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        theme: themeData(),
        home: Wrapper(),
      ),
    );
  }
}


