import 'package:design_app/utils/constants.dart';

import 'package:flutter/material.dart';

class BorderBox extends StatelessWidget {
   final Widget child;
   final EdgeInsets padding;
   final double height, width;
  
  // ignore: use_key_in_widget_constructors
  const BorderBox({this.padding, this.height, this.width, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: child),
      height: height,
      width: width,
      padding: padding ?? EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2),
        color: COLOR_WHITE,
      ),
    );
  }
}