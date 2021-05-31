import 'package:flutter/material.dart';
import 'package:responsive_app/pages/home/widgets/input/custom_search_field.dart';

class TopSectionInfoAndSearchContent extends StatelessWidget {
  final double? titleFontSize;
  final double? subtitleFontSize;

  const TopSectionInfoAndSearchContent({
    @required this.titleFontSize,
    @required this.subtitleFontSize
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Aprenda Flutter com este curso.",
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          style: TextStyle(
            fontSize: subtitleFontSize,
            color: Colors.white
          ),
        ),
        const SizedBox(height: 16.0),
        CustomSearchField()
      ],
    );
  }
}