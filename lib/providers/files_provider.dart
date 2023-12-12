// Purpose: Provides the list of files to the app
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pdf_reader/utils/pdf_fetcher.dart';

class FilesProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<File> _files = [];
// ignore: prefer_final_fields
  List<File> _trash_files = [];
// ignore: prefer_final_fields
List<File> _reading_now = [];
//Getters for the file lists
  List<File> get trash_files => _trash_files;
  List<File> get files => _files;
  List<File> get reading_now => _reading_now;

  void addFile(File file) {
    _files.add(file);
    notifyListeners();
  }

  void removeFile(File file) {
    _files.remove(file);
    notifyListeners();
  }

  void addToTrash(File file) {
    _files.remove(file);
    _trash_files.add(file);
    notifyListeners();
  }

  void restoreFromTrash(File file) {
    _trash_files.remove(file);
    _files.add(file);
    notifyListeners();
  }

  void emptyTrash() {
    _trash_files.clear();
    deleteListOfFiles(_trash_files);
    notifyListeners();
  }

  void deleteFile(File file) {
    _trash_files.remove(file);
    deletefile(file);
    notifyListeners();
  }
  void addToReadingNow(File file){
    _reading_now.add(file);
    notifyListeners();
  }
}
