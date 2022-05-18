import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? myDatabase;

  static final DBAdmin db = DBAdmin._();
  DBAdmin._();

  Future<Database?> getCheckDatabase() async{
    if (myDatabase != null) return myDatabase;
    myDatabase = await initDB(); //Creacion de la base de datos
    return myDatabase;
  }

  Future<Database> initDB() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //Lo maneja el path provider
    String path = join(directory.path, "BookDB.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int v) async {
        await db.execute("CREATE TABLE BOOK(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, author TEXT, description TEXT, image TEXT)");
      },
    );
  }

  //READ - Realizar consultas a la tabla
  Future<List> getBooksRaw() async{
    //Database? databaseDB = await getCheckDatabase();
    final Database? databaseDB = await getCheckDatabase();
    List res = await databaseDB!.rawQuery("SELECT * FROM BOOK");
    return res;
  }

  Future<List> getBooks() async{
    //Database? databaseDB = await getCheckDatabase();
    final Database? databaseDB = await getCheckDatabase();
    List res = await databaseDB!.query("BOOK");
    return res;
  }

  //CREATE - Realizar insersiones a la tabla
  insertBookRaw() async{
    //Database? databaseDB = await getCheckDatabase();
    final Database? databaseDB = await getCheckDatabase();
    int res = await databaseDB!.rawInsert("INSERT INTO BOOK(title,author,description,image) VALUES('No Pain, No Gain','J. L. D. Barnett','is a true to life story','https://images-na.ssl-images-amazon.com/images/I/413G5MbAewL._SX331_BO1,204,203,200_.jpg')");
    print(res);
  }

  insertBook() async{
    //Database? databaseDB = await getCheckDatabase();
    final Database? databaseDB = await getCheckDatabase();
    int res = await databaseDB!.insert("BOOK",{
      "title":"Codigo Limpio",
      "author":"Robert C. Martin",
      "description":"up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum",
      "image":"https://images.cdn3.buscalibre.com/fit-in/360x360/10/fb/10fb170d7732b7dca25ebb81ded2572d.jpg"
    });
    print(res);
  }

  //UPDATE - Realizar actualizaciones a la tabla
  updateBook() async{
    //Database? databaseDB = await getCheckDatabase();
    final Database? databaseDB = await getCheckDatabase();
    List res = await databaseDB!.rawQuery("UPDATE BOOK SET WHERE");
    print(res);
  }

  //DELETE - Realizar eliminaciones a la tabla
  deleteBook() async{
    //Database? databaseDB = await getCheckDatabase();
    final Database? databaseDB = await getCheckDatabase();
    List res = await databaseDB!.rawQuery("DELETE FROM BOOK WHERE ");
    print(res);
  }

}
