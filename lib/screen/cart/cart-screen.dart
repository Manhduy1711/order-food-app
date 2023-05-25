
import 'package:dhk_food/UI/cart-item.dart';
import 'package:dhk_food/providers/cart-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CART SCREEN"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.7,
            child: ListView(
              shrinkWrap: true,
              children: context.watch<Cart>().orders.map((e) =>
                  CartItem(id: e.id, title: e.tilte,url: e.urlImage, quantity: e.quantity,price: e.price, )
              ).toList(),
            ),
          ),
          SizedBox(height: 18,),
          context.watch<Cart>().orders.length > 0 ? ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              shape: StadiumBorder()
            ), 
              onPressed: () {
              Navigator.pushNamed(context, "checkout");
              },
              child: Text("Checkout", style: TextStyle(
                fontSize: 20,
              ),)
          ) : Text("")
        ],
      ),
    );
  }
}
