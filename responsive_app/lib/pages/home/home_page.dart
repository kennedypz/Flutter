import 'package:flutter/material.dart';
import 'package:responsive_app/layout_breakpoints.dart';
import 'package:responsive_app/pages/home/sections/advantages_section/advantages_section.dart';
import 'package:responsive_app/pages/home/sections/courses_sections/courses_section.dart';
import 'package:responsive_app/pages/home/sections/top_section/top_section.dart';
import 'package:responsive_app/pages/home/widgets/app_bar/mobile_app_bar.dart';
import 'package:responsive_app/pages/home/widgets/app_bar/web_app_bar.dart';

class HomePage extends StatelessWidget {

  Widget buildBody(BuildContext context){
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1400.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            TopSection(),
            AdvantagesSection(),
            CoursesSection(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        return Scaffold(
          backgroundColor: Colors.black87,
          appBar: constraints.maxWidth < MOBILE_BREAKPOINT ? MobileAppBar() : WebAppBar(),
          drawer: constraints.maxWidth < MOBILE_BREAKPOINT ? Drawer() : null,
          body: Builder(builder: buildBody)
        );
      },
    );
  }
}