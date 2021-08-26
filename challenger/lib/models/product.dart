class CartItem {
  final int id;
  final String title;
  //final int quantity;
  final double price;
  final String imageUrl;
  final String model;
  final int size;

  CartItem({
    required this.id,
    required this.title,
    //required this.quantity,
    required this.price,
    required this.imageUrl,
    required this.model,
    required this.size,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    //print('el json!!!!!!: ' + json.toString());
    //print('el json rating: '+json['rating']);
    return CartItem(
      id: json['id'],
      price: json['precio'],
      imageUrl: json['imagen'],
      title: json['marca'],
      model: json['modelo'],
      size: json['rating'],
    );
  }
}
