// import 'dart:io';

// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// class DatabaseHelper {
//   static Database? _database;

//   static final DatabaseHelper instance = DatabaseHelper._init();

//   DatabaseHelper._init();

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await initDB();
//     return _database!;
//   }

//   Future<Database> initDB() async {

//     // Get application directory
//     Directory documentsDirectory =
//         await getApplicationDocumentsDirectory();

//     // Create database path
//     String path = join(
//       documentsDirectory.path,
//       "student.db",
//     );

//     print("Database Path: $path");

//     return await openDatabase(
//       path,
//       version: 1,

//       onCreate: (db, version) async {

//         await db.execute('''
//           CREATE TABLE students(
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             name TEXT,
//             age INTEGER
//           )
//         ''');
//       },
//     );
//   }

//   // INSERT
//   Future<int> insertStudent(Map<String, dynamic> row) async {
//     final db = await instance.database;

//     return await db.insert('students', row);
//   }

//   // READ
//   Future<List<Map<String, dynamic>>> getStudents() async {
//     final db = await instance.database;

//     return await db.query('students');
//   }

//   // UPDATE
//   Future<int> updateStudent(Map<String, dynamic> row) async {
//     final db = await instance.database;

//     return await db.update(
//       'students',
//       row,
//       where: 'id = ?',
//       whereArgs: [row['id']],
//     );
//   }

//   // DELETE
//   Future<int> deleteStudent(int id) async {
//     final db = await instance.database;

//     return await db.delete(
//       'students',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
// }