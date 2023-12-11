import 'package:flutter/material.dart';
Card documentListTile(BuildContext context, String filename, String filetype, String filesize, String filelocation, String image){
  return Card(
   child: Row(
      children: <Widget>[
        SizedBox(
          width: 50,
          height: 50,
          child: Image.asset(image),
        ),
        Expanded(
          flex: 1,
          child: ListTile(
            title: Text(filename),
            subtitle: Text(filetype),
            trailing: Text(filesize),
            onTap: (){
              Navigator.pushNamed(context, filelocation);
            },
          ),
        ),
      ],
   ),

  );
}