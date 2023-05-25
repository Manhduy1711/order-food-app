import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return auth.userChanges();
  }

  Future register(String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user!;
      return user;
    }
    catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future login(String email, String password) async {
    try{
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user!;
      return user;
    }
    catch (err) {
      print(err.toString());
      return null;
    }
  }
  Future signOut() async {
    try {
      return await auth.signOut();
    }
    catch (err) {
      print(err.toString());
      return null;
    }
  }
}