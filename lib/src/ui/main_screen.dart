import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/ui/home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(
                () => _currentIndex = index,
              );
            },
            children: <Widget>[
              HomeScreen(),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.green,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              padding: EdgeInsets.all(
                16.0,
              ),
              decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(
                    60,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.black5,
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ]),
              margin: EdgeInsets.only(
                bottom: 32,
                left: 66,
                right: 66,
              ),
              child: Container(
                color: AppTheme.black,
                child: BottomNavyBar(

                  selectedIndex: _currentIndex,
                  onItemSelected: (index) {
                    setState(() => _currentIndex = index);
                    _pageController.jumpToPage(index);
                  },
                  items: <BottomNavyBarItem>[
                    BottomNavyBarItem(
                      title: Text('Item One'),
                      icon: Icon(Icons.home),
                    ),
                    BottomNavyBarItem(
                      title: Text('Item Two'),
                      icon: Icon(Icons.apps),
                    ),
                    BottomNavyBarItem(
                      title: Text('Item Three'),
                      icon: Icon(Icons.chat_bubble),
                    ),
                  ],
                ),
              ),
            ),

          )
        ],
      ),
      // bottomNavigationBar: BottomNavyBar(
      //   selectedIndex: _currentIndex,
      //   showElevation: true,
      //   onItemSelected: (index) {
      //     setState(() => _currentIndex = index);
      //     _pageController.jumpToPage(index);
      //   },
      //   items: <BottomNavyBarItem>[
      //     BottomNavyBarItem(
      //       title: Text('Item One'),
      //       icon: Icon(Icons.home),
      //     ),
      //     BottomNavyBarItem(
      //       title: Text('Item Two'),
      //       icon: Icon(Icons.apps),
      //     ),
      //     BottomNavyBarItem(
      //       title: Text('Item Three'),
      //       icon: Icon(Icons.chat_bubble),
      //     ),
      //   ],
      // ),
    );
  }
}
