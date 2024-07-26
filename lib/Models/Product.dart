class Product {
  String name;
  String price;
  String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
