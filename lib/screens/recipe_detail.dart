import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cookwithilayda/model/recipe.dart';
import 'package:cookwithilayda/utils/dbhelper.dart';
import 'package:intl/intl.dart';

final List<String> choices = const <String>[menuSave, menuDelete, menuBack];

const menuSave = "Save Recipe & Back";
const menuDelete = "Delete Recipe";
const menuBack = "Back To List";

DbHelper helper = DbHelper();

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  RecipeDetail(this.recipe);

  @override
  State<StatefulWidget> createState() {
    return RecipeDetailState(recipe);
  }
}

class RecipeDetailState extends State {
  Recipe recipe;

  RecipeDetailState(this.recipe);

  final _formDistance = 5.0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = recipe.title;
    descController.text = recipe.description;
    var textStyle = Theme.of(context).textTheme.caption;
    var title = recipe.title == "" ? "New Recipe" : recipe.title;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            //leading sol taraf icon button ikon koyar

            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              size: 20,
              color: Colors.black,
            ),
          ),
          automaticallyImplyLeading: false,
          title: Text(title),
          actions: [
            PopupMenuButton<String>(
              onSelected: select,
              itemBuilder: (BuildContext context) {
                return choices.map((e) {
                  return PopupMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: TextField(
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Title",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0)))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: _formDistance, bottom: _formDistance),
                child: TextField(
                    controller: descController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Description",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0)))),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: save,
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[200],
                  onPrimary: Colors.white,
                ),
                child: Text(
                  menuSave,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: delete,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[200],
                    onPrimary: Colors.white,
                  ),
                  child: Text(menuDelete)),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[200],
                    onPrimary: Colors.white,
                  ),
                  child: Text(menuBack)),
            ],
          ),
        ));
  }

  void select(String value) async {
    switch (value) {
      case menuSave:
        save();
        break;
      case menuDelete:
        delete();
        break;
      case menuBack:
        Navigator.pop(context, true);
        break;
      default:
    }
  }

  void delete() async {
    Navigator.pop(context, true);
    if (recipe.id == null) {
      return;
    }
    int result;
    result = await helper.deleteRecipe(recipe.id);
    if (result != 0) {
      AlertDialog alertDialog = AlertDialog(
        title: Text("Delete Recipe"),
        content: Text("The Recipe has been deleted"),
      );
      showDialog(context: context, builder: (_) => alertDialog);
    }
  }

  void save() {
    recipe.title = titleController.text;
    recipe.description = descController.text;
    recipe.date = new DateFormat.yMd().format(DateTime.now());
    if (recipe.id != null) {
      helper.updateRecipe(recipe);
    } else {
      helper.insertRecipe(recipe);
    }
    Navigator.pop(context, true);
    showAlert(recipe.id != null);
  }

  void showAlert(bool isUpdate) {
    AlertDialog alertDialog;
    if (isUpdate) {
      alertDialog = AlertDialog(
        title: Text("Update Recipe"),
        content: Text("The Recipe has been updated"),
      );
    } else {
      alertDialog = AlertDialog(
        title: Text("Insert Recipe"),
        content: Text("Recipe has been inserted"),
      );
    }
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
