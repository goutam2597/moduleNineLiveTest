import 'package:flutter/material.dart';
import 'package:module_nine_live_test/recipespage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: RecipeListPage(),
    );
  }
}
