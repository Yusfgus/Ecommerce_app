import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sqflite {
  static Database? dbFavorite;
  static Database? dbCart;

  Future<Database?> get dBFavorite async {
    dbFavorite ??= await initialDBFavorite();
    return dbFavorite;
  }

  Future<Database?> get dBCart async {
    dbCart ??= await initialDBCart();
    return dbCart;
  }

  initialDBFavorite() async {
    String databasePath = await getDatabasesPath();
    String databaseFavorite = "userName_Favorite.db";
    // database_path/note.db
    String path = join(databasePath, databaseFavorite);
    Database? myDbFavorite = await openDatabase(
      path,
      version: 2,
      onCreate: onCreateFavorite,
    );
    return myDbFavorite;
  }

  String userName = "Yousef";
  onCreateFavorite(Database db, int version) async {
    await db.execute('''
      CREATE TABLE "${userName}_Favorite"(
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "id_of_Product" TEXT NOT NULL,
      )
    ''');
    print("Create=======================");
  }

  insertDataFavorite(String sql) async {
    Database? myDbFavorite = await dBFavorite;
    int response = await myDbFavorite!.rawInsert(sql);
    return response;
  }

  readDataFavorite(String sql) async {
    Database? myDbFavorite = await dBFavorite;
    List<Map> response = await myDbFavorite!.rawQuery(sql);
    return response;
  }

  deleteDataFavorite(String sql) async {
    Database? myDbFavorite = await dBFavorite;
    int response = await myDbFavorite!.rawDelete(sql);
    return response;
  }

  initialDBCart() async {
    String databasePath = await getDatabasesPath();
    String databaseCart = "userName_Cart.db";
    // database_path/note.db
    String path = join(databasePath, databaseCart);
    Database? myDbCart =
        await openDatabase(path, version: 2, onCreate: onCreateCart);
    return myDbCart;
  }

  onCreateCart(Database db, int version) async {
    await db.execute('''
      CREATE TABLE "${userName}_cart"(
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "id_of_Product" TEXT NOT NULL,
      )
    ''');
    print("Create=======================");
  }

  insertDataCart(String sql) async {
    Database? myDbCart = await dBCart;
    int response = await myDbCart!.rawInsert(sql);
    return response;
  }

  readDataCart(String sql) async {
    Database? myDbCart = await dBCart;
    List<Map> response = await myDbCart!.rawQuery(sql);
    return response;
  }

  deleteDataCart(String sql) async {
    Database? myDbCart = await dBCart;
    int response = await myDbCart!.rawDelete(sql);
    return response;
  }
}
