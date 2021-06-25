import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:cookwithilayda/model/recipe.dart';

class DbHelper {
  static final DbHelper _dbHelper = DbHelper._internal();

  String tblRecipe = "recipe";
  String colId = "id";
  String colTitle = "title";
  String colDescription = "description";
  String colPriority = "priority";
  String colDate = "date";

  DbHelper._internal();

  /// Dart dili factory kelimesi ile Singleton yapı kullanmamıza izin verir. Singleton bir sınıftan sadece bir nesnenin oluşmasını sağlayan bir yapıdır.
  factory DbHelper() {
    return _dbHelper;
  }

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  /// Veritabanı işlemleri asenkron işlemler olduğundan async kelimesi ile ilgili fonksiyonları nitelememiz gerekir
  Future<Database> initializeDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "recipes.db";
    var dbRecipes = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbRecipes;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tblRecipe($colId INTEGER PRIMARY KEY, $colTitle TEXT," +
            "$colDescription TEXT, $colPriority INTEGER, $colDate TEXT" +
            ")");
  }

  Future<int> insertRecipe(Recipe recipe) async {
    Database db = await this.db;
    var result = await db.insert(tblRecipe, recipe.toMap());
    return result;
  }

  Future<List> getRecipes() async {
    List<Recipe> recipeList = [];
    Database db = await this.db;
    var result =
        await db.rawQuery("SELECT * FROM $tblRecipe ORDER BY $colPriority ASC");
    result.forEach((element) {
      recipeList.add(Recipe.fromObject(element));
    });
    return recipeList;
  }

  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $tblRecipe"));

    return result;
  }

  Future<int> updateRecipe(Recipe recipe) async {
    Database db = await this.db;
    var result = await db.update(tblRecipe, recipe.toMap(),
        where: "$colId = ?", whereArgs: [recipe.id]);
    return result;
  }

  Future<int> deleteRecipe(int id) async {
    Database db = await this.db;
    var result =
        await db.delete(tblRecipe, where: "$colId = ?", whereArgs: [id]);
    return result;
  }
}
