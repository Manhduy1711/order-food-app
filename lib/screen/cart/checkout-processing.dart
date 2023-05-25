import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhk_food/UI/cart-item.dart';
import 'package:dhk_food/providers/cart-provider.dart';
import 'package:dhk_food/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutProcessing extends StatelessWidget {

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CHECK OUT"),),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            child: ListView(
              shrinkWrap: true,
              children: context.watch<Cart>().orders.map((e) =>
                  CartItem(id: e.id, title: e.tilte,url: e.urlImage, quantity: e.quantity,price: e.price, )
              ).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal:", style: TextStyle(fontSize: 20),),
                Text("\$${context.watch<Cart>().getTotalPriceOrders()}",style: TextStyle(fontSize: 20))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shipping cart:",style: TextStyle(fontSize: 20)),
                Text("\$5",style: TextStyle(fontSize: 20))
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.deepOrangeAccent, width: 2)
              ),
              boxShadow: [BoxShadow(
                  color: Color.fromRGBO(225, 95, 27, 0.3),
                  blurRadius: 20,
                  offset: Offset(0, 10)
              )]
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total:",style: TextStyle(fontSize: 30)),
                Text("\$${5 + context.watch<Cart>().getTotalPriceOrders()}",style: TextStyle(fontSize: 30))
              ],
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  shape: StadiumBorder()
              ),
              onPressed: () async{
                final Map<String, dynamic> data = new Map<String, dynamic>();
                if (context.read<Cart>().orders.length > 0) {
                  data['orders'] = context.read<Cart>().orders.map((v) =>{
                    "title": v.tilte,
                    "id": v.id,
                    "urlImage": v.urlImage,
                    "quantity": v.quantity,
                    "price": v.price
                  }).toList();
                }
                CollectionReference users = FirebaseFirestore.instance.collection("users");
                await users.doc(authService.auth.currentUser!.uid).set(data);
                print(authService.auth.currentUser!.uid);
              },
              child: Text("Confirm to buy", style: TextStyle(
                fontSize: 20,
              ),)
          )
        ],
      ),
    );
  }
}
