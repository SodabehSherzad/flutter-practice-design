// ignore_for_file: sized_box_for_whitespace

import 'package:design_app/customs/OptionButton.dart';
import 'package:design_app/screens/DetailScreen.dart';
import 'package:design_app/utils/constants.dart';
import 'package:design_app/utils/sample_data.dart';
import 'package:design_app/utils/widget_functions.dart';
import 'package:design_app/utils/custom_functions.dart';
import 'package:flutter/material.dart';

import '../customs/BorderBox.dart';

class LandingScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LandingScreen();

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double padding = 25;
    const EdgeInsets sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final themeData = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const BorderBox(
                            height: 50, width: 50, child: Icon(Icons.menu)),
                        const BorderBox(
                            height: 50, width: 50, child: Icon(Icons.settings)),
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "City",
                      style: themeData.textTheme.bodyText2,
                    ),
                  ),
                  addVerticalSpace(10),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "San Fransisco",
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                      thickness: 1.0,
                    ),
                  ),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        "<\220,000",
                        "For Sale",
                        "3-4 Beds",
                        ">1000 sqft"
                      ].map((e) => ChoiceOption(text: e)).toList(),
                    ),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: Padding(
                      padding: sidePadding,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: RE_DATA.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: RealEstateItem(itemData: RE_DATA[index]),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(data: RE_DATA[index])), 
                                );
                              },
                            );
                          }),
                    ),
                  ),
                ],
              ),
              Positioned(
                // ignore: sort_child_properties_last
                child: Center(
                    child: OptionButton(
                        icon: Icons.map_rounded,
                        text: "Map View",
                        width: size.width * 0.36)),
                bottom: 20,
                width: size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;
  const ChoiceOption({this.text});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: COLOR_GREY.withAlpha(25)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 25),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;
  const RealEstateItem({@required this.itemData});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                child: Image.asset(itemData["image"]),
                borderRadius: BorderRadius.circular(25),
              ),
              const Positioned(
                top: 15,
                right: 15,
                child: BorderBox(
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.favorite_border,
                    color: COLOR_BLACK,
                  ),
                ),
              )
            ],
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Expanded(
                child: Text(
                  "${formatCurrency(itemData["amount"])}",
                  style: themeData.textTheme.headline1,
                  softWrap: false,
                ),
              ),
              addHorizontalSpace(10),
              Expanded(
                child: Text(
                  "${itemData["address"]}",
                  style: themeData.textTheme.bodyText2,
                  softWrap: false,
                ),
              ),
            ],
          ),
          addVerticalSpace(10),
          Text(
            "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft",
            style: themeData.textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
