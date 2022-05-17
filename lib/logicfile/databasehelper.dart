// import 'dart:io';

// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';
// import 'package:path/path.dart';

// class Databasehelper {
//   Databasehelper._priverconstactor();
//   static final Databasehelper instance = Databasehelper._priverconstactor();
//   static Database? _database;

//   Future<Database> get database async => _database ?? await initdata();
//   Future<Database> initdata() async {
//     Directory documentdirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentdirectory.path, 'customerdata.db');
//     return await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute("""
//   CREATE TABLE customerdata(

// id INTEGER PRIMARY EEY,
// first_name TEXT,
// last_name TEXT,
// email TEXT

//   )

//   """);
//     });
//   }
// }
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev2/logicfile/database_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._priverconstactor();
  static final DatabaseHelper instance = DatabaseHelper._priverconstactor();
  static Database? _database;

  Future<Database> get database async => _database ?? await initdata();

  Future<Database> initdata() async {
    Directory documentdirectrory = await getApplicationDocumentsDirectory();
    String path = join(documentdirectrory.path, "customer.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int verssion) async {
      await db.execute('''
CREATE TABLE customer(
  id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT
)


''');
    });
  }

  Future<int> addcustomer(customermodel Customermodel) async {
    Database db = await instance.database;
    return await db.insert('customer', customermodel().tomap());
  }

  // Future<int> addcustomer(databasemodel Databasemodel) async {
  //   Database db = await instance.database;
  //   return await db.insert('customer', databasemodel().tomap());
  // }
}
