import 'package:flutter/material.dart';

class ProductModel {
  String id;
  String name;
  String image;
  String rating;
  String description;
  List<Map<String, dynamic>> colors;
  String category;
  String price;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.description,
    required this.colors,
    required this.category,
    required this.price,
  });



}
