import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rxbus/rxbus.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/model/event_bus/event_message_model.dart';
import 'package:shopping_figma_one/src/ui/search/search_item_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> listItems = [
    "jordan 1",
    "yeezy",
    "jodan",
    "off white",
    "dior",
    "travis scott",
    "supreme",
    "air force1",
    "jordan 4",
    "adidas",
  ];

  double animAppBar = 30.0;
  var closeTimer = Duration(milliseconds: 300);

  @override
  void initState() {
    _registerBus();
    super.initState();
  }

  @override
  void dispose() {
    RxBus.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedContainer(
            height: animAppBar,
            duration: closeTimer,
            curve: Curves.easeOut,
            color: AppTheme.white,
          ),
          Container(
            height: 34,
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Text(
              "Search",
              style: TextStyle(
                fontFamily: AppTheme.fontDisplay,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                height: 1.14,
                color: AppTheme.black,
              ),
            ),
          ),
          AnimatedContainer(
            height: animAppBar == 0.0 ? 30.0 : 0.0,
            duration: closeTimer,
            curve: Curves.easeOut,
            color: AppTheme.white,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      animAppBar = 0.0;
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: SearchItemScreen(""),
                        ),
                      );
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.black5,
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                    ),
                    height: 56,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 16),
                        SvgPicture.asset("assets/images/search.svg"),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Search",
                            style: TextStyle(
                              fontFamily: AppTheme.fontText,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              height: 1.5,
                              color: AppTheme.black30,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        SvgPicture.asset("assets/images/filter.svg"),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.black5,
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                ),
                height: 44,
                width: 44,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/camera.svg",
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          AnimatedContainer(
            height: animAppBar == 0.0 ? 30.0 : 0.0,
            duration: closeTimer,
            curve: Curves.easeOut,
            color: AppTheme.white,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(
                top: 0,
                bottom: 120,
              ),
              itemCount: listItems.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      animAppBar = 0.0;
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: SearchItemScreen(listItems[index]),
                        ),
                      );
                    });
                  },
                  child: Container(
                    height: 44,
                    margin: EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Center(
                      child: Text(
                        listItems[index],
                        style: TextStyle(
                          fontFamily: AppTheme.fontText,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          height: 1.5,
                          color: AppTheme.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _registerBus() async {
    RxBus.register<EventMessageModel>(tag: "EVENT_ANIM_SEARCH").listen(
      (event) => {
        setState(() {
          animAppBar = 30;
        }),
      },
    );
  }
}
