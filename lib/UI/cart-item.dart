import 'package:dhk_food/model/Order.dart';
import 'package:dhk_food/providers/cart-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final id;
  final title;
  final url;
  final price;
  final quantity;

  const CartItem({super.key, required this.id, required this.title, required this.url, required this.price, required this.quantity});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 132,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: Image.network(url),
              ),
              SizedBox(width: 12,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text(title, style: const TextStyle(
                      fontSize: 20
                    ),)),
                    Row(
                      children: [
                        Text("Total: \$", style: TextStyle(fontSize: 20),),
                        Text((price*quantity).toString(), style: TextStyle(fontSize: 20)),
                        IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => {
                              context.read<Cart>().removeItemFromCart(
                              Order(tilte: title, urlImage: url, price: price, quantity: 1, id: id)
                              )
                          }
                        ),
                        Text(quantity.toString()),
                        IconButton(
                            onPressed: () => {
                              context.read<Cart>().addItemToCart(
                                Order(tilte: title, urlImage: url, price: price, quantity: 1, id: id)
                              )
                            },
                            icon: Icon(Icons.add))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
