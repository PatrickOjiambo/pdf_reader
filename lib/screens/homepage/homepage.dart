import 'package:flutter/material.dart';
import 'package:pdf_reader/widgets/app_bar.dart';
import 'package:pdf_reader/utils/path_fetcher.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<String>> files = scanPdfFiles();
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("HomePage"),
      body: const Center(
        child: Text("HomePage"),
      ),
    );
  }
}
