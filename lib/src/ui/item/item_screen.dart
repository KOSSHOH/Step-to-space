import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/model/item_model.dart';

class ItemScreen extends StatefulWidget {
  ItemScreen({this.itemModel});

  final ItemModel itemModel;

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return [
            SliverAppBar(
              leading: Container(),
              backgroundColor: Colors.grey[300],
              floating: true,
              snap: true,
              pinned: false,
              expandedHeight: 339,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 60,
                        left: 30,
                        right: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 44,
                              width: 44,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppTheme.black5,
                                borderRadius: BorderRadius.circular(
                                  44.0,
                                ),
                              ),
                              child: SvgPicture.asset(
                                "assets/images/chevronLeft.svg",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 221,
                      child: Hero(
                        transitionOnUserGestures: true,
                        tag: widget.itemModel,
                        child: Image.asset(widget.itemModel.image),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ];
        },
        body: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
            child: Container(
                color: AppTheme.white,
                width: MediaQuery.of(context).size.width,
                child: Theme(
                  data: ThemeData(
                    platform: TargetPlatform.android,
                  ),
                  child: ListView(
                    padding: EdgeInsets.all(
                      30.0,
                    ),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Size All",
                            style: TextStyle(
                              fontFamily: AppTheme.fontText,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              height: 1.5,
                              color: AppTheme.black,
                            ),
                          ),
                          Expanded(child: Container()),
                          SvgPicture.asset(
                            "assets/images/chevronDown.svg",
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.green,
                                borderRadius: BorderRadius.circular(
                                  12.0,
                                ),
                              ),
                              height: 72,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Buy",
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontDisplay,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          height: 1.4,
                                          color: AppTheme.white,
                                        ),
                                      ),
                                      SizedBox(width: 8.0),
                                      Text(
                                        "\$${widget.itemModel.price}",
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontDisplay,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          height: 1.4,
                                          color: AppTheme.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "or Bid",
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontText,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          height: 1.33,
                                          color:
                                              AppTheme.white.withOpacity(0.6),
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Text(
                                        "Lowest Ask",
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontText,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          height: 1.33,
                                          color: AppTheme.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.red,
                                borderRadius: BorderRadius.circular(
                                  12.0,
                                ),
                              ),
                              height: 72,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Buy",
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontDisplay,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          height: 1.4,
                                          color: AppTheme.white,
                                        ),
                                      ),
                                      SizedBox(width: 8.0),
                                      Text(
                                        "\$${widget.itemModel.price}",
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontDisplay,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          height: 1.4,
                                          color: AppTheme.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "or Bid",
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontText,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          height: 1.33,
                                          color:
                                              AppTheme.white.withOpacity(0.6),
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Text(
                                        "Highest Bid",
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontText,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          height: 1.33,
                                          color: AppTheme.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        widget.itemModel.name,
                        style: TextStyle(
                          fontFamily: AppTheme.fontDisplay,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 1.18,
                          color: AppTheme.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: "Condition:",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black,
                              ),
                            ),
                            TextSpan(
                              text: "New",
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                fontFamily: AppTheme.fontText,
                                color: AppTheme.green,
                              ),
                            ),
                            WidgetSpan(
                              child: SizedBox(
                                width: 4,
                              ),
                            ),
                            TextSpan(
                              text: "·",
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                fontFamily: AppTheme.fontText,
                                color: AppTheme.black,
                              ),
                            ),
                            WidgetSpan(
                              child: SizedBox(
                                width: 4,
                              ),
                            ),
                            TextSpan(
                              text: "Ticker:JB-JO1RBGRBW",
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                fontFamily: AppTheme.fontText,
                                color: AppTheme.black,
                              ),
                            ),
                            WidgetSpan(
                              child: SizedBox(
                                width: 4,
                              ),
                            ),
                            TextSpan(
                              text: "·",
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                fontFamily: AppTheme.fontText,
                                color: AppTheme.black,
                              ),
                            ),
                            WidgetSpan(
                              child: SizedBox(
                                width: 4,
                              ),
                            ),
                            TextSpan(
                              text: "100% Authentic",
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                fontFamily: AppTheme.fontText,
                                color: AppTheme.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 60),
                      Text(
                        "Information",
                        style: TextStyle(
                          fontFamily: AppTheme.fontText,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.5,
                          color: AppTheme.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            width: 96,
                            child: Text(
                              "Style",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black60,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "487471-006",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            width: 96,
                            child: Text(
                              "Colorway",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black60,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "BLACK WHITE-OFF WHITE-GYM RED",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            width: 96,
                            child: Text(
                              "Retail Price",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black60,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "\$190",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            width: 96,
                            child: Text(
                              "Release Date",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black60,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "07/02/2020",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.33,
                                color: AppTheme.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 60),
                      Text(
                        "Latest Sales",
                        style: TextStyle(
                          fontFamily: AppTheme.fontText,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.5,
                          color: AppTheme.black,
                        ),
                      ),
                    ],
                  ),
                )
                // child: ,
                ),
          ),
        ),
      ),
    );
  }
}
