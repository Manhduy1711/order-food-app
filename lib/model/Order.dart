class Order {
  String id;
  String tilte;
  String urlImage;
  int price;
  int quantity;

  Order({required this.tilte, required this.urlImage,required this.price,required this.quantity, required this.id});

  int getTotalPrice() => quantity*price;
}
