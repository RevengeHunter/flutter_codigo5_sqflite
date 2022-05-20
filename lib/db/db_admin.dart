import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite/models/book_model.dart';
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
    List res = await databaseDB!.rawQuery("SELECT * FROM BOOK ORDER BY id DESC");
    return res;
  }

  Future<List<BookModel>> getBooks() async{
    //Database? databaseDB = await getCheckDatabase();
    List<BookModel> res = [];
    final Database? databaseDB = await getCheckDatabase();
    List getRes = await databaseDB!.query("BOOK",orderBy: "id DESC");
    // getRes = getRes.reversed.toList();
    // getRes.forEach((element) {
    //   res.add(BookModel.fromMapToModel(element));
    // });
    res = getRes.map<BookModel>((e) => BookModel.fromMapToModel(e)).toList();

    return res;
  }

  //CREATE - Realizar insersiones a la tabla
  insertBookRaw() async{
    //Database? databaseDB = await getCheckDatabase();
    final Database? databaseDB = await getCheckDatabase();
    int res = await databaseDB!.rawInsert("INSERT INTO BOOK(title,author,description,image) VALUES('No Pain, No Gain','J. L. D. Barnett','is a true to life story','https://images-na.ssl-images-amazon.com/images/I/413G5MbAewL._SX331_BO1,204,203,200_.jpg')");
    print(res);
  }

  insertBook(BookModel book) async{
    //Database? databaseDB = await getCheckDatabase();
    final Database? databaseDB = await getCheckDatabase();
    //bool inserted;
    int res = await databaseDB!.insert("BOOK",book.toJson()
    //     {
    //   "title":book.titleBook,
    //   "author":book.authorBook,
    //   "description":book.descriptionBook,
    //   "image":book.imageBook,
    // }
    );
    print(res);
    //(res!=null) ? inserted=true: inserted=false;
    return res;
  }

  //UPDATE - Realizar actualizaciones a la tabla
  Future<int> updateBookRaw(BookModel book) async{
    //Database? databaseDB = await getCheckDatabase();
    final Database? databaseDB = await getCheckDatabase();
    int res = await databaseDB!.rawUpdate("UPDATE BOOK SET title = ${book.titleBook}, author = ${book.authorBook}, description = ${book.descriptionBook}, image = ${book.imageBook}  WHERE id = ${book.id}");
    print(res);
    return res;
  }

  updateBook(BookModel book) async{
    //Database? databaseDB = await getCheckDatabase();
    final Database? databaseDB = await getCheckDatabase();
    int res = await databaseDB!.update("BOOK",book.toJson(), where: "id = ${book.id}");
    print(res);
    return res;
  }

  //DELETE - Realizar eliminaciones a la tabla
  Future<int> deleteBookRaw(int idBook) async{
    //Database? databaseDB = await getCheckDatabase();
    final Database? databaseDB = await getCheckDatabase();
    int res = await databaseDB!.rawDelete("DELETE FROM BOOK WHERE id = $idBook");
    print(res);
    return res;
  }

  deleteBook(int idBook) async{
    //Database? databaseDB = await getCheckDatabase();
    final Database? databaseDB = await getCheckDatabase();
    int res = await databaseDB!.delete("BOOK", where: "id = $idBook");
    print(res);
    return res;
  }

}
