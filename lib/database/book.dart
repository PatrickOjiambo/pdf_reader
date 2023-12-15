class Book{
  final String id;
  final String path;
  final String title;
  final String coverImagePath;
  final String lastPage;
  const Book({ required this.id,required this.path, required this.title, required this.coverImagePath, required this.lastPage});
  //Convert a book into a Map. They keys correspond to the names of the columns in the database.
Map<String, dynamic>toMap(){
  return{
    'id':id,
    'path':path,
    'title':title,
    'coverImagePath':coverImagePath,
    'lastPage':lastPage,
  };
}

  // Implement toString to make it easier to see information about
  // each book when using the print statement.
  @override
  String toString() {
    return 'Book{id: $id, path: $path, title: $title, coverImagePath: $coverImagePath, lastPage: $lastPage}';
  }
}