import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CourseItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.network(
          "https://images.ctfassets.net/yzn2zv0qt1y1/HPpO54097u1z54OPIeXMV/053a1971426df016e2e56507dfaa1c56/christopher-gower-m_HRfLhgABo-unsplash.jpg?w=750",
          fit: BoxFit.fitWidth,
        ),
        SizedBox(height: 4.0),
        Flexible(
          child: AutoSizeText(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit lorem ipsum dolor",
            maxLines: 2,
            minFontSize: 8.0,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          "Paulo Kennedy",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 4.0),
        Row(
          children: [
            Icon(Icons.star, color: Colors.white, size: 14.0),
            Icon(Icons.star, color: Colors.white, size: 14.0),
            Icon(Icons.star, color: Colors.white, size: 14.0),
            Icon(Icons.star, color: Colors.white, size: 14.0),
            Icon(Icons.star, color: Colors.white, size: 14.0),
          ],
        ),
      ],
    );
  }
}