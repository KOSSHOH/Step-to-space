import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_figma_one/src/app_theme.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        elevation: 1,
        title: Text("Bottom View"),
      ),
      body: Column(
        children: [
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
