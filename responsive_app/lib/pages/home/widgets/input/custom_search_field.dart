import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Pesquise",
        hintStyle: TextStyle(
          color: Colors.white
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          onPressed: (){}
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}