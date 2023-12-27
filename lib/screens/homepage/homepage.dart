import 'package:flutter/material.dart';
import 'package:pdf_reader/widgets/app_bar.dart';
import 'package:pdf_reader/utils/path_fetcher.dart';
import 'package:pdf_reader/widgets/document_list_tile.dart';
import 'package:pdf_reader/screens/view_pdf.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Map<String, dynamic>>> files = scanPdfFiles();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("HomePage"),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: files,
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading files'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var file = snapshot.data![index];
                return GestureDetector(
                  child: documentCard("./assets/images/pdficon.png",
                      file['date'], file['size'], file['filename']),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PDFScreen(
                                  path: file['path'],
                                )));
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
