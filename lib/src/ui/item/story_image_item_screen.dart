import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/model/story_model.dart';

class StoryImageItemScreen extends StatefulWidget {
  StoryImageItemScreen({this.itemModel});

  final StoryModel itemModel;

  @override
  _StoryImageItemScreenState createState() => _StoryImageItemScreenState();
}

class _StoryImageItemScreenState extends State<StoryImageItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Theme(
        data: ThemeData(
          platform: TargetPlatform.android,
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 0.0),
          children: [
            Container(
              width: double.infinity,
              height: 375,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 375,
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: widget.itemModel,
                      child: Image.asset(
                        widget.itemModel.image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 74,
                          left: 30,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFD11C33),
                          borderRadius: BorderRadius.circular(
                            44.0,
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/images/chevronLeftWhite.svg",
                          ),
                        ),
                        height: 44,
                        width: 44,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 74,
                        right: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF8D363C),
                        borderRadius: BorderRadius.circular(
                          44.0,
                        ),
                      ),
                      height: 44,
                      width: 44,
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/moreWhite.svg",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: AppTheme.black,
              padding: EdgeInsets.only(
                left: 30,
                bottom: 40,
                right: 30,
                top: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "The stock market for things",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 1.4,
                      color: AppTheme.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "X-S-Store is the world’s first stock market for things – a live ‘bid/ask’ marketplace. Buyers place bids, sellers place asks and when a bid and ask meet, the transaction happens automatically. Retro Jordans, Nikes, Yeezys and more – now 100% authentic guaranteed.",
                    style: TextStyle(
                      fontFamily: AppTheme.fontText,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 1.43,
                      color: AppTheme.white60,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: AppTheme.white,
              padding: EdgeInsets.only(
                left: 30,
                bottom: 40,
                right: 30,
                top: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "The Basic",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 1.4,
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Anonymity",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.5,
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Never worry about legit buyers or sellers – we’re in the middle.",
                    style: TextStyle(
                      fontFamily: AppTheme.fontText,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 1.43,
                      color: AppTheme.black60,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Transparency",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.5,
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Real-time market data for intelligent buying and selling.",
                    style: TextStyle(
                      fontFamily: AppTheme.fontText,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 1.43,
                      color: AppTheme.black60,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Authenticity",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.5,
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Our experts authenticate every product sold on X-S-Store.",
                    style: TextStyle(
                      fontFamily: AppTheme.fontText,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 1.43,
                      color: AppTheme.black60,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: AppTheme.black5,
              padding: EdgeInsets.only(
                left: 30,
                bottom: 40,
                right: 30,
                top: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Buying on X-S-Store",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 1.4,
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Bid (Buy)",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.5,
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Make an offer that any seller can accept; or purchase immediately at the lowest Ask.",
                    style: TextStyle(
                      fontFamily: AppTheme.fontText,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 1.43,
                      color: AppTheme.black60,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Authenticate",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.5,
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Seller ships to us. We authenticate, then we release funds to the seller.",
                    style: TextStyle(
                      fontFamily: AppTheme.fontText,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 1.43,
                      color: AppTheme.black60,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Prosper",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.5,
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "We ship to you. You sip a daiquiri, knowing you will never get a fake.",
                    style: TextStyle(
                      fontFamily: AppTheme.fontText,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 1.43,
                      color: AppTheme.black60,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        padding: EdgeInsets.only(
                          left: 35,
                          right: 35,
                          top: 16,
                          bottom: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            60.0,
                          ),
                          color: AppTheme.green,
                        ),
                        child: Text(
                          "Learn More",
                          style: TextStyle(
                            fontFamily: AppTheme.fontText,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            height: 1.5,
                            color: AppTheme.white,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: AppTheme.white,
              padding: EdgeInsets.only(
                left: 30,
                bottom: 40,
                right: 30,
                top: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Selling on X-S-Store",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 1.4,
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Ask (Sell)",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.5,
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "List an item for sale; or sell immediately at the highest Bid.",
                    style: TextStyle(
                      fontFamily: AppTheme.fontText,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 1.43,
                      color: AppTheme.black60,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Authenticate",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.5,
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Ship your item within 2 business days. We authenticate, then we ship to the buyer.",
                    style: TextStyle(
                      fontFamily: AppTheme.fontText,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 1.43,
                      color: AppTheme.black60,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Prosper",
                    style: TextStyle(
                      fontFamily: AppTheme.fontDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.5,
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "We release funds to you. You sip a daiquiri, knowing you will never get a chargeback.",
                    style: TextStyle(
                      fontFamily: AppTheme.fontText,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 1.43,
                      color: AppTheme.black60,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        padding: EdgeInsets.only(
                          left: 35,
                          right: 35,
                          top: 16,
                          bottom: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            60.0,
                          ),
                          color: AppTheme.red,
                        ),
                        child: Text(
                          "Learn More",
                          style: TextStyle(
                            fontFamily: AppTheme.fontText,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            height: 1.5,
                            color: AppTheme.white,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 110),
          ],
        ),
      ),
    );
  }
}
