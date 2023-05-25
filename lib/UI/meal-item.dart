import "package:dhk_food/model/Order.dart";
import "package:dhk_food/providers/cart-provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class MealItem extends StatefulWidget {
  int quantity = 0;

  final String mealImgUrl;
  final String meal;
  final String id;

  MealItem({super.key, required this.mealImgUrl, required this.meal, required this.id});

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(widget.mealImgUrl)
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.meal.length < 20 ? widget.meal : "${widget.meal.substring(0,20)}...",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                    ),),
                     Row(
                      children: [
                        const Text("\$35", style:  TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange
                        ),),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            if(widget.quantity > 0) {
                              setState(() {
                                widget.quantity--;
                              });
                            }
                          },

                        ),
                        Text("${widget.quantity}"),
                        IconButton(
                            onPressed: () => {
                              setState(() {
                                widget.quantity++;
                              })
                            },
                            icon: Icon(Icons.add))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: (){
                  context.read<Cart>().addItemToCart(Order(tilte: widget.meal,urlImage: widget.mealImgUrl, price: 35, quantity: widget.quantity, id: widget.id));
                },
                child: Text("Add to Cart"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
