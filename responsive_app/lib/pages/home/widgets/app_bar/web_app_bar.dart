import 'package:flutter/material.dart';
import 'package:responsive_app/pages/home/widgets/app_bar/web_app_bar_responsive_content.dart';

class WebAppBar extends StatelessWidget implements PreferredSize{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      toolbarHeight: 72.0,
      title: Row(
        children: [
          Text("Flutter"),
          const SizedBox(width: 32.0),
          WebAppBarResponsiveContent(),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){}
          ),
          const SizedBox(width: 24.0),
          Container(
            height: 38.0,
            child: OutlinedButton(
              child: Text(
                "Fazer login",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.white,
                  width: 2.0
                ),
              ),
              onPressed: (){},
            ),
          ),
          const SizedBox(width: 8.0),
          Container(
            height: 38.0,
            child: ElevatedButton(
              child: Text(
                "Cadastre-se",
                style: TextStyle(
                  color: Colors.black
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => Size.fromHeight(72.0);
}