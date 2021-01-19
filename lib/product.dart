class Product {
  String id;
  String name;
  String imageUrl;
  List<String> ingredients;
  double price;

  Product({this.id, this.name, this.imageUrl, this.ingredients, this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return new Product(
        id: json['ID'],
        name: json['Name'],
        imageUrl: json['ImageUrl'],
        ingredients: json['Ingredients'],
        price: json['Price']);
  }
}
