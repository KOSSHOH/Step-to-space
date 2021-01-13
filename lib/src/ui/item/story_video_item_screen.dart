import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/model/story_model.dart';

class StoryVideoItemScreen extends StatefulWidget {
  StoryVideoItemScreen({this.itemModel});

  final StoryModel itemModel;

  @override
  _StoryVideoItemScreenState createState() => _StoryVideoItemScreenState();
}

class _StoryVideoItemScreenState extends State<StoryVideoItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0), // here the desired height
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Color(0xFF313035),
          brightness: Brightness.dark,
        ),
      ),
      backgroundColor: Color(0xFF313035),
      body: Theme(
        data: ThemeData(
          platform: TargetPlatform.android,
        ),
        child: ListView(
          padding: EdgeInsets.only(
            top: 0.0,
            left: 30,
            right: 30,
          ),
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 74,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF464549),
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
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(
                    top: 74,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF28272E),
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
              ],
            ),
            SizedBox(height: 30),
            Text(
              widget.itemModel.name,
              style: TextStyle(
                fontFamily: AppTheme.fontText,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                height: 1.4,
                color: AppTheme.white,
              ),
            ),
            SizedBox(height: 8),
            Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  WidgetSpan(
                    child: Container(
                      height: 16,
                      width: 16,
                      child: Hero(
                        transitionOnUserGestures: true,
                        tag: widget.itemModel.userImage,
                        child: Image.asset(
                          widget.itemModel.userImage,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 4),
                  ),
                  TextSpan(
                    text: widget.itemModel.userName,
                    style: TextStyle(
                      fontFamily: AppTheme.fontText,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      height: 1.33,
                      color: AppTheme.white,
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 8),
                  ),
                  TextSpan(
                    text: widget.itemModel.viewCount + " Views",
                    style: TextStyle(
                      fontFamily: AppTheme.fontText,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      height: 1.33,
                      color: AppTheme.white,
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 8),
                  ),
                  TextSpan(
                    text: widget.itemModel.time,
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
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 188,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(widget.itemModel.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/images/play.svg",
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Unbox Therapy",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppTheme.fontText,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                fontSize: 11,
                height: 1.45,
                color: AppTheme.white,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "The Nike Adapt BB self lacing sneakers are the most futuristic shoes on the planet. This is the first Nike Adapt BB unboxing.\n\nWATCH SOME MORE VIDEOS...\n\nThey Call It An Invisible Laptop Stand...https://youtu.be/STnS1AwPgxg",
              style: TextStyle(
                fontFamily: AppTheme.fontText,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                fontSize: 14,
                height: 1.45,
                color: AppTheme.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "More",
              style: TextStyle(
                fontFamily: AppTheme.fontText,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                fontSize: 14,
                height: 1.45,
                color: AppTheme.white30,
              ),
            ),
            SizedBox(height: 110),
          ],
        ),
      ),
    );
  }
}
