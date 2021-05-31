import 'package:flutter/material.dart';
import 'package:responsive_app/layout_breakpoints.dart';
import 'package:responsive_app/pages/home/sections/top_section/widgets/top_section_image.dart';
import 'package:responsive_app/pages/home/sections/top_section/widgets/top_section_info_and_search_card.dart';
import 'package:responsive_app/pages/home/sections/top_section/widgets/top_section_info_and_search_content.dart';

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        final double maxWidth = constraints.maxWidth;

        if(maxWidth >= TABLET_BREAKPOINT){
          return AspectRatio(
            aspectRatio: 3.2,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 3.4,
                  child: TopSectionImage(),
                ),
                Positioned(
                  top: 50.0,
                  left: 50.0,
                  child: TopSectionInfoAndSearchCard(
                    width: 450.0,
                    titleFontSize: 40.0,
                    subtitleFontSize: 18.0,
                  ),
                ),
              ],
            ), 
          );
        }

        if(maxWidth >= MOBILE_BREAKPOINT){
          return Container(
            height: 320.0,
            child: Stack(
              children: [
                Container(
                  height: 250.0,
                  width: double.infinity,
                  child: TopSectionImage(),
                ),
                Positioned(
                  top: 20.0,
                  left: 20.0,
                  child: TopSectionInfoAndSearchCard(
                    width: 350.0,
                    titleFontSize: 35.0,
                    subtitleFontSize: 15.0,
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            AspectRatio(
              aspectRatio: 3.4,
              child: TopSectionImage()
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TopSectionInfoAndSearchContent(
                titleFontSize: 35.0,
                subtitleFontSize: 15.0,
              )
            ),
          ],
        );
      },
    );
  }
}