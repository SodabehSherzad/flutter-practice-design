import 'package:design_app/utils/constants.dart';
import 'package:design_app/utils/widget_functions.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final double width;
  final IconData icon;
  final String text;

  OptionButton({this.icon, this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: FlatButton(
        child: Row(
          children: [
            Icon(icon, color: COLOR_WHITE,),
            addHorizontalSpace(10),
            Text(text, style: TextStyle(color: COLOR_WHITE),),
          ],
        ),
        splashColor: COLOR_WHITE.withAlpha(55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: COLOR_DARK_BLUE,
        onPressed: () {},

      ),
    );
  }
}
