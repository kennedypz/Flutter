import 'package:flutter/material.dart';

class WebAppBarResponsiveContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints){
          return Row(
            children: [
              Expanded(
                child: Container(
                  height: 45.0,
                  padding: const EdgeInsets.only(left: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.grey.shade600)
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Pesquise alguma coisa",
                            isCollapsed: true
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search, color: Colors.grey.shade500),
                        onPressed: (){}
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: constraints.maxHeight >= 400,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: TextButton(
                    child: Text(
                      "Aprender",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onPressed: (){},
                  ),
                ),
              ),
              Visibility(
                visible: constraints.maxHeight >= 500,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: TextButton(
                    child: Text(
                      "Flutter",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onPressed: (){},
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}