import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String cityName = "";
  //Finding the path to the directory where we will store our file
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  //Creating a reference to the file location
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/city.txt');
  }
  //Writing city name to the file
Future<File> writeCity(String city) async {
final file = await _localFile;
debugPrint("City added");
return file.writeAsString(city);
}
//Reading city names from the file
Future<String> readCity() async {
  try {
    final file = await _localFile;
    String contents = await file.readAsString();
    debugPrint("Cities read");
    return contents;
  } catch (e) {
    debugPrint("Error: $e");
    return "";
  }
}

String allCities = "";
@override
void initState(){
  super.initState();
  readCity().then((String value){
    setState(() {
      allCities = value;
      
    });
     debugPrint(allCities);
  });
 
}
  @override
  Widget build(BuildContext context) {
    SizedBox data() {
      return SizedBox(
        width: 345,
        height: 153,
        child: Opacity(
          opacity: 0.5,
          child: Card(
            color: const Color(0xFF535353),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Paris",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Text(
                        "Clear",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: const [
                          Text(
                            "Humidity",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Text(
                            "  72%",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "Wind",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Text(
                            "  1km/h",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Image(
                        image: AssetImage("assets/images/sunny.png"),
                        width: 80,
                        height: 50,
                      ),
                      Text(
                        "25°",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    GestureDetector addNew() {
      TextEditingController cityController = TextEditingController();

      return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  "Input city name",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
                content: TextField(
                  controller: cityController,
                  obscureText: false,
                  enableSuggestions: true,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  decoration: InputDecoration(
                    labelText: "City name",
                    labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.8),
                   
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text(
                      "Add",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    onPressed: () async{
                      setState(() {
                        cityName = cityController.text;
                      });
                      await writeCity(cityName);
                      // ignore: use_build_context_synchronously
                      if(!context.mounted) return;
                      Navigator.of(context).pop();
                    },
                  ),
                ],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                backgroundColor: const Color(0xFF535353),
              );
            },
          );
        },
        child: Opacity(
          opacity: 0.5,
          child: SizedBox(
            width: 345,
            height: 59,
            child: Card(
              color: const Color(0xFF535353),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.white,
                        size: 30,
                        weight: 1,
                      ),
                      Text(
                        "Add New",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 58, 19, 131),
          Color.fromARGB(255, 19, 54, 131),
          Color.fromARGB(255, 58, 19, 131),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
      ),
      child: Column(
        children: [
          data(),
          const SizedBox(
            height: 10,
          ),
          data(),
          const SizedBox(
            height: 10,
          ),
          data(),
          const SizedBox(
            height: 10,
          ),
          addNew(),
        ],
      ),
    );
  }
}
