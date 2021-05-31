import 'package:flutter/material.dart';
import 'package:responsive_app/layout_breakpoints.dart';
import 'package:responsive_app/pages/home/sections/courses_sections/widgets/course_item.dart';

class CoursesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 20,
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth >= TABLET_BREAKPOINT ? .0 : 16.0
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300.0,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemBuilder: (context, index){
            return CourseItem();
          },
        );
      }
    );
  }
}