import 'package:flutter/material.dart';
import 'package:online_apple_store/pages/custom_bottom_navigation_bar.dart';
import 'package:online_apple_store/pages/home_page.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:CustomBottomNavigationBar(),
debugShowCheckedModeBanner: false,
    );
  }
}
