import 'package:flutter/material.dart';
import 'package:ui_challenge/components/components.dart';

class Frame extends StatefulWidget {
  const Frame({super.key});

  @override
  State<Frame> createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/london.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Column(
            children: [
              top(),
              const SizedBox(
                height: 20,
              ),
              date(),
              const SizedBox(
                height: 10,
              ),
              weatherToday(),
              const SizedBox(
                height: 10,
              ),
              humidityWindTemperature(),
              const SizedBox(
                height: 10,
              ),
              futureWeather()
            ],
          ),
        ),
      ),
    );
  }
}
