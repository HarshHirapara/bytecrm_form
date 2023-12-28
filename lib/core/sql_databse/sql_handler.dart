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
