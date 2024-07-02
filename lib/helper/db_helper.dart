import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:store_app/models/cart_model.dart';

class Sqllite {
  static Database? _db;
  static String Tabelname = "cart";

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "cart5.db");
    print(path);
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 1);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE $Tabelname (
"id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
"Productid" INTEGER  NOT NULL ,
"title" TEXT NOT NULL,
"image" TEXT NOT NULL,
"price" INTEGER  NOT NULL,
"quantity" INTEGER  NOT NULL

)
''');
  }

  Future<List<Cart>?> getAll() async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.query(Tabelname);
    List<Cart> allProductList = [];

    if (response.isNotEmpty) {
      for (var data in response) {
        allProductList.add(Cart.fromJson(data));
      }
      return allProductList;
    } else {
      return [];
    }
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
  }

  insertData(Cart cart) async {
    Database? mydb = await db;
    int response = await mydb!.insert(Tabelname, cart.tojson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(response);
  }

  updatData(Cart cart1) async {
    Database? mydb = await db;
    Map<String, dynamic> data = cart1.tojson();
    int id = data['Productid'];
    int response = await mydb!
        .update(Tabelname, data, where: 'Productid=?', whereArgs: [id]);
  } 

  deletData(int Productid) async {
    print(Productid);
    Database? mydb = await db;
    // int response = await mydb!.delete(Tabelname, where: 'Productid = ?', whereArgs: [id]);
    int response = await mydb!.rawDelete("DELETE FROM $Tabelname WHERE Productid = $Productid ");
    print("zzzzzzzzzzzzzzzzz    $response");
  }
}
