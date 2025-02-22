import 'package:flutter/material.dart';
import 'package:online_apple_store/models/product_model.dart';
import 'package:online_apple_store/utiles/constants.dart';

final List<ProductModel> productsData = [
  ProductModel(
    id: "1",
    name: "iPhone 15 Pro Max",
    image: greenPhone,
    rating: "4.9",
    description: "Apple's most powerful iPhone with A17 Pro chip and titanium frame.",
    colors: [
      {"name": "Black Titanium", "color": Colors.black},
      {"name": "Blue Titanium", "color": Colors.blueGrey},
      {"name": "Silver Titanium", "color": Colors.grey},
      {"name": "Natural Titanium", "color": Colors.brown},
    ],
    category: "iPhone",
    price: "1199.00",
  ),
  ProductModel(
    id: "2",
    name: "iPhone 15",
    image: pinkPhone,
    rating: "4.7",
    description: "The latest iPhone with Dynamic Island and USB-C.",
    colors: [
      {"name": "Blue", "color": Colors.blue},
      {"name": "Pink", "color": Colors.pink},
      {"name": "Yellow", "color": Colors.yellow},
      {"name": "Green", "color": Colors.green},
      {"name": "Black", "color": Colors.black},
    ],
    category: "iPhone",
    price: "799.00",
  ),
  // ProductModel(
  //   id: "3",
  //   name: "MacBook Pro M3 Max",
  //   image: "lib/assets/products/macbook_pro_m3.png",
  //   rating: "5.0",
  //   description: "Apple's most powerful laptop for professionals.",
  //   colors: [
  //     {"name": "Silver", "color": Colors.grey},
  //     {"name": "Space Black", "color": Colors.black87},
  //   ],
  //   category: "MacBook",
  //   price: "2499.00",
  // ),
  // ProductModel(
  //   id: "4",
  //   name: "Apple Watch Ultra 2",
  //   image: "lib/assets/products/apple_watch_ultra.png",
  //   rating: "4.9",
  //   description: "Apple’s most rugged and capable smartwatch.",
  //   colors: [
  //     {"name": "Titanium", "color": Colors.brown},
  //   ],
  //   category: "Apple Watch",
  //   price: "799.00",
  // ),
  // ProductModel(
  //   id: "5",
  //   name: "AirPods Max",
  //   image: "lib/assets/products/airpods_max.png",
  //   rating: "4.8",
  //   description: "High-fidelity over-ear headphones with immersive sound.",
  //   colors: [
  //     {"name": "Silver", "color": Colors.grey},
  //     {"name": "Space Grey", "color": Colors.black87},
  //     {"name": "Sky Blue", "color": Colors.lightBlue},
  //     {"name": "Pink", "color": Colors.pinkAccent},
  //     {"name": "Green", "color": Colors.green},
  //   ],
  //   category: "AirPods",
  //   price: "549.00",
  // ),
  // ProductModel(
  //   id: "6",
  //   name: "HomePod 2nd Gen",
  //   image: "lib/assets/products/homepod_2.png",
  //   rating: "4.7",
  //   description: "Immersive sound with intelligent Siri integration.",
  //   colors: [
  //     {"name": "White", "color": Colors.white},
  //     {"name": "Midnight", "color": Colors.black},
  //   ],
  //   category: "HomePod",
  //   price: "299.00",
  // ),
];