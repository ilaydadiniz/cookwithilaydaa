import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cookwithilayda/model/recipe.dart';
import 'package:cookwithilayda/screens/recipe_detail.dart';
import 'package:cookwithilayda/utils/dbhelper.dart';

class RecipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecipeListState();
  }
}

class RecipeListState extends State {
  DbHelper helper = DbHelper();
  List<Recipe> recipes;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (recipes == null) {
      recipes = [];
      getData();
    }
    return Scaffold(
        body: recipeListItems(),
        appBar: AppBar(
          title: Text("Add Recipes"),
          backgroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateToDetail(Recipe("", 3, ""));
          },
          tooltip: 'Add New Recipe',
          child: Icon(
            Icons.add_outlined,
            size: 20,
            color: Colors.white,
          ),
          backgroundColor: Colors.pink[200],
        ));
  }

  ListView recipeListItems() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) => Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: getColor(this.recipes[position].priority),
                child: Text(
                  this.recipes[position].id.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(this.recipes[position].title),
              subtitle: Text(this.recipes[position].description),
              onTap: () {
                navigateToDetail(this.recipes[position]);
              },
            )));
  }

  void navigateToDetail(Recipe recipe) async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => RecipeDetail(recipe)));
    if (result == true) {
      getData();
    }
  }

  void getData() {
    final recipesFuture = helper.getRecipes();
    recipesFuture.then((result) => {
          setState(() {
            recipes = result;
            count = recipes.length;
          })
        });
  }

  Color getColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.green;
      default:
        return Colors.green;
    }
  }
}
