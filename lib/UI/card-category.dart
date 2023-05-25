import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  final String imgUrl;
  final String category;
  final String description;

  CardCategory({required this.imgUrl, required this.category, required this.description,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/category", arguments:  {
          "imgUrl" : imgUrl,
          "category": category,
          "description": description
        });
      },
      child: Column(
        children: [
          Image.network(imgUrl),
          SizedBox(height: 10,),
          Text(category, style: TextStyle(fontSize: 16),)
        ],
      ),
    );
  }
}
