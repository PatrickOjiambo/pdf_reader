import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

// Scan for pdf files in the device and save the path in the list
Future<List<String>> scanPdfFiles() async {
  var permission = await Permission.manageExternalStorage.status;
  List<String> files = [];
  if (permission.isDenied) {
    debugPrint("Permission is denied");
    await Permission.manageExternalStorage.request();
  }
  if (permission.isGranted) {
    Directory directory = Directory('/storage/emulated/0/Documents');
    debugPrint("Reached here, permission is granted");
    try {
      debugPrint("Entered try block");
      debugPrint("the following code has an error");
      List<FileSystemEntity> entities =
          directory.listSync(recursive: true, followLinks: false);

      debugPrint(entities.toString());
     files = fileFinder(entities);
    } catch (e) {
      debugPrint("Error while scanning for pdf files");
      debugPrint(e.toString());
    }
    // If files list is empty then we will return empty list
    if (files.isEmpty) {
      debugPrint("No pdf files found");
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
        files.add(entity.path);
      }
    } else if (entity is Directory) {
      debugPrint(entity.path);
            files.addAll(fileFinder(entity.listSync(recursive: true, followLinks: false)));

    }
  }
  return files;
}
