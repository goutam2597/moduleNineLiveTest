import 'package:flutter/material.dart';
import 'dart:convert';

import 'recipe_model.dart';

class RecipeListPage extends StatefulWidget {
  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  List<Recipe> recipes = [];

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
  }

  Future<void> _fetchRecipes() async {
    String jsonData = await DefaultAssetBundle.of(context).loadString('assets/products.json');
    List<dynamic> recipeList = json.decode(jsonData)['recipes'];
    List<Recipe> parsedRecipes = recipeList.map((recipeJson) => Recipe.fromJson(recipeJson)).toList();

    setState(() {
      recipes = parsedRecipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe List'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            leading: Icon(Icons.restaurant),
            title: Text(recipe.title),
            subtitle: Text(recipe.description),
          );
        },
      ),
    );
  }
}
