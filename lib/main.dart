import 'package:flutter/material.dart';
import 'package:pdf_reader/screens/homepage/home_page.dart';
import 'package:pdf_reader/widgets/app_bar.dart';
import 'package:pdf_reader/utils/path_fetcher.dart';
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
               Future<List<String>> myList =  scanPdfFiles();
               debugPrint(myList.toString());
               debugPrint("Some logs need to work MAIN");
               debugPrint("Past the logs MAIN");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
              },
              child: const Text("Go to HomePage"),
            ),
          ],
        ),
      ),
    );
  }
}


