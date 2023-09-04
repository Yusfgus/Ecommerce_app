import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../shared/constants/constants.dart';

class Sqflite {
  static Database? _db;
  String tableName = "user_fav_cart";
  String favColumn = "fav";
  String cartColumn = "cart";

  Future<Database?> get dB async {
    _db ??= await initialDB();
    return _db;
  }

  initialDB() async {
    String databasePath = await getDatabasesPath();
    String databaseName = "nemo.db";
    // database_path/note.db
    String path = join(databasePath, databaseName);
    Database? myDb = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return myDb;
  }

  deleteDB() async {
    String databasePath = await getDatabasesPath();
    String databaseName = "nemo.db";
    // database_path/note.db
    String path = join(databasePath, databaseName);
    await deleteDatabase(path);
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE "$tableName"(
      "id" INTEGER NOT NULL PRIMARY KEY,
      $favColumn TEXT,
      $cartColumn TEXT
      )
    ''');
    print(
        ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>) TABLE CREATED (<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
  }

  // To Drop Column color
  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('''
        CREATE TABLE "new_table"(
      "username" TEXT NOT NULL PRIMARY KEY,
      $favColumn TEXT,
      $cartColumn TEXT
        )
    ''');
//
//     await db.execute('''
//     INSERT INTO "new_note" ("id","title","description")
//     SELECT id,title,description FROM "note";
// ''');
//
    await db.execute('''
    DROP TABLE "user-fav-cart"
''');
//
    await db.execute('''
    ALTER TABLE "new_table" RENAME TO "$tableName";
''');

    // await db.execute('''
    //  ALTER TABLE note
    //  DROP color
    // ''');
    print(
        ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>) TABLE UNDATED (<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");

  }

  Future<int> insertNewUser() async {
    Database? myDb = await dB;
    int response = await myDb!.insert(tableName, {"username": username, favColumn: "", cartColumn: ""});
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>) Inserted (<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    return response;
  }

  Future<List<Map<String, dynamic>>> getUserData() async {
    Database? myDb = await dB;
    return await myDb!.query(
      tableName,
      columns: [favColumn, cartColumn],
      where: 'username = $username',
      //whereArgs: [userId], // ميتين chatgpt
    );
  }
  //
  // Future<List<Map<String, dynamic>>?> getUserData(int userId) async {
  //   Database? myDb = await dB;
  //   return await myDb!.rawQuery('''
  //     SELECT $favColumn, $cartColumn
  //     FROM $tableName
  //     where id = $userId
  //   '''//, [userId]
  //   );
  // }

  Future<List<Map<String, dynamic>>> updateFav({required String newFav}) async {
    Database? myDb = await dB;
    await myDb!.update(tableName, {favColumn: newFav}, where: "username = $username");
    return getUserData();
  }

  Future<List<Map<String, dynamic>>> updateCart({required String newCart}) async {
    Database? myDb = await dB;
    await myDb!.update(tableName, {cartColumn: newCart}, where: "username = $username");
    return getUserData();
  }

  // Delete
  Future<int> deleteRows() async {
    Database? myDb = await dB;
    int response = await myDb!.delete(tableName);
    //await myDb.close();
    return response;
  }

  Future<void> printDatabase() async {
    Database? myDb = await dB;
    final List<Map<String, dynamic>> result = await myDb!.query(tableName);
    for (var row in result) {
      print('Row: $row');
    }
  }

}
