import 'package:sqflite/sqflite.dart';
import 'package:pdf_reader/database/database.dart';
import 'package:path/path.dart';
import 'package:pdf_reader/database/book.dart';
class DatabaseHelper
{

Future<Database> initializeDatabase() async{
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
      join(await getDatabasesPath(),'books_database.db'),
      // When the database is first created, create a table to store books.
      onCreate: (db,version){
        return db.execute(
          "CREATE TABLE books(id TEXT PRIMARY KEY,path TEXT,title TEXT,coverImagePath TEXT,lastPage INTEGER)"
        );
      },
      version: 1,
    );
    return database;
}
Future<void> insertBook(Book book) async{
  final Database db = await initializeDatabase();
  await db.insert(
    'books',
    book.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
//Function to delete a book from the database
Future<void>deleteBook(int id) async{
  final db = await initializeDatabase();
  await db.delete(
    'books',
    where: "id = ?",
    whereArgs: [id],
  );
}
//Function to retrieve all the books from the database
Future<List<Book>> retrieveBooks() async{
  //Get a reference to the database
  final Database db = await initializeDatabase();
  //Query the database for all the books
  final List<Map<String,dynamic>> maps = await db.query('books');
  //Convert the List<Map<String,dynamic>> into a List<Book>
  return List.generate(maps.length, (i){
  
    return Book(
      id: maps[i]['id'],
      path: maps[i]['path'],
      title: maps[i]['title'],
      coverImagePath: maps[i]['coverImagePath'],
      lastPage: maps[i]['lastPage'],
    );
  });

}
//Function to update a book in the database
Future<void> updateBook(Book book) async{
  final db = await initializeDatabase();
  await db.update(
    'books',
    book.toMap(),
    where: "id = ?",
    //Pass the book's id as a whereArg to prevent SQL injection
    whereArgs: [book.id],
  );
}
}