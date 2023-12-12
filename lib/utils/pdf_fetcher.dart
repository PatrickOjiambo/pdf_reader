import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


 // this function will return the list of pdf files in the device
Future<Directory?> getExternalDirectory() async {
  Directory? externaldirectory;

  try {
    externaldirectory = await getExternalStorageDirectory();
    if (externaldirectory == null) {
      return null;
    }
    return externaldirectory;
  } catch (e) {
    return null;
  }
}
//This function will return the list of pdf files in the device
Future<List<File>> scanForPDFFiles(Directory directory) async {
  List<File> files = [];
  try {
    List<FileSystemEntity> entities = directory.listSync();
    //If entity is file then we will check if it is pdf or not.
    //If it is pdf then we will add it to the list
 
    for (FileSystemEntity entity in entities) {
      if (entity is File) {
        if (entity.path.endsWith('.pdf')) {
          files.add(entity);
        }
           //If entity is directory then we will recursively call the function
      } else if (entity is Directory) {
        files.addAll(await scanForPDFFiles(entity));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
    
  }
  //If files list is empty then we will return empty list
  if(files.isEmpty){
    debugPrint("No pdf files found");
    return [];
  }
  return files;
}

Future<int> deletefile(File file) async {
  try {
    await file.delete();
    return 1;
  } catch (e) {
    debugPrint(e.toString());
    return -1;
  }
}
Future<int> deleteListOfFiles(List<File> files) async {
  int count = 0;
  try{
    for (File file in files) {
    count += await deletefile(file);
  }
  return count;
  }
  catch(e){
    debugPrint(e.toString());
    return -1;
  }
}