import 'package:flutter/material.dart';

class TopSectionImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Image.network(
      // "https://images.unsplash.com/photo-1515343480029-43cdfe6b6aae?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80",
      "https://cdn.hswstatic.com/gif/computer-keyboard-2.jpg",
      fit: BoxFit.cover,
    );
  }
}