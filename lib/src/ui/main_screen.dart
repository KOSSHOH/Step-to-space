import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxbus/rxbus.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/model/event_bus/event_botton_view_model.dart';
import 'package:shopping_figma_one/src/model/navigation_item.dart';
import 'package:shopping_figma_one/src/ui/auth/splash_screen.dart';
import 'package:shopping_figma_one/src/ui/bottom_view/home/home_screen.dart';
import 'package:shopping_figma_one/src/ui/bottom_view/search_screen.dart';
import 'package:shopping_figma_one/src/ui/bottom_view/profile/profile_screen.dart';
import 'package:shopping_figma_one/src/utils/utils.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  bool _isLogin = false;
  PageController _pageController;

  List<NavigationItem> items = [
    NavigationItem(
      SvgPicture.asset(
        "assets/images/home.svg",
      ),
      Text(
        "Today",
        style: TextStyle(
          fontFamily: AppTheme.fontText,
          fontWeight: FontWeight.bold,
          fontSize: 11,
          height: 1.45,
          color: AppTheme.black,
        ),
      ),
    ),
    NavigationItem(
      SvgPicture.asset(
        "assets/images/search.svg",
      ),
      Text(
        "Search",
        style: TextStyle(
          fontFamily: AppTheme.fontText,
          fontWeight: FontWeight.bold,
          fontSize: 11,
          height: 1.45,
          color: AppTheme.black,
        ),
      ),
    ),
    NavigationItem(
      SvgPicture.asset(
        "assets/images/user.svg",
      ),
      Text(
        "My",
        style: TextStyle(
          fontFamily: AppTheme.fontText,
          fontWeight: FontWeight.bold,
          fontSize: 11,
          height: 1.45,
          color: AppTheme.black,
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _registerBus();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Utils.isLogin().then((value) => _isLogin = value);
    return Scaffold(
      body: Stack(
        children: [
          Theme(
            data: ThemeData(
              platform: TargetPlatform.android,
            ),
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(
                  () => _currentIndex = index,
                );
              },
              children: <Widget>[
                HomeScreen(),
                SearchScreen(),
                ProfileScreen(),
              ],
            ),
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Container(
                height: 80,
                width: 260,
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                margin: EdgeInsets.only(
                  bottom: 44,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(60.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.05),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: Offset(
                        0,
                        2,
                      ), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.05),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(
                        0,
                        4,
                      ), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: items.map((item) {
                    var itemIndex = items.indexOf(item);
                    return GestureDetector(
                      onTap: () {
                        if (itemIndex == 2) {
                          if (_isLogin) {
                            setState(() {
                              _currentIndex = itemIndex;
                              _pageController.jumpToPage(itemIndex);
                            });
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SplashScreen(),
                              ),
                            );
                          }
                        } else {
                          setState(() {
                            _currentIndex = itemIndex;
                            _pageController.jumpToPage(itemIndex);
                          });
                        }
                      },
                      child: _buildItem(item, _currentIndex == itemIndex),
                    );
                  }).toList(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _registerBus() async {
    RxBus.register<EventBottomViewModel>(tag: "EVENT_BOTTOM_VIEW").listen(
      (event) => {
        Utils.isLogin().then((value) => {
              if (value)
                {
                  setState(() {
                    _currentIndex = event.index;
                    _pageController.jumpToPage(event.index);
                  }),
                }
              else
                {
                  setState(() {
                    _currentIndex = 0;
                    _pageController.jumpToPage(0);
                  }),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SplashScreen(),
                    ),
                  ),
                }
            }),
      },
    );
  }

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 270),
      width: isSelected ? 110 : 56,
      height: 48,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: 12,
      ),
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: AppTheme.black5,
            )
          : null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              item.icon,
              SizedBox(width: isSelected ? 8 : 0),
              isSelected ? item.title : Container(),
            ],
          )
        ],
      ),
    );
  }
}
