import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsPage extends StatefulWidget {
  const PermissionsPage({super.key});

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  @override
  Widget build(BuildContext context) {
    Column topText() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SizedBox(
            height: 20,),
          Text(
            "Welcome to",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            "PDF READER",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
          SizedBox(
            height: 20,
          ),
          Image(
            image: AssetImage("assets/images/cartFile.png", ),
            height: 200,
            width: 200
          ),
        ],
      );
    }

    Column bottomText() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Permission required",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black, ),
                textAlign: TextAlign.left,
          ),
          const Text(
            "To read and edit your files, please allow Your PDF Reader to access all your files",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () async {
              var permission = await Permission.manageExternalStorage.status;

              if (permission.isDenied) {
               await Permission.manageExternalStorage.request();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              minimumSize: const Size(double.infinity, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(10.0)
            ),
          
            child: const Text("Allow", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),)
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              debugPrint("Tapped on skip");
              //Add implemetation to skip the permission
            },
            child: const Text(
              "Later",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 87, 85, 85)),
            ),
          ),
        ],
      );
    }

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
          child: Container(
              child: Column(
              children: [
          topText(),
          const SizedBox(
            height: 10,
          ),
          bottomText()
              ],
            )),
        ));
  }
}
