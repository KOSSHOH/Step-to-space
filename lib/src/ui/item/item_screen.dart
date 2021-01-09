import 'dart:ui';

import 'package:flutter/material.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              width: 250,
              child: Hero(
                transitionOnUserGestures: true,
                tag: widget.itemModel,
                child: Image.asset(widget.itemModel.image),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                child: Container(
                  color: Colors.white.withOpacity(0.3),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.itemModel.name} - Medium",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.itemModel.price.toString()} pc (500g - 700g)",
                          style: TextStyle(fontSize: 25, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  // child: ,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
