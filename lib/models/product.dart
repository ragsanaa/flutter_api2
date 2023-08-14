class Product {
  int? id;
  String? title;
  String? description;
  double? price;
  String? image;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = double.tryParse(json['price'].toString());
    image = json['image'];
  }
}
