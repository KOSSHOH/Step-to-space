import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/ui/bottom_view/profile/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        ),
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 30),
              Expanded(
                child: Text(
                  "My",
                  style: TextStyle(
                    fontFamily: AppTheme.fontDisplay,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    height: 1.14,
                    color: AppTheme.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: 8,
                  ),
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
                      "assets/images/setting.svg",
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(width: 18),
              Container(
                margin: EdgeInsets.only(
                  right: 16,
                ),
                height: 96,
                width: 96,
                child: Image.asset(
                  "assets/images/my.png",
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jeans",
                      style: TextStyle(
                        fontFamily: AppTheme.fontDisplay,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        height: 1.4,
                        color: AppTheme.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "jeans@jeans-studio.com",
                      style: TextStyle(
                        fontFamily: AppTheme.fontDisplay,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        height: 1.33,
                        color: AppTheme.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontFamily: AppTheme.fontText,
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                        height: 1.45,
                        color: AppTheme.black30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 28),
          Container(
            margin: EdgeInsets.only(
              left: 30,
            ),
            child: Text(
              "Buying",
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
            margin: EdgeInsets.only(top: 8, left: 30),
            padding: EdgeInsets.all(
              20.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12,
              ),
              color: AppTheme.green.withOpacity(
                0.05,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Current",
                        style: TextStyle(
                          fontFamily: AppTheme.fontText,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          height: 1.45,
                          color: AppTheme.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "3",
                        style: TextStyle(
                          fontFamily: AppTheme.fontDisplay,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 1.4,
                          color: AppTheme.green,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pending",
                        style: TextStyle(
                          fontFamily: AppTheme.fontText,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          height: 1.45,
                          color: AppTheme.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "0",
                        style: TextStyle(
                          fontFamily: AppTheme.fontDisplay,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 1.4,
                          color: AppTheme.green,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "History",
                        style: TextStyle(
                          fontFamily: AppTheme.fontText,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          height: 1.45,
                          color: AppTheme.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "5",
                        style: TextStyle(
                          fontFamily: AppTheme.fontDisplay,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 1.4,
                          color: AppTheme.green,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 28),
          Container(
            margin: EdgeInsets.only(
              left: 30,
            ),
            child: Text(
              "Selling",
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
            margin: EdgeInsets.only(top: 8, left: 30),
            padding: EdgeInsets.all(
              20.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12,
              ),
              color: AppTheme.red.withOpacity(
                0.05,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Current",
                        style: TextStyle(
                          fontFamily: AppTheme.fontText,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          height: 1.45,
                          color: AppTheme.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "3",
                        style: TextStyle(
                          fontFamily: AppTheme.fontDisplay,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 1.4,
                          color: AppTheme.red,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pending",
                        style: TextStyle(
                          fontFamily: AppTheme.fontText,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          height: 1.45,
                          color: AppTheme.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "0",
                        style: TextStyle(
                          fontFamily: AppTheme.fontDisplay,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 1.4,
                          color: AppTheme.red,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "History",
                        style: TextStyle(
                          fontFamily: AppTheme.fontText,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          height: 1.45,
                          color: AppTheme.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "5",
                        style: TextStyle(
                          fontFamily: AppTheme.fontDisplay,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 1.4,
                          color: AppTheme.red,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 28),
          Row(
            children: [
              SizedBox(width: 30),
              Expanded(
                child: Text(
                  "Portfolio",
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
                height: 36,
                decoration: BoxDecoration(
                  color: AppTheme.black5,
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                ),
                padding: EdgeInsets.only(
                  left: 14,
                  right: 14,
                ),
                child: Center(
                  child: Text(
                    "3",
                    style: TextStyle(
                      fontFamily: AppTheme.fontText,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 1.43,
                      color: AppTheme.black60,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 28),
          Row(
            children: [
              SizedBox(width: 30),
              Expanded(
                child: Text(
                  "Follwing",
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
                height: 36,
                decoration: BoxDecoration(
                  color: AppTheme.black5,
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                ),
                padding: EdgeInsets.only(
                  left: 14,
                  right: 14,
                ),
                child: Center(
                  child: Text(
                    "32",
                    style: TextStyle(
                      fontFamily: AppTheme.fontText,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 1.43,
                      color: AppTheme.black60,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 28),
          Row(
            children: [
              SizedBox(width: 30),
              Expanded(
                child: Text(
                  "Blog",
                  style: TextStyle(
                    fontFamily: AppTheme.fontDisplay,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1.4,
                    color: AppTheme.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 28),
          Row(
            children: [
              SizedBox(width: 30),
              Expanded(
                child: Text(
                  "Help",
                  style: TextStyle(
                    fontFamily: AppTheme.fontDisplay,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1.4,
                    color: AppTheme.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 28),
          Row(
            children: [
              SizedBox(width: 30),
              Expanded(
                child: Text(
                  "How It Works",
                  style: TextStyle(
                    fontFamily: AppTheme.fontDisplay,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1.4,
                    color: AppTheme.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 28),
          Row(
            children: [
              SizedBox(width: 30),
              Expanded(
                child: Text(
                  "Reviews",
                  style: TextStyle(
                    fontFamily: AppTheme.fontDisplay,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1.4,
                    color: AppTheme.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 28),
          Row(
            children: [
              SizedBox(width: 30),
              Expanded(
                child: Text(
                  "Currency",
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
                height: 36,
                decoration: BoxDecoration(
                  color: AppTheme.black5,
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                ),
                padding: EdgeInsets.only(
                  left: 14,
                  right: 14,
                ),
                child: Center(
                  child: Text(
                    "\$USD",
                    style: TextStyle(
                      fontFamily: AppTheme.fontText,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 1.43,
                      color: AppTheme.black60,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
