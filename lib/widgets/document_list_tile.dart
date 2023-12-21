import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Card documentCard(String image, DateTime date, int size, String fileName) {
  String dateString = '${date.year}-${date.month}-${date.day}';
  String timeString = DateFormat('h:mm a').format(date);
  return Card(
    child: Row(
      children: [
        Image(
          image: AssetImage(image),
          height: 50,
          width: 50,
        ),
        Column(
          children: [
            Text(fileName),
            Row(
              children: [
                Text(dateString),
                Text(timeString),
                Text(size as String)
              ],
            )
          ],
        ),
        const Icon(Icons.star_border_outlined),
        const Icon(Icons.more_vert)
      ],
    ),
  );
}
