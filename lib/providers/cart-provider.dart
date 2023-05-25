import 'package:dhk_food/model/Order.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List<Order> orders = [];

  List<Order> get getOrders => orders;

  int getTotalAmountOrders() => orders.fold(0, (sum, next) => sum + next.quantity);

  int getTotalPriceOrders() => orders.fold(0, (sum, next) => sum + next.price*next.quantity);

  Order getOneOrder(String id) => orders.firstWhere((element) => element.id == id);

  void addItemToCart(Order item) {
    final contain = orders.where((element) => element.id == item.id);
    if( contain.isNotEmpty) {
      final index = orders.indexWhere((element) => element.id == item.id);
      orders[index] = Order(tilte: item.tilte,urlImage: item.urlImage, price: item.price, quantity: orders[index].quantity +item.quantity, id: item.id);
    }
    else {
      orders.add(Order(tilte: item.tilte,urlImage: item.urlImage, price: item.price, quantity: item.quantity, id: item.id));
    }
    notifyListeners();
  }

  void removeItemFromCart(Order item) {
    final removeItem = orders.firstWhere((element) => element.id == item.id);
    if(removeItem.quantity > 1) {
      final index = orders.indexWhere((element) => element.id == item.id);
      orders[index] = Order(tilte: item.tilte, urlImage: item.urlImage, price: item.price, quantity: orders[index].quantity - 1, id: item.id);
    }
    else {
      orders.removeWhere((element) => element.id == item.id);
    }
    notifyListeners();
  }
}