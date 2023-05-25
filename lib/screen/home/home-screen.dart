
import 'dart:convert';

import 'package:dhk_food/UI/card-category.dart';
import 'package:dhk_food/model/Categories.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import "package:http/http.dart" as http;

import '../../model/Meals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}
class _HomeScreen extends State<HomeScreen> {
  late Future<List<Category>> futureCategories;
  final searchFoodController = TextEditingController();
  Future<List<Category>> fetchCategories() async {
    final url = Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php");
    final response = await http.get(url);
    final body = response.body;
    final data = jsonDecode(body);
    // Categories meals =  Categories.fromJson(data);
    List<Category> catogories = Categories.fromJson(data).categories!;
    return catogories;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCategories = fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("DHK FOOD"),centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
          child: Column(
            children: [
              TextField(
                controller: searchFoodController,
                decoration:  InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                    prefixIcon: Icon(Icons.search),
                  hintText: "search food",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none
                  )
                ),
              ),
              SizedBox(height: 36,),
              FutureBuilder<List<Category>>(
              future: futureCategories,
              builder: (context,snapshot) {
                if(snapshot.hasData) {
                  return Flexible(
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 28.0,
                        children: snapshot.data!.sublist(0,12).map((e) =>
                            CardCategory(imgUrl: e.strCategoryThumb!,category: e.strCategory!, description: e.strCategoryDescription!,)).toList(),
                      ),
                    );
                }
                return const CircularProgressIndicator();
              },
            ),]
          ),
      ),
    );
  }
}