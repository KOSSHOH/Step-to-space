import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/bloc/card_bloc.dart';
import 'package:shopping_figma_one/src/bloc/shopping_block.dart';
import 'package:shopping_figma_one/src/bloc/size_block.dart';
import 'package:shopping_figma_one/src/database/database_helper_card.dart';
import 'package:shopping_figma_one/src/model/card_model.dart';
import 'package:shopping_figma_one/src/model/item_model.dart';
import 'package:shopping_figma_one/src/model/size_model.dart';

class BottomDialog {
  static void itemBuy(BuildContext context, ItemModel item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              margin: EdgeInsets.only(top: 44),
              child: Container(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 54),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: AppTheme.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 4,
                      width: 44,
                      decoration: BoxDecoration(
                        color: AppTheme.black10,
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Bid or Buy",
                      style: TextStyle(
                        fontFamily: AppTheme.fontText,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        height: 1.5,
                        color: AppTheme.black,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 88,
                      child: Row(
                        children: [
                          Container(
                            child: Center(
                              child: Container(
                                child: Image.asset(
                                  item.image,
                                ),
                                height: 50,
                                width: 70,
                              ),
                            ),
                            width: 88,
                            height: 88,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                              color: AppTheme.black5,
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 22,
                                  width: 24,
                                  margin: EdgeInsets.only(
                                    bottom: 4,
                                  ),
                                  child: SvgPicture.asset(
                                    item.companyImage,
                                  ),
                                ),
                                Text(
                                  item.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontText,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    height: 1.33,
                                    color: AppTheme.black,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  item.type,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontText,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 11,
                                    height: 1.45,
                                    color: AppTheme.black30,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "\$" + item.price.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontText,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    height: 1.43,
                                    color: AppTheme.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder(
                      stream: shoppingBloc.allShopping,
                      builder: (context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return GestureDetector(
                            onTap: () {
                              BottomDialog.itemSize(context);
                            },
                            child: Container(
                              height: 56,
                              margin: EdgeInsets.only(
                                top: 10,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.black5,
                                borderRadius: BorderRadius.circular(
                                  29.0,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    "U.S. Men’s Size",
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      height: 1.43,
                                      color: AppTheme.black30,
                                    ),
                                  ),
                                  SizedBox(width: 9),
                                  Text(
                                    snapshot.data,
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      height: 1.5,
                                      color: AppTheme.black,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  SvgPicture.asset(
                                    "assets/images/chevronDown.svg",
                                  ),
                                  SizedBox(width: 16),
                                ],
                              ),
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            BottomDialog.itemSize(context);
                          },
                          child: Container(
                            height: 56,
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.black5,
                              borderRadius: BorderRadius.circular(
                                29.0,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 20),
                                Text(
                                  "U.S. Men’s Size",
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontText,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    height: 1.43,
                                    color: AppTheme.black30,
                                  ),
                                ),
                                Expanded(child: Container()),
                                SvgPicture.asset(
                                  "assets/images/chevronDown.svg",
                                ),
                                SizedBox(width: 16),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      height: 56,
                      padding: EdgeInsets.all(
                        2.0,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.black5,
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 52,
                              decoration: BoxDecoration(
                                color: AppTheme.green,
                                borderRadius: BorderRadius.circular(
                                  50,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.03),
                                    spreadRadius: 0,
                                    blurRadius: 20,
                                    offset: Offset(
                                      0,
                                      4,
                                    ), // changes position of shadow
                                  ),
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.03),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: Offset(
                                      0,
                                      1,
                                    ), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Price Bid",
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    height: 1.45,
                                    color: AppTheme.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 52,
                              child: Center(
                                child: Text(
                                  "Buy Now",
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    height: 1.45,
                                    color: AppTheme.black30,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 56,
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      color: AppTheme.white,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/usd.svg",
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              "Enter Bid",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.black30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppTheme.black10,
                    ),
                    SizedBox(height: 8),
                    Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: "Or ",
                            style: TextStyle(
                              fontFamily: AppTheme.fontText,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                              height: 1.45,
                              color: AppTheme.black30,
                            ),
                          ),
                          TextSpan(
                            text: "Buy Now ",
                            style: TextStyle(
                              fontFamily: AppTheme.fontText,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                              height: 1.45,
                              color: AppTheme.green,
                            ),
                          ),
                          TextSpan(
                            text: "or as low as \$26/month with affirm ",
                            style: TextStyle(
                              fontFamily: AppTheme.fontText,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                              height: 1.45,
                              color: AppTheme.black30,
                            ),
                          ),
                          TextSpan(
                            text: "Learn more",
                            style: TextStyle(
                              fontFamily: AppTheme.fontText,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                              height: 1.45,
                              color: AppTheme.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Text(
                          "Discount",
                          style: TextStyle(
                            fontFamily: AppTheme.fontText,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            height: 1.33,
                            color: AppTheme.black,
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          padding: EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            left: 12,
                            right: 12,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.black5,
                            borderRadius: BorderRadius.circular(
                              20.0,
                            ),
                          ),
                          child: Text(
                            "+ Add Discount",
                            style: TextStyle(
                              fontFamily: AppTheme.fontText,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              height: 1.45,
                              color: AppTheme.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      height: 1,
                      color: AppTheme.black10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Total (USD)",
                          style: TextStyle(
                            fontFamily: AppTheme.fontText,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            height: 1.45,
                            color: AppTheme.black,
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "\$0.00",
                          style: TextStyle(
                            fontFamily: AppTheme.fontText,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            height: 1.45,
                            color: AppTheme.black,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    StreamBuilder(
                      stream: shoppingBloc.allShopping,
                      builder: (context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              BottomDialog.itemPayment(context, item);
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 16,
                                bottom: 16,
                                left: 30,
                                right: 30,
                              ),
                              width: 160,
                              decoration: BoxDecoration(
                                color: AppTheme.blue,
                                borderRadius: BorderRadius.circular(60.0),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Next",
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      height: 1.5,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  SvgPicture.asset(
                                    "assets/images/chevronRightWhite.svg",
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                        return GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 16,
                              bottom: 16,
                              left: 61,
                              right: 61,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.white,
                              borderRadius: BorderRadius.circular(60.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.03),
                                  spreadRadius: 0,
                                  blurRadius: 20,
                                  offset: Offset(
                                    0,
                                    4,
                                  ), // changes position of shadow
                                ),
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.03),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(
                                    0,
                                    2,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Text(
                              "Next",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 1.5,
                                color: AppTheme.black30,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  static void itemSize(BuildContext context) {
    sizeBloc.fetchAllSize();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              margin: EdgeInsets.only(top: 44),
              child: Container(
                padding: EdgeInsets.only(
                  left: 22.5,
                  right: 22.5,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: AppTheme.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 4,
                      width: 44,
                      decoration: BoxDecoration(
                        color: AppTheme.black10,
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Select U.S Men’s Size",
                      style: TextStyle(
                        fontFamily: AppTheme.fontText,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        height: 1.5,
                        color: AppTheme.black,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        bottom: 16,
                        top: 16,
                        right: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.black5,
                        borderRadius: BorderRadius.circular(
                          72,
                        ),
                      ),
                      margin: EdgeInsets.only(
                        top: 30,
                        left: 7.5,
                        right: 7.5,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "All Size",
                            style: TextStyle(
                              fontFamily: AppTheme.fontText,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              height: 1.45,
                              color: AppTheme.black,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "\$237",
                            style: TextStyle(
                              fontFamily: AppTheme.fontText,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              height: 1.5,
                              color: AppTheme.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder(
                        stream: sizeBloc.allSize,
                        builder:
                            (context, AsyncSnapshot<List<SizeModel>> snapshot) {
                          if (snapshot.hasData) {
                            return GridView.count(
                                padding: EdgeInsets.only(
                                  top: 15,
                                ),
                                crossAxisCount: 3,
                                childAspectRatio: 1.0,
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                children: snapshot.data.map((SizeModel data) {
                                  return GestureDetector(
                                    onTap: () {
                                      shoppingBloc.fetchAllShopping(data.size);
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(7.5),
                                      decoration: BoxDecoration(
                                        color: AppTheme.black5,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "US " + data.size,
                                            style: TextStyle(
                                              fontFamily: AppTheme.fontText,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              height: 1.45,
                                              color: AppTheme.black,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            data.price == 0
                                                ? "BID"
                                                : "\$" + data.price.toString(),
                                            style: TextStyle(
                                              fontFamily: AppTheme.fontText,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              height: 1.5,
                                              color: data.price != 0
                                                  ? AppTheme.green
                                                  : AppTheme.black60,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList());
                          }
                          return GridView.count(
                              crossAxisCount: 3,
                              padding: EdgeInsets.only(
                                top: 15,
                              ),
                              children: <String>[
                                '',
                                '',
                                '',
                                '',
                                '',
                                '',
                                '',
                                '',
                                '',
                                '',
                                '',
                                '',
                                '',
                                '',
                                '',
                                '',
                                '',
                              ].map((String url) {
                                return Container(
                                  margin: EdgeInsets.all(7.5),
                                  decoration: BoxDecoration(
                                    color: AppTheme.black5,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                );
                              }).toList());
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  static void searchFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              margin: EdgeInsets.only(top: 44),
              child: Container(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: AppTheme.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 4,
                      width: 44,
                      decoration: BoxDecoration(
                        color: AppTheme.black10,
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Filter",
                      style: TextStyle(
                        fontFamily: AppTheme.fontText,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        height: 1.5,
                        color: AppTheme.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.only(
                          top: 18,
                        ),
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Sort buy",
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontDisplay,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    height: 1.4,
                                    color: AppTheme.black,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  top: 8,
                                  left: 14,
                                  bottom: 8,
                                  right: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.black5,
                                  borderRadius: BorderRadius.circular(
                                    40,
                                  ),
                                ),
                                child: Text(
                                  "Featured",
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    height: 1.43,
                                    color: AppTheme.black60,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Brand",
                            style: TextStyle(
                              fontFamily: AppTheme.fontDisplay,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              height: 1.4,
                              color: AppTheme.black,
                            ),
                          ),
                          SizedBox(height: 26),
                          Text(
                            "Size Types",
                            style: TextStyle(
                              fontFamily: AppTheme.fontDisplay,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              height: 1.4,
                              color: AppTheme.black,
                            ),
                          ),
                          SizedBox(height: 26),
                          Text(
                            "Sizes",
                            style: TextStyle(
                              fontFamily: AppTheme.fontDisplay,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              height: 1.4,
                              color: AppTheme.black,
                            ),
                          ),
                          SizedBox(height: 26),
                          Text(
                            "Price",
                            style: TextStyle(
                              fontFamily: AppTheme.fontDisplay,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              height: 1.4,
                              color: AppTheme.black,
                            ),
                          ),
                          SizedBox(height: 26),
                          Text(
                            "Releas Years",
                            style: TextStyle(
                              fontFamily: AppTheme.fontDisplay,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              height: 1.4,
                              color: AppTheme.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 16,
                              bottom: 54,
                            ),
                            padding: EdgeInsets.only(
                              top: 16,
                              bottom: 16,
                              left: 61,
                              right: 61,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.white,
                              borderRadius: BorderRadius.circular(60.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.03),
                                  spreadRadius: 0,
                                  blurRadius: 20,
                                  offset: Offset(
                                    0,
                                    4,
                                  ), // changes position of shadow
                                ),
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.03),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(
                                    0,
                                    2,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Result",
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    height: 1.5,
                                    color: AppTheme.black30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  static void itemPayment(BuildContext context, ItemModel itemModel) {
    DatabaseHelperCard dataBase = new DatabaseHelperCard();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              margin: EdgeInsets.only(top: 44),
              child: Container(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: AppTheme.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 4,
                      width: 44,
                      decoration: BoxDecoration(
                        color: AppTheme.black10,
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            BottomDialog.itemBuy(context, itemModel);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 20,
                            ),
                            child: SvgPicture.asset(
                              "assets/images/chevronLeft.svg",
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Add Payment Method",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 1.5,
                                color: AppTheme.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 64,
                        ),
                      ],
                    ),
                    Expanded(
                      child: FutureBuilder<List<CardModel>>(
                        future: dataBase.getProduct(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData)
                            return ListView.builder(
                              padding: EdgeInsets.only(
                                top: 15,
                                left: 30,
                                right: 30,
                              ),
                              itemCount: snapshot.data.length + 1,
                              itemBuilder: (BuildContext contex, int index) {
                                return index == snapshot.data.length
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          BottomDialog.itemAddCard(
                                            context,
                                            itemModel,
                                          );
                                        },
                                        child: Container(
                                          height: 200,
                                          margin: EdgeInsets.only(
                                            top: 20,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppTheme.black5,
                                            borderRadius: BorderRadius.circular(
                                              16.0,
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/images/plus.svg",
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                "Add Card",
                                                style: TextStyle(
                                                  fontFamily: AppTheme.fontText,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  height: 1.45,
                                                  color: AppTheme.black,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 200,
                                        margin: EdgeInsets.only(
                                          top: 20,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppTheme.white,
                                          borderRadius: BorderRadius.circular(
                                            16.0,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 5.32,
                                              spreadRadius: 0,
                                              offset: Offset(
                                                0,
                                                1.2,
                                              ),
                                              color: Color.fromRGBO(
                                                0,
                                                0,
                                                0,
                                                0.032,
                                              ),
                                            ),
                                            BoxShadow(
                                              blurRadius: 17.87,
                                              spreadRadius: 0,
                                              offset: Offset(
                                                0,
                                                4.2,
                                              ),
                                              color: Color.fromRGBO(
                                                0,
                                                0,
                                                0,
                                                0.0477,
                                              ),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: SvgPicture.asset(
                                                "assets/images/master_card.svg",
                                              ),
                                              margin: EdgeInsets.only(
                                                top: 30,
                                                left: 30,
                                              ),
                                            ),
                                            Expanded(child: Container()),
                                            Container(
                                              margin: EdgeInsets.only(
                                                left: 30,
                                                bottom: 10,
                                              ),
                                              child: Text(
                                                snapshot.data[index].number,
                                                style: TextStyle(
                                                  fontFamily: AppTheme.fontText,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  height: 1.5,
                                                  color: AppTheme.black,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Card Holder",
                                                          style: TextStyle(
                                                            fontFamily: AppTheme
                                                                .fontText,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 11,
                                                            height: 1.45,
                                                            color: AppTheme
                                                                .black30,
                                                          ),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          snapshot
                                                              .data[index].name,
                                                          style: TextStyle(
                                                            fontFamily: AppTheme
                                                                .fontText,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 11,
                                                            height: 1.45,
                                                            color: AppTheme
                                                                .black60,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(width: 12),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Expires",
                                                          style: TextStyle(
                                                            fontFamily: AppTheme
                                                                .fontText,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 11,
                                                            height: 1.45,
                                                            color: AppTheme
                                                                .black30,
                                                          ),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          snapshot.data[index]
                                                              .expiry,
                                                          style: TextStyle(
                                                            fontFamily: AppTheme
                                                                .fontText,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 11,
                                                            height: 1.45,
                                                            color: AppTheme
                                                                .black60,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              margin: EdgeInsets.only(
                                                left: 30,
                                                right: 30,
                                                bottom: 30,
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                              },
                            );
                          return Container();
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  static void itemAddCard(BuildContext context, ItemModel itemModel) {
    TextEditingController numberController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController expiryController = TextEditingController();
    TextEditingController securityCodeController = TextEditingController();

    String number = "", name = "", expiry = "", securityCode = "";
    bool isBack = true, isNext = false;

    var maskCardNumberFormatter = new MaskTextInputFormatter(
        mask: '#### #### #### ####', filter: {"#": RegExp(r'[0-9]')});
    var maskCardDateFormatter = new MaskTextInputFormatter(
        mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
    var maskCardSecurityCodeFormatter = new MaskTextInputFormatter(
        mask: '###', filter: {"#": RegExp(r'[0-9]')});

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            numberController.addListener(() {
              setState(() {
                isBack = true;
                number = numberController.text;
                if (number.length == 19 &&
                    name.length > 0 &&
                    expiry.length == 5 &&
                    securityCode.length == 3) {
                  isNext = true;
                } else {
                  isNext = false;
                }
              });
            });
            nameController.addListener(() {
              setState(() {
                isBack = true;
                name = nameController.text;
                if (number.length == 19 &&
                    name.length > 0 &&
                    expiry.length == 5 &&
                    securityCode.length == 3) {
                  isNext = true;
                } else {
                  isNext = false;
                }
              });
            });
            expiryController.addListener(() {
              setState(() {
                isBack = true;
                expiry = expiryController.text;
                if (number.length == 19 &&
                    name.length > 0 &&
                    expiry.length == 5 &&
                    securityCode.length == 3) {
                  isNext = true;
                } else {
                  isNext = false;
                }
              });
            });
            securityCodeController.addListener(() {
              setState(() {
                isBack = false;
                securityCode = securityCodeController.text;
                if (number.length == 19 &&
                    name.length > 0 &&
                    expiry.length == 5 &&
                    securityCode.length == 3) {
                  isNext = true;
                } else {
                  isNext = false;
                }
              });
            });
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                margin: EdgeInsets.only(top: 44),
                padding: EdgeInsets.only(
                  top: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: AppTheme.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 4,
                      width: 44,
                      decoration: BoxDecoration(
                        color: AppTheme.black10,
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            BottomDialog.itemPayment(context, itemModel);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 20,
                            ),
                            child: SvgPicture.asset(
                              "assets/images/chevronLeft.svg",
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Add Card",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 1.5,
                                color: AppTheme.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 64,
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 30,
                              left: 30,
                              right: 30,
                            ),
                            child: Text(
                              "Start typing to add your credit card details. Everything will update according to your data.",
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                height: 1.45,
                                color: AppTheme.black60,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 20,
                              left: 30,
                              right: 30,
                            ),
                            height: 200,
                            decoration: BoxDecoration(
                              color: AppTheme.white,
                              borderRadius: BorderRadius.circular(
                                16.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5.32,
                                  spreadRadius: 0,
                                  offset: Offset(
                                    0,
                                    1.2,
                                  ),
                                  color: Color.fromRGBO(
                                    0,
                                    0,
                                    0,
                                    0.032,
                                  ),
                                ),
                                BoxShadow(
                                  blurRadius: 17.87,
                                  spreadRadius: 0,
                                  offset: Offset(
                                    0,
                                    4.2,
                                  ),
                                  color: Color.fromRGBO(
                                    0,
                                    0,
                                    0,
                                    0.0477,
                                  ),
                                ),
                              ],
                            ),
                            child: !isBack
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 30,
                                        ),
                                        height: 39,
                                        width: double.infinity,
                                        color: AppTheme.black5,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 21,
                                          left: 20,
                                          right: 95,
                                        ),
                                        height: 35,
                                        width: double.infinity,
                                        color: AppTheme.black5,
                                        child: Row(
                                          children: [
                                            Expanded(child: Container()),
                                            Container(
                                              height: 35,
                                              width: 48,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Center(
                                                      child: Text(
                                                        securityCode,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              AppTheme.fontText,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          height: 1.33,
                                                          color: AppTheme.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 48,
                                                    height: 0.5,
                                                    color: AppTheme.black,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: SvgPicture.asset(
                                          "assets/images/master_card.svg",
                                        ),
                                        margin: EdgeInsets.only(
                                          top: 30,
                                          left: 30,
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 30,
                                          bottom: 10,
                                        ),
                                        child: Text(
                                          number,
                                          style: TextStyle(
                                            fontFamily: AppTheme.fontText,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            height: 1.5,
                                            color: AppTheme.black,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Card Holder",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          AppTheme.fontText,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 11,
                                                      height: 1.45,
                                                      color: AppTheme.black30,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    name,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          AppTheme.fontText,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 11,
                                                      height: 1.45,
                                                      color: AppTheme.black60,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Expires",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          AppTheme.fontText,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 11,
                                                      height: 1.45,
                                                      color: AppTheme.black30,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    expiry,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          AppTheme.fontText,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 11,
                                                      height: 1.45,
                                                      color: AppTheme.black60,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        margin: EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          bottom: 30,
                                        ),
                                      )
                                    ],
                                  ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 10,
                              left: 50,
                              right: 50,
                            ),
                            child: TextField(
                              controller: numberController,
                              inputFormatters: [maskCardNumberFormatter],
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 1.5,
                                color: AppTheme.black,
                              ),
                              decoration: InputDecoration(
                                hintText: "Card Number",
                                hintStyle: TextStyle(
                                  fontFamily: AppTheme.fontText,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  height: 1.5,
                                  color: AppTheme.black30,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppTheme.black30,
                                    width: 0.5,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppTheme.black,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 10,
                              left: 50,
                              right: 50,
                            ),
                            child: TextField(
                              controller: nameController,
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 1.5,
                                color: AppTheme.black,
                              ),
                              decoration: InputDecoration(
                                hintText: "Full Name",
                                hintStyle: TextStyle(
                                  fontFamily: AppTheme.fontText,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  height: 1.5,
                                  color: AppTheme.black30,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppTheme.black30,
                                    width: 0.5,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppTheme.black,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 10,
                              left: 50,
                              right: 50,
                            ),
                            child: TextField(
                              controller: expiryController,
                              inputFormatters: [maskCardDateFormatter],
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 1.5,
                                color: AppTheme.black,
                              ),
                              decoration: InputDecoration(
                                hintText: "Expiry Date",
                                hintStyle: TextStyle(
                                  fontFamily: AppTheme.fontText,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  height: 1.5,
                                  color: AppTheme.black30,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppTheme.black30,
                                    width: 0.5,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppTheme.black,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 10,
                              left: 50,
                              right: 50,
                            ),
                            child: TextField(
                              controller: securityCodeController,
                              inputFormatters: [maskCardSecurityCodeFormatter],
                              style: TextStyle(
                                fontFamily: AppTheme.fontText,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 1.5,
                                color: AppTheme.black,
                              ),
                              decoration: InputDecoration(
                                hintText: "Security Code",
                                hintStyle: TextStyle(
                                  fontFamily: AppTheme.fontText,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  height: 1.5,
                                  color: AppTheme.black30,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppTheme.black30,
                                    width: 0.5,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppTheme.black,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          isNext
                              ? Row(
                                  children: [
                                    Expanded(child: Container()),
                                    GestureDetector(
                                      onTap: () {
                                        cardBloc.fetchSaveCard(
                                          CardModel(
                                            number: number,
                                            name: name,
                                            expiry: expiry,
                                            securityCode: securityCode,
                                          ),
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          top: 46,
                                        ),
                                        padding: EdgeInsets.only(
                                          top: 16,
                                          bottom: 16,
                                          left: 30,
                                          right: 30,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppTheme.blue,
                                          borderRadius:
                                              BorderRadius.circular(60.0),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Save",
                                              style: TextStyle(
                                                fontFamily: AppTheme.fontText,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                height: 1.5,
                                                color: AppTheme.white,
                                              ),
                                            ),
                                            Container(width: 37),
                                            SvgPicture.asset(
                                              "assets/images/chevronRightWhite.svg",
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Expanded(child: Container()),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          top: 46,
                                        ),
                                        padding: EdgeInsets.only(
                                          top: 16,
                                          bottom: 16,
                                          left: 61,
                                          right: 61,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppTheme.white,
                                          borderRadius:
                                              BorderRadius.circular(60.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.03),
                                              spreadRadius: 0,
                                              blurRadius: 20,
                                              offset: Offset(
                                                0,
                                                4,
                                              ), // changes position of shadow
                                            ),
                                            BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.03),
                                              spreadRadius: 0,
                                              blurRadius: 4,
                                              offset: Offset(
                                                0,
                                                2,
                                              ), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Save",
                                              style: TextStyle(
                                                fontFamily: AppTheme.fontText,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                height: 1.5,
                                                color: AppTheme.black30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                  ],
                                )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
