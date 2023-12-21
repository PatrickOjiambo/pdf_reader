import 'package:flutter/material.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';

List<Map<String, dynamic>> fileFinder(List<FileSystemEntity> entities) {
  List<Map<String, dynamic>> documents = [];
  for (FileSystemEntity entity in entities) {
    if (entity is File) {
      debugPrint(entity.path);
      if (entity.path.endsWith('.pdf')) {
        debugPrint(entity.uri.toString());
        documents.add({
          'path': entity.path,
          'filename': basename(entity.path),
          'size': entity.statSync().size,
          'date': entity.statSync().modified
        });
        debugPrint(documents.toString());
      }
    } else if (entity is Directory) {
      continue;
    }
  }

  return documents;
}

// Scan for pdf files in the device and save the path in the list
Future<List<Map<String, dynamic>>> scanPdfFiles() async {
  var permission = await Permission.manageExternalStorage.status;
  List<Map<String, dynamic>> documents = [];
  if (permission.isDenied) {
    await Permission.manageExternalStorage.request();
  }
  if (permission.isGranted) {
    Directory directory = Directory('/storage/emulated/0/Documents');
    try {
      List<FileSystemEntity> entities =
          directory.listSync(recursive: true, followLinks: false);
      debugPrint(entities.toString());
      documents = fileFinder(entities);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  // If files list is empty then we will return empty list
  return documents;
}
