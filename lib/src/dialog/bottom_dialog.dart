import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/bloc/shopping_block.dart';
import 'package:shopping_figma_one/src/model/item_model.dart';

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
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 17,
                                bottom: 15,
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
                        }
                        return GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 17,
                              bottom: 15,
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
}
