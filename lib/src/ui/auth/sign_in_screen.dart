import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'file:///C:/Users/SHAHBOZ/AndroidStudioProjects/shopping_figma_one/lib/src/ui/bottom_view/home/popular_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Container(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
          top: 74,
          bottom: 54,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 44,
                width: 44,
                padding: EdgeInsets.all(
                  10,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.black5,
                  borderRadius: BorderRadius.circular(
                    44,
                  ),
                ),
                child: SvgPicture.asset(
                  "assets/images/close.svg",
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Welcome",
              style: TextStyle(
                fontFamily: AppTheme.fontDisplay,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                height: 1.14,
                color: AppTheme.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Sign up with Social of fill the form to continue.",
              style: TextStyle(
                fontFamily: AppTheme.fontText,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                fontSize: 12,
                height: 1.33,
                color: AppTheme.black60,
              ),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Container(
                  height: 56,
                  width: 56,
                  margin: EdgeInsets.only(
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(
                      56.0,
                    ),
                    border: Border.all(
                      color: AppTheme.black10,
                      width: 0.5,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/logoTwitter.svg",
                    ),
                  ),
                ),
                Container(
                  height: 56,
                  width: 56,
                  margin: EdgeInsets.only(
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(
                      56.0,
                    ),
                    border: Border.all(
                      color: AppTheme.black10,
                      width: 0.5,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/logoFacebook.svg",
                    ),
                  ),
                ),
                Container(
                  height: 56,
                  width: 56,
                  margin: EdgeInsets.only(
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(
                      56.0,
                    ),
                    border: Border.all(
                      color: AppTheme.black10,
                      width: 0.5,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/logoApple.svg",
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: AppTheme.black30,
              height: 0.5,
              margin: EdgeInsets.only(
                top: 20,
                bottom: 28,
              ),
            ),
            TextField(
              style: TextStyle(
                fontFamily: AppTheme.fontText,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                height: 1.5,
                color: AppTheme.black,
              ),
              decoration: InputDecoration(
                hintText: "Name",
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
                prefixIcon: Container(
                  padding: EdgeInsets.only(
                    right: 16,
                    bottom: 16,
                    top: 16,
                  ),
                  child: SvgPicture.asset(
                    "assets/images/user.svg",
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              style: TextStyle(
                fontFamily: AppTheme.fontText,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                height: 1.5,
                color: AppTheme.black,
              ),
              decoration: InputDecoration(
                hintText: "Password",
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
                prefixIcon: Container(
                  padding: EdgeInsets.only(
                    right: 16,
                    bottom: 16,
                    top: 16,
                  ),
                  child: SvgPicture.asset(
                    "assets/images/password.svg",
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Container(),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  check = !check;
                });
              },
              child: Row(
                children: [
                  check
                      ? SvgPicture.asset(
                    "assets/images/checkOn.svg",
                  )
                      : SvgPicture.asset(
                    "assets/images/checkOff.svg",
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: "Remember me next time",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              height: 1.33,
                              fontFamily: AppTheme.fontText,
                              color: AppTheme.black60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Container()),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PopularScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 16,
                      bottom: 16,
                      left: 30,
                      right: 30,
                    ),
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppTheme.blue,
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    child: Row(
                      children: [
                        Text(
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
                        SizedBox(width: 12),
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
          ],
        ),
      ),
    );
  }
}
