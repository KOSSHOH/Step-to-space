import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_figma_one/src/app_theme.dart';
import 'package:rxbus/rxbus.dart';
import 'package:shopping_figma_one/src/model/event_bus/event_botton_view_model.dart';
import 'package:shopping_figma_one/src/utils/utils.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool error = false;
  bool next = false;

  var _duration = Duration(
    milliseconds: 270,
  );

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _SignInScreenState() {
    nameController.addListener(() {
      if (nameController.text.length > 0 &&
          passwordController.text.length > 0) {
        setState(() {
          next = true;
        });
      } else {
        setState(() {
          next = false;
        });
      }
    });
    passwordController.addListener(() {
      if (nameController.text.length > 0 &&
          passwordController.text.length > 0) {
        setState(() {
          next = true;
        });
      } else {
        setState(() {
          next = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Form(
        key: _formKey,
        child: Container(
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
              Expanded(
                child: ListView(
                  children: [
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
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
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
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter password';
                        } else if (error) {
                          return 'Incorrect password';
                        }
                        return null;
                      },
                      autofocus: false,
                      obscureText: true,
                      controller: passwordController,
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
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      if (next) {
                        Utils.isLoginCheck(
                          nameController.text,
                          passwordController.text,
                        ).then((value) => {
                              if (value)
                                {
                                  RxBus.post(
                                    EventBottomViewModel(index: 2),
                                    tag: "EVENT_BOTTOM_VIEW",
                                  ),
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst),
                                }
                              else
                                {
                                  error = true,
                                  _formKey.currentState.validate(),
                                }
                            });
                      } else {
                        _formKey.currentState.validate();
                      }
                    },
                    child: AnimatedContainer(
                      duration: _duration,
                      curve: Curves.easeInOut,
                      padding: EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                        left: next ? 30 : 60,
                        right: next ? 30 : 60,
                      ),
                      height: 56,
                      decoration: BoxDecoration(
                        color: next ? AppTheme.blue : AppTheme.white,
                        borderRadius: BorderRadius.circular(60.0),
                        boxShadow: next
                            ? []
                            : [
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign In",
                            style: TextStyle(
                              fontFamily: AppTheme.fontText,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              height: 1.5,
                              color: next ? AppTheme.white : AppTheme.black30,
                            ),
                          ),
                          AnimatedContainer(
                            curve: Curves.easeInOut,
                            duration: _duration,
                            width: next ? 12.0 : 0.0,
                          ),
                          AnimatedContainer(
                            curve: Curves.easeInOut,
                            duration: _duration,
                            width: next ? 24.0 : 0.0,
                            child: SvgPicture.asset(
                              "assets/images/chevronRightWhite.svg",
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
      ),
    );
  }
}
