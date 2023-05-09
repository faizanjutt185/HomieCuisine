import 'package:cloud_firestore/cloud_firestore.dart';

class Dish {
  final String name;
  final String description;
  final String price;
  final String? image;

  Dish({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
    name: json['name'],
    description: json['description'],
    price: json['price'],
    image: json['image'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'price': price,
    'image': image,
  };

  static fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> doc) {}
}
