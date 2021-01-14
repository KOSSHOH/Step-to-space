import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxbus/rxbus.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/model/event_bus/event_botton_view_model.dart';
import 'package:shopping_figma_one/src/utils/utils.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
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
      body: ListView(
        padding: EdgeInsets.only(
          right: 30,
          bottom: 175,
          left: 30,
        ),
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: AppTheme.black5,
                    borderRadius: BorderRadius.circular(
                      44,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/chevronLeft.svg",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            "Settings",
            style: TextStyle(
              fontFamily: AppTheme.fontDisplay,
              fontWeight: FontWeight.bold,
              fontSize: 28,
              height: 1.14,
              color: AppTheme.black,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "My Account",
            style: TextStyle(
              fontFamily: AppTheme.fontText,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              height: 1.33,
              color: AppTheme.black30,
            ),
          ),
          SizedBox(height: 26),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Currency",
                  style: TextStyle(
                    fontFamily: AppTheme.fontDisplay,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    height: 1.4,
                    color: AppTheme.black,
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/images/user.svg",
              )
            ],
          ),
          SizedBox(height: 26),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Address Book",
                  style: TextStyle(
                    fontFamily: AppTheme.fontDisplay,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    height: 1.4,
                    color: AppTheme.black,
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/images/book.svg",
              )
            ],
          ),
          SizedBox(height: 26),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Payment Infomation",
                  style: TextStyle(
                    fontFamily: AppTheme.fontDisplay,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    height: 1.4,
                    color: AppTheme.black,
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/images/card.svg",
              )
            ],
          ),
          SizedBox(height: 26),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Payout Infomation",
                  style: TextStyle(
                    fontFamily: AppTheme.fontDisplay,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    height: 1.4,
                    color: AppTheme.black,
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/images/payout.svg",
              )
            ],
          ),
          SizedBox(height: 26),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Notification",
                  style: TextStyle(
                    fontFamily: AppTheme.fontDisplay,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    height: 1.4,
                    color: AppTheme.black,
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/images/bell.svg",
              )
            ],
          ),
          SizedBox(height: 48),
          Text(
            "Information",
            style: TextStyle(
              fontFamily: AppTheme.fontText,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              height: 1.33,
              color: AppTheme.black30,
            ),
          ),
          SizedBox(height: 26),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Version",
                  style: TextStyle(
                    fontFamily: AppTheme.fontDisplay,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    height: 1.4,
                    color: AppTheme.black,
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/images/version.svg",
              )
            ],
          ),
          SizedBox(height: 26),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Terms of Service",
                  style: TextStyle(
                    fontFamily: AppTheme.fontDisplay,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    height: 1.4,
                    color: AppTheme.black,
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/images/terms.svg",
              )
            ],
          ),
          SizedBox(height: 26),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Privacy Policy",
                  style: TextStyle(
                    fontFamily: AppTheme.fontDisplay,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    height: 1.4,
                    color: AppTheme.black,
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/images/privacy.svg",
              )
            ],
          ),
          SizedBox(height: 26),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Open Source License",
                  style: TextStyle(
                    fontFamily: AppTheme.fontDisplay,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    height: 1.4,
                    color: AppTheme.black,
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/images/opensoruce.svg",
              )
            ],
          ),
          SizedBox(height: 56),
          GestureDetector(
            onTap: () {
              Utils.clearData();
              RxBus.post(
                EventBottomViewModel(index: 2),
                tag: "EVENT_BOTTOM_VIEW",
              );
              Navigator.of(context)
                  .popUntil((route) => route.isFirst);

            },
            child: Text(
              "Sign Out",
              style: TextStyle(
                fontFamily: AppTheme.fontDisplay,
                fontWeight: FontWeight.normal,
                fontSize: 20,
                height: 1.4,
                color: AppTheme.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
