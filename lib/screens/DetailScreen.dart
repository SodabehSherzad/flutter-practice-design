import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../customs/BorderBox.dart';
import '../customs/OptionButton.dart';
import '../utils/constants.dart';
import '../utils/custom_functions.dart';
import '../utils/sample_data.dart';
import '../utils/widget_functions.dart';
import 'LandingScreen.dart';

class DetailScreen extends StatefulWidget {
  dynamic data;
  DetailScreen({this.data});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = 25;
    final EdgeInsets sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final themeData = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset("${widget.data["image"]}"),
                      Positioned(
                        left: padding,
                        right: padding,
                        top: padding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BorderBox(
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.arrow_back, color: COLOR_BLACK),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              ),
                              width: 50,
                              height: 50,
                            ),
                            const BorderBox(
                              child: Icon(Icons.favorite_border,
                                  color: COLOR_BLACK),
                              width: 50,
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(padding),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formatCurrency(2230000),
                              style: themeData.textTheme.headline1,
                            ),
                            Text(
                              "${widget.data["address"]}",
                              style: themeData.textTheme.subtitle1,
                            ),
                          ],
                        ),
                        BorderBox(
                          child: Text(
                            "20 Hours ago",
                            style: themeData.textTheme.headline3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "Hause Information",
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        // padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: DETAIL_DATA.length,
                        itemBuilder: (context, index) {
                          return RealEstateDetailItem(itemData: DETAIL_DATA, index: index);
                        }),
                  ),
                  // addVerticalSpace(padding),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                        padding: sidePadding,
                        child: Text("${widget.data["description"]}",
                          textAlign: TextAlign.justify,
                        ),
                                        ),
                      ),
                    ),
                ],
              ),
              Positioned(
                right: 50,
                left: 50,
                bottom: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OptionButton(
                      icon: Icons.message_rounded,
                      text: "Message",
                    ),
                    OptionButton(
                      icon: Icons.phone_android_rounded,
                      text: "Call",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RealEstateDetailItem extends StatelessWidget {
  final dynamic itemData;
  final int index;
  const RealEstateDetailItem({@required this.itemData, @required this.index});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderBox(
            child: Text(
              "${itemData[index]["num"]}",
              style: themeData.textTheme.headline2,
            ),
            width: 100,
            height: 100,
          ),
          addVerticalSpace(20),
          Text(
            "${itemData[index]["title"]}",
            style: themeData.textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
