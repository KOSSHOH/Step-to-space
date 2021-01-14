import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:rxbus/rxbus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/bloc/search_bloc.dart';
import 'package:shopping_figma_one/src/database/database_helper_history.dart';
import 'package:shopping_figma_one/src/dialog/bottom_dialog.dart';
import 'package:shopping_figma_one/src/model/event_bus/event_message_model.dart';
import 'package:shopping_figma_one/src/model/item_model.dart';
import 'package:shopping_figma_one/src/ui/item/item_screen.dart';

class SearchItemScreen extends StatefulWidget {
  final String text;

  SearchItemScreen(this.text);

  @override
  State<StatefulWidget> createState() {
    return _SearchItemScreenState();
  }
}

class _SearchItemScreenState extends State<SearchItemScreen>
    with SingleTickerProviderStateMixin {
  var height = 84.0;
  var width = 0.0;
  bool isSearch = false;
  TextEditingController searchResultController = TextEditingController();
  DatabaseHelperHistory dataHistory = new DatabaseHelperHistory();
  bool isHistory = true;

  var durationTime = Duration(
    milliseconds: 300,
  );

  List<int> shimmer = [
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
  ];

  @override
  void initState() {
    searchResultController.text = widget.text;
    Timer(Duration(milliseconds: 1), () {
      setState(() {
        height = 20.0;
        width = 24.0;
      });
    });
    super.initState();
  }

  _SearchItemScreenState() {
    searchResultController.addListener(() {
      if (searchResultController.text.length > 2) {
        setState(() {
          isHistory = false;
          _getResultData(searchResultController.text);
        });
      } else {
        setState(() {
          isHistory = true;
        });
      }
    });
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
                                  onFieldSubmitted: (value) {
                                    if (searchResultController.text.length >
                                        0) {
                                      var data = dataHistory.getProducts(
                                          searchResultController.text);
                                      data.then(
                                        (value) => {
                                          if (value == 0)
                                            {
                                              dataHistory.saveProducts(
                                                  searchResultController.text),
                                            }
                                          else
                                            {
                                              dataHistory.updateProduct(
                                                  searchResultController.text),
                                            },
                                        },
                                      );
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                    }
                                  },
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
                          onTap: () {
                            BottomDialog.searchFilter(context);
                          },
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
                                  onTap: () {
                                    setState(() {
                                      searchResultController.text = "";
                                      FocusScopeNode currentFocus = FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                    });
                                  },
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
            Expanded(
              child: isHistory
                  ? FutureBuilder<List<String>>(
                      future: dataHistory.getProdu(),
                      builder: (context, snapshots) {
                        if (snapshots.data == null) {
                          return Container(
                            child: Center(
                              child: Text(""),
                            ),
                          );
                        }

                        return snapshots.data.length > 0
                            ? Column(
                                children: [
                                  Container(
                                    height: 18,
                                    margin: EdgeInsets.only(
                                      top: 20,
                                      left: 30,
                                      right: 30,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Recent Keywords",
                                          style: TextStyle(
                                            fontFamily: AppTheme.fontText,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            height: 1.33,
                                            color: AppTheme.black30,
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              dataHistory.clear();
                                            });
                                          },
                                          child: Text(
                                            "Clear All",
                                            style: TextStyle(
                                              fontFamily: AppTheme.fontText,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12,
                                              height: 1.33,
                                              color: AppTheme.black60,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      padding: EdgeInsets.only(
                                        left: 30,
                                        right: 30,
                                        top: 3,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshots.data.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              searchResultController.text =
                                                  snapshots.data[index];
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                              top: 17,
                                              bottom: 17,
                                            ),
                                            color: AppTheme.white,
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    snapshots.data[index],
                                                    style: TextStyle(
                                                      fontFamily:
                                                          AppTheme.fontText,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                      height: 1.43,
                                                      color: AppTheme.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 12),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      dataHistory
                                                          .deleteProducts(
                                                              snapshots
                                                                  .data[index]);
                                                    });
                                                  },
                                                  child: SvgPicture.asset(
                                                    "assets/images/close.svg",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              )
                            : ListView(
                                children: [
                                  Container(
                                    child: Lottie.asset(
                                        'assets/anim/not_found.json'),
                                    height: 250,
                                    margin: EdgeInsets.only(
                                      top: 125,
                                    ),
                                  ),
                                  Text(
                                    "No Results Found",
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      height: 1.45,
                                      color: AppTheme.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              );
                      },
                    )
                  : StreamBuilder(
                      stream: searchBloc.allSearch,
                      builder:
                          (context, AsyncSnapshot<List<ItemModel>> snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 30,
                                  top: 26,
                                  bottom: 26,
                                  right: 30,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      snapshot.data.length.toString(),
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        height: 1.33,
                                        color: AppTheme.black,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "Result",
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        height: 1.33,
                                        color: AppTheme.black30,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.65,
                                  padding: EdgeInsets.only(
                                    left: 22.5,
                                    right: 22.5,
                                  ),
                                  controller: new ScrollController(
                                    keepScrollOffset: false,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children:
                                      snapshot.data.map((ItemModel value) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScopeNode currentFocus =
                                            FocusScope.of(context);
                                        if (!currentFocus.hasPrimaryFocus) {
                                          currentFocus.unfocus();
                                        }
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => ItemScreen(
                                              itemModel: value,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        color: AppTheme.white,
                                        margin: EdgeInsets.only(
                                          left: 7.5,
                                          right: 7.5,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: (MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2) -
                                                  37.5,
                                              height: (MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2) -
                                                  37.5,
                                              decoration: BoxDecoration(
                                                color: AppTheme.black5,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  12.0,
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      top: 23,
                                                      left: 15,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      value.companyImage,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      left: 15,
                                                    ),
                                                    child: Hero(
                                                      child: Image.asset(
                                                        value.image,
                                                      ),
                                                      tag: value,
                                                    ),
                                                    height: 85,
                                                    width: 120,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              value.name,
                                              style: TextStyle(
                                                fontFamily: AppTheme.fontText,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                height: 1.33,
                                                color: AppTheme.black,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              value.type,
                                              style: TextStyle(
                                                fontFamily: AppTheme.fontText,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                height: 1.33,
                                                color: AppTheme.black30,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "\$" + value.price.toString(),
                                              style: TextStyle(
                                                fontFamily: AppTheme.fontText,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                height: 1.43,
                                                color: AppTheme.black,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          );
                        }
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300],
                          highlightColor: Colors.grey[100],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 30,
                                  top: 26,
                                  bottom: 26,
                                ),
                                height: 16,
                                width: 76,
                                decoration: BoxDecoration(
                                  color: AppTheme.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              Expanded(child: GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio: 0.65,
                                padding: EdgeInsets.only(
                                  left: 22.5,
                                  right: 22.5,
                                ),
                                controller: new ScrollController(
                                  keepScrollOffset: false,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: shimmer.map((int value) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                      left: 7.5,
                                      right: 7.5,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: (MediaQuery.of(context)
                                              .size
                                              .width /
                                              2) -
                                              37.5,
                                          height: (MediaQuery.of(context)
                                              .size
                                              .width /
                                              2) -
                                              37.5,
                                          decoration: BoxDecoration(
                                            color: AppTheme.white,
                                            borderRadius:
                                            BorderRadius.circular(
                                              12.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            color: AppTheme.white,
                                          ),
                                          height: 28,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 12,
                                            right: 32,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            color: AppTheme.white,
                                          ),
                                          height: 18,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),)
                            ],
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }

  void _getResultData(String obj) async {
    if (obj.length > 2) {
      searchBloc.fetchAllSearch();
    }
  }
}
