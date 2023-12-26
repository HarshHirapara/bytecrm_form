import 'dart:developer';

import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sql.dart';

class SQlDatabaseHandler {
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE userDataTable(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      user_image TEXT,
      full_name TEXT,
      mobile_number TEXT,
      email TEXT,
      birth_date TEXT,
      anniversary_date TEXT,
      designation TEXT,
      role TEXT,
      reports_to TEXT,
      joining_date TEXT,
      employment_time TEXT,
      working_hour TEXT
    )""");
  }

  static Future<sql.Database> database() async {
    return sql.openDatabase(
      'bytCRMDatabase1.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTable(database);
      },
    );
  }

  static Future insertData(
    String userImage,
    String fullName,
    String mobileNumber,
    String email,
    String birthDate,
    String anniversaryDate,
    String designation,
    String role,
    String reportsTo,
    String joiningDate,
    String employmentTime,
    String workingHours,
  ) async {
    final database = await SQlDatabaseHandler.database();
    final data = {
      'user_image': userImage,
      'full_name': fullName,
      'mobile_number': mobileNumber,
      'email': email,
      'birth_date': birthDate,
      'anniversary_date': anniversaryDate,
      'designation': designation,
      'role': role,
      'reports_to': reportsTo,
      'joining_date': joiningDate,
      'employment_time': employmentTime,
      'working_hour': workingHours,
    };
    final userData = await database.insert(
      'userDataTable',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    log(userData.toString());
    return userData;
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final database = await SQlDatabaseHandler.database();
    return await database.query('userDataTable', orderBy: 'id');
  }
}


// class DatabaseHandler {
//   static Future<void> createTables(sql.Database database) async {
//     await database.execute("""CREATE TABLE items(
//         id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
//         title TEXT,
//         description TEXT,
//         address TEXT
//       )
//       """);
//   }

//   static Future<sql.Database> db() async {
//     return sql.openDatabase(
//       'myItems.db',
//       version: 1,
//       onCreate: (sql.Database database, int version) async {
//         await createTables(database);
//       },
//     );
//   }

//   static Future<int> insertData(
//       String? title, String? description, String? address) async {
//     final db = await DatabaseHandler.db();
//     final data = {
//       'title': title,
//       'description': description,
//       'address': address
//     };
//     final id = await db.insert('items', data,
//         conflictAlgorithm: sql.ConflictAlgorithm.replace);
//     log(id.toString());
//     return id;
//   }

//   static Future<List<Map<String, dynamic>>> getItems() async {
//     final db = await DatabaseHandler.db();
//     return await db.query('items', orderBy: 'id');
//   }

//   static Future<List<Map<String, dynamic>>> getItem(int id) async {
//     final db = await DatabaseHandler.db();
//     return await db.query('items', where: 'id=?', whereArgs: [id], limit: 1);
//   }

//   static Future<int> updateItem(
//       int? id, String? title, String? description, String? address) async {
//     final db = await DatabaseHandler.db();
//     final data = {
//       'title': title,
//       'description': description,
//       'address': address
//     };
//     final result = await db.update(
//       'items',
//       data,
//       where: 'id=?',
//       whereArgs: [id],
//     );
//     return result;
//   }

//   static Future<void> deleteItem(int id) async {
//     final db = await DatabaseHandler.db();
//     try {
//       await db.delete(
//         'items',
//         where: 'id=?',
//         whereArgs: [id],
//       );
//     } catch (err) {
//       log("Something wants wrong : $err");
//     }
//   }
// }
