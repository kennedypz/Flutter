import 'package:flutter/material.dart';

class AdvantageItem extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool isVertical;

  const AdvantageItem({
    @required this.title,
    @required this.subtitle,
    this.isVertical = false
  });

  @override
  Widget build(BuildContext context) {
    if(isVertical){
      return Column(
        children: [
          Icon(
            Icons.star,
            color: Colors.white,
            size: 50.0
          ),
          SizedBox(height: 8.0),
          Text(
            title!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: Colors.white,
          size: 50.0
        ),
        SizedBox(width: 8.0),
        Column(
          children: [
            Text(
              title!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              subtitle!,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}