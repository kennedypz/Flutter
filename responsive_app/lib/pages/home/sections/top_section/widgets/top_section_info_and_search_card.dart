import 'package:flutter/material.dart';
import 'package:responsive_app/pages/home/sections/top_section/widgets/top_section_info_and_search_content.dart';

class TopSectionInfoAndSearchCard extends StatelessWidget {
  final double? width;
  final double? titleFontSize;
  final double? subtitleFontSize;

  const TopSectionInfoAndSearchCard({
    @required this.width,
    @required this.titleFontSize,
    @required this.subtitleFontSize
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      color: Colors.black,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(22.0),
        child: TopSectionInfoAndSearchContent(
          titleFontSize: titleFontSize,
          subtitleFontSize: subtitleFontSize,
        ),
      )
    );
  }
}