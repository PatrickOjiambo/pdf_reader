import 'package:flutter/material.dart';
import 'package:pdf_reader/screens/homepage/permissions.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf_reader/screens/homepage/homepage.dart';
import 'package:pdf_reader/providers/files_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyApp(),
      home: ChangeNotifierProvider(
        create: (context) => FilesProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<PermissionStatus> checkPermission() async {
    return await Permission.manageExternalStorage.status;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PermissionStatus>(
      future: checkPermission(),
      builder:
          (BuildContext context, AsyncSnapshot<PermissionStatus> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show loading spinner while waiting for permission check
        } else {
          if (snapshot.data!.isGranted) {
            debugPrint("Permission is granted");
            return const HomePage(); // Replace with your HomePage widget
          } else {
            debugPrint("Permission is denied");
            return const PermissionsPage();
          }
        }
      },
    );
  }
}
