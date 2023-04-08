import 'package:flutter/material.dart';

Color textFieldColor() {
  return Color.fromARGB(255, 5, 50, 80);
}

Widget alartContainer() {
  
  return Container(
    height: 300,
    child: Column(
      children: [
        TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Name',
            hintStyle: TextStyle(color: Colors.white),

            
            fillColor: textFieldColor().withOpacity(0.8),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        TextField(),
        ElevatedButton(onPressed: () {}, child: Text('Done'))
      ],
    ),
  );
}
