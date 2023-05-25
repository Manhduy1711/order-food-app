import 'dart:convert';

import 'package:dhk_food/UI/meal-item.dart';
import 'package:dhk_food/model/Meals.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "package:dhk_food/providers/cart-provider.dart";
import 'package:provider/provider.dart';

class Category extends StatefulWidget {
  final String category;

  const Category({super.key, required this.category});
  @override
  State<Category> createState() => _CategoryState(category);
}

class _CategoryState extends State<Category> {
  bool isShowDescription = false;
  final String _category;

  _CategoryState(this._category);

  late Future<List<Meal>> futureMeals;

  Future<List<Meal>> fetchMeals() async {
    final url = Uri.parse("https://www.themealdb.com/api/json/v1/1/filter.php?c=" + _category );
    final response = await http.get(url);
    final body = response.body;
    final data = jsonDecode(body);
    // Categories meals =  Categories.fromJson(data);
    List<Meal> meals = Meals.fromJson(data).meals!;
    return meals;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("https://www.themealdb.com/api/json/v1/1/filter.php?c=" + _category);
    setState(() {
      futureMeals = fetchMeals();
    });
  }
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      appBar: AppBar(title: Text("Category"), centerTitle: true,),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Image.network(args["imgUrl"]),
          Text(
            args["category"],
            style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold
            ),),
          ElevatedButton(onPressed: () {
            setState(() {
              isShowDescription = !isShowDescription;
            });
          }, child: isShowDescription ? Text("Click to hide description"): Text("Click to show description")),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: isShowDescription ? Text(
                args["description"].toString().length > 400 ?
                args["description"].toString().substring(0,400) :
                args["description"]
            ) : Text(""),
          ),
          FutureBuilder<List<Meal>>(
            future: futureMeals,
            builder: (context,snapshot) {
              if(snapshot.hasData) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      children: snapshot.data!.map((e) => MealItem(mealImgUrl: e.strMealThumb!, meal: e.strMeal!, id: e.idMeal!,)).toList()
                    ),
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),]
      ),
    );
  }
}
