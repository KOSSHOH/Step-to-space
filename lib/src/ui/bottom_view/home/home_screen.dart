import 'package:flutter/material.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/ui/bottom_view/home/popular_screen.dart';
import 'package:shopping_figma_one/src/ui/bottom_view/home/story_screen.dart';
import 'package:shopping_figma_one/src/ui/bottom_view/search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'New&Popular'),
    new Tab(text: 'Story'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
          Container(
            margin: EdgeInsets.only(
              top: 30,
              left: 30,
              right: 30,
            ),
            child: Text(
              "Today",
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
          TabBar(
            controller: _tabController,
            labelColor: AppTheme.black,
            unselectedLabelColor: AppTheme.black30,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: AppTheme.fontDisplay,
              fontSize: 22,
              height: 1.14,
              color: AppTheme.black,
            ),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppTheme.white,
            ),
            tabs: myTabs,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                PopularScreen(),
                StoryScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
