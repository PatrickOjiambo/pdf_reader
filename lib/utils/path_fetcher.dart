import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

// Scan for pdf files in the device and save the path in the list
Future<List<String>> scanPdfFiles() async {
//   debugPrint("Following is document directory");
//  Future<void> fetchDirectories() async {
//   Future<List<Directory>?>? externalStorageDirectories = getExternalStorageDirectories(type: StorageDirectory.documents);
//   List<Directory>? directories = await externalStorageDirectories;
//   debugPrint(directories.toString());
// }

// // Call the function
// fetchDirectories();
  var permission = await Permission.manageExternalStorage.status;
  List<String> files = [];
  if (permission.isDenied) {
    await Permission.manageExternalStorage.request();
  }
  if (permission.isGranted) {
    Directory directory = Directory('/storage/emulated/0/Documents');

    try {
      List<FileSystemEntity> entities =
          directory.listSync(recursive: true, followLinks: false);

      debugPrint(entities.toString());
      files = fileFinder(entities);
    } catch (e) {
      debugPrint(e.toString());
    }
    // If files list is empty then we will return empty list
    if (files.isEmpty) {
      return [];
    }
  } else if (permission.isPermanentlyDenied) {
    debugPrint("Permission is permanently denied");
  }
  return files;
}

List<String> fileFinder(List<FileSystemEntity> entities) {
  debugPrint("Entered fileFinder");

  debugPrint(entities.toString());
  List<String> files = [];
  for (FileSystemEntity entity in entities) {
    if (entity is File) {
      debugPrint(entity.path);
      if (entity.path.endsWith('.pdf')) {
        debugPrint("pdf file found");
        debugPrint(entity.uri.toString());
        files.add(entity.path);
      }
    } else if (entity is Directory) {
      continue;
      // debugPrint(entity.path);
      //       files.addAll(fileFinder(entity.listSync(recursive: true, followLinks: false)));
    }
  }
  debugPrint("the following are files");
  debugPrint(files.toString());
  return files;
}
