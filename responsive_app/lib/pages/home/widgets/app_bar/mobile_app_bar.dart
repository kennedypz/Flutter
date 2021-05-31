import 'package:flutter/material.dart';

class MobileAppBar extends StatelessWidget implements PreferredSize{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text("Flutter"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (){}
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: (){}
        ),
      ],
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}