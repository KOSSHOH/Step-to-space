import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxbus/rxbus.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/model/event_bus/event_message_model.dart';

class SearchItemScreen extends StatefulWidget {
  final String text;

  SearchItemScreen(this.text);

  @override
  State<StatefulWidget> createState() {
    return _SearchScreenState();
  }
}

String obj = "";

class _SearchScreenState extends State<SearchItemScreen>
    with SingleTickerProviderStateMixin {
  var height = 84.0;
  var width = 0.0;
  bool isSearch = false;
  TextEditingController searchResultController = TextEditingController();

  var durationTime = Duration(
    milliseconds: 300,
  );

  @override
  void initState() {
    Timer(Duration(milliseconds: 1), () {
      setState(() {
        height = 20.0;
        width = 24.0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    RxBus.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        setState(() {
          height = 84.0;
          width = 0.0;
        });
        Timer(durationTime, () {
          RxBus.post(
            EventMessageModel(message: ""),
            tag: "EVENT_ANIM_SEARCH",
          );
          Navigator.pop(context);
        });
        return false;
      },
      child: Scaffold(
        backgroundColor: AppTheme.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            backgroundColor: AppTheme.white,
            brightness: Brightness.light,
          ),
        ),
        body: Column(
          children: [
            AnimatedContainer(
              height: height,
              duration: durationTime,
              curve: Curves.easeOut,
              color: AppTheme.white,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 56,
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: AppTheme.black5,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/images/search.svg",
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Theme(
                            data: ThemeData(
                              platform: Platform.isAndroid
                                  ? TargetPlatform.android
                                  : TargetPlatform.iOS,
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                bottom: 2,
                              ),
                              child: Center(
                                child: TextFormField(
                                  textInputAction: TextInputAction.search,
                                  autofocus: true,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    height: 1.5,
                                    color: AppTheme.black,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search",
                                    hintStyle: TextStyle(
                                      fontFamily: AppTheme.fontText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      height: 1.5,
                                      color: AppTheme.black30,
                                    ),
                                  ),
                                  controller: searchResultController,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/images/filter.svg",
                          ),
                        ),
                        AnimatedContainer(
                          width: width,
                          duration: durationTime,
                          curve: Curves.easeOut,
                          color: AppTheme.white5,
                          child: height == 84.0
                              ? Container()
                              : GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    color: AppTheme.white5,
                                    margin: EdgeInsets.only(
                                      left: 8,
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/images/clear.svg",
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                AnimatedContainer(
                  duration: durationTime,
                  curve: Curves.easeOut,
                  decoration: BoxDecoration(
                    color: height == 84.0 ? AppTheme.black5 : AppTheme.white5,
                    borderRadius: BorderRadius.circular(
                      height == 84.0 ? 44 : 0,
                    ),
                  ),
                  child: height == 84.0
                      ? Container(
                          height: 44,
                          width: 44,
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/images/camera.svg",
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            setState(() {
                              height = 84.0;
                              width = 0.0;
                            });
                            Timer(durationTime, () {
                              RxBus.post(
                                EventMessageModel(message: ""),
                                tag: "EVENT_ANIM_SEARCH",
                              );
                              Navigator.pop(context);
                            });
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontFamily: AppTheme.fontDisplay,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              height: 2,
                              color: AppTheme.black30,
                            ),
                          ),
                        ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _getResultData(int index) async {
    if (obj.length > 2) {
      //blocSearch.fetchAllSearch(index, obj, isMnn);
    }
  }
}
