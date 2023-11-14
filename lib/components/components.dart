import "package:flutter/material.dart";

//The top section of the main screen
Row top() {
  return Row(
    children: [
      Row(
        children: const [
          Icon(Icons.place, color: Colors.white, size: 20),
          Text(
            "New York",
            style: TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
      const Spacer(),
      const Icon(
        Icons.menu,
        color: Colors.white,
        size: 20,
      )
    ],
  );
}

Column date() {
  return Column(
    children: const [
      Text(
        "June 10",
        style: TextStyle(
            fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        "Updated as of 10:14PM GMT-4",
        style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300),
      )
    ],
  );
}

Column weatherToday() {
  return Column(
    children: const [
      Image(
        image: AssetImage("assets/images/cloudy.png"),
        height: 80,
        width: 100,
      ),
      Text(
        "Cloudy",
        style: TextStyle(
            fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Text(
        "25°",
        style: TextStyle(
            fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
      )
    ],
  );
}

Column humidity() {
  return Column(
    children: const [
      Image(
        image: AssetImage("assets/images/humidity.png"),
      ),
      Text(
        "HUMIDITY",
        style: TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
      ),
      SizedBox(height: 5),
      Text(
        "80%",
        style: TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
      ),
    ],
  );
}

Column wind() {
  return Column(
    children: const [
      Image(
        image: AssetImage("assets/images/wind.png"),
      ),
      Text(
        "WIND",
        style: TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
      ),
      SizedBox(height: 5),
      Text(
        "5km/h",
        style: TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
      ),
    ],
  );
}

Column temperature() {
  return Column(
    children: const [
      Image(
        image: AssetImage("assets/images/feels_like.png"),
      ),
      Text(
        "FEELS LIKE",
        style: TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
      ),
      SizedBox(height: 5),
      Text(
        "25°",
        style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.normal),
      ),
    ],
  );
}

Row humidityWindTemperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      humidity(),
      wind(),
      temperature(),
    ],
  );
}

Opacity futureWeather() {
  return Opacity(
    opacity: 0.5,
    child: SizedBox(
      height: 153,
      child: Card(
        color: const Color(0xFF535353),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Wed 16",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                Image(
                    image: AssetImage("assets/images/calmsunny.png"),
                    width: 80,
                    height: 50),
                Text(
                  "25°",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                Text(
                  "1-5km/h",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Wed 16",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                Image(
                    image: AssetImage("assets/images/calmsunny.png"),
                    width: 80,
                    height: 50),
                Text(
                  "25°",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                Text(
                  "1-5km/h",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Wed 16",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                Image(
                    image: AssetImage("assets/images/calmsunny.png"),
                    width: 80,
                    height: 50),
                Text(
                  "25°",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                Text(
                  "1-5km/h",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Wed 16",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                Image(
                    image: AssetImage("assets/images/calmsunny.png"),
                    width: 80,
                    height: 50),
                Text(
                  "25°",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                Text(
                  "1-5km/h",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
