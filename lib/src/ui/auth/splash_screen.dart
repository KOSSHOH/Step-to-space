import 'package:flutter/material.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:shopping_figma_one/src/ui/auth/sign_in_screen.dart';
import 'package:shopping_figma_one/src/ui/auth/sign_up_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(205, 18, 31, 1),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash_image.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 32,
              left: 30,
              right: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 32,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 44,
                      width: 44,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppTheme.black5,
                        borderRadius: BorderRadius.circular(
                          44.0,
                        ),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/chevronLeft.svg",
                      ),
                    ),
                  ),
                ),
                Text(
                  "Buy & Sell Authentic",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontFamily: AppTheme.fontDisplay,
                    fontSize: 16,
                    height: 1.1875,
                    color: AppTheme.red,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "X-S-Store",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: AppTheme.fontPoppins,
                    fontSize: 48,
                    height: 0.85,
                    color: AppTheme.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 16,
                  ),
                  width: 195,
                  child: Text(
                    "Real Time Makret Pricing",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontFamily: AppTheme.fontPoppins,
                      fontSize: 24,
                      height: 1.33,
                      color: AppTheme.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.circular(
                        60,
                      ),
                    ),
                    height: 56,
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontFamily: AppTheme.fontText,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.5,
                          color: AppTheme.black,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 64),
                    decoration: BoxDecoration(
                      color: AppTheme.black30,
                      borderRadius: BorderRadius.circular(
                        60,
                      ),
                    ),
                    height: 56,
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontFamily: AppTheme.fontText,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.5,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
