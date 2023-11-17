import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
                  ))));
    }

    Opacity addNew() {
      return Opacity(
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
                            Icons.add,
                            color: Colors.white,
                            size: 50,
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
                  ))));
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
