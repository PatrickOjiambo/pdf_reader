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
//Scan for pdf files in the device and save the path in the list
Future<List<String>> scanPdfFiles (Directory directory) async {
  List<String> files = [];
  try {
    List<FileSystemEntity> entities = directory.listSync();
    //If entity is file then we will check if it is pdf or not.
    //If it is pdf then we will add it to the list
    for (FileSystemEntity entity in entities) {
      if (entity is File) {
        if (entity.path.endsWith('.pdf')) {
          files.add(entity.path);
        }
      //If entity is directory then we will recursively call the function
      } else if (entity is Directory) {
        files.addAll(await scanPdfFiles(entity));
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