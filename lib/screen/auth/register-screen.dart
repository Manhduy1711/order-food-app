import 'package:dhk_food/services/auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  AuthService auth = AuthService();

  final Function toggleView;
  RegisterScreen({required this.toggleView});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[900]!,
                  Colors.orange[800]!,
                  Colors.orange[400]!
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80,),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Register", style: TextStyle(color: Colors.white, fontSize: 40),),
                  Text("Create an account", style: TextStyle(color: Colors.white, fontSize: 18),)
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, 0.3),
                                blurRadius: 20,
                                offset: Offset(0, 10)
                            )]
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child:  TextField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                    hintText: "Email or Phone number",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: passwordConfirmController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    hintText: "Password Confirm",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60,),
                      ElevatedButton(
                          onPressed: () async{
                            if(passwordController.text != passwordConfirmController.text) {
                              print("Please type the same password");
                            }
                            else {
                              dynamic result = await auth.register(emailController.text, passwordConfirmController.text);
                              print(result);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60)
                          ),
                          child: const Text("Register", style: TextStyle(fontSize: 24),)
                      ),
                      const SizedBox(height: 20,),
                      const Text("---- Or ----", style: TextStyle(fontSize: 20, color: Colors.grey), textAlign: TextAlign.center,),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                          onPressed: (){
                            toggleView();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60)
                          ),
                          child: const Text("Login", style: TextStyle(fontSize: 24),)
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
