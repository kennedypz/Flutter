import 'package:flutter/material.dart';
import 'package:responsive_app/layout_breakpoints.dart';
import 'package:responsive_app/pages/home/sections/advantages_section/widgets/advantage_item.dart';

class AdvantagesSection extends StatelessWidget {

  List<Widget> buildHorizontalAdvantagesList(){
    List<Widget> advantages = [
      AdvantageItem(
        title: "+45.000 alunos",
        subtitle: "Didática garantida"
      ),
      AdvantageItem(
        title: "+45.000 alunos",
        subtitle: "Didática garantida"
      ),
      AdvantageItem(
        title: "+45.000 alunos",
        subtitle: "Didática garantida"
      ),
    ];

    return advantages;
  }

  List<Widget> buildVerticalAdvantagesList(){
    List<Widget> advantages = [
      Expanded(
        child: AdvantageItem(
          title: "+45.000 alunos",
          subtitle: "Didática garantida",
          isVertical: true,
        ),
      ),
      Expanded(
        child: AdvantageItem(
          title: "+45.000 alunos",
          subtitle: "Didática garantida",
          isVertical: true,
        ),
      ),
      Expanded(
        child: AdvantageItem(
          title: "+45.000 alunos",
          subtitle: "Didática garantida",
          isVertical: true,
        ),
      ),
    ];

    return advantages;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints){
        if(constraints.maxWidth >= MOBILE_BREAKPOINT){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              runSpacing: 16.0,
              spacing: 8.0,
              children: [
                ...buildHorizontalAdvantagesList(),
                Divider(color: Colors.grey)
              ]
            ),
          );
        }
        
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(children: buildVerticalAdvantagesList()),
              Divider(color: Colors.grey)
            ],
          ),
        );
      }
    );
  }
}