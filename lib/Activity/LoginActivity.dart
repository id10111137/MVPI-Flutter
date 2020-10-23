import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/Activity/HomeActivity.dart';
import 'package:login/Hellper/CustomAnimation.dart';
import 'package:login/Hellper/HellperSharePreferenced.dart';
import 'package:login/Interactor/LoginInteractor.dart';
import 'package:login/Model/LoginModels.dart';
import 'package:login/Model/LoginRequest.dart';
import 'package:login/View/LoginView.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginScreenState();
  }
}


void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..customAnimation = CustomAnimation();
}

class LoginScreenState extends State<LoginActivity> implements LoginView {
  Timer _timer;
  BuildContext contexts;
  LoginInteractor loginInteractor;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goLogin(String username, String password) {
    LoginRequest loginRequest = LoginRequest();
    loginRequest.setEmail(username);
    loginRequest.setPassword(password);
    loginInteractor.doPostLogin(loginRequest);
  }

  @override
  void initState() {
    super.initState();
    __LoginScreen();
    loginInteractor = LoginInteractor(this);
  }

  __LoginScreen() async {
    var isLoggedIn = (HellperSharePreferenced.getBoolValuesSF() ?? '');
    print(HellperSharePreferenced.getBoolValuesSF());
    if (isLoggedIn == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeActivity()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 140.0, 0.0, 0.0),
                    child: Text('Hello',
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('DariWarung.Com',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () => goLogin(emailController.text.trim(),
                              passwordController.text.trim()),
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child:
                                  ImageIcon(AssetImage('assets/facebook.png')),
                            ),
                            SizedBox(width: 10.0),
                            Center(
                              child: Text('Log in with facebook',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New to Spotify ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ));
  }

  @override
  void doFailled(String message) {
    HellperSharePreferenced.OnBasicAlertPressed(context, "Failed", message);
  }

  @override
  void doHome() {
    // TODO: implement doHome
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeActivity()));
  }

  @override
  void doStartLoading() {
    // TODO: implement doStartLoading
    EasyLoading.show(status: 'loading...');
  }

  @override
  void doStopLoading() {
    // TODO: implement doStopLoading
    _timer.cancel();
  }

  @override
  void doSuccses(LoginModels loginModels) {
    HellperSharePreferenced.addStringToSF(loginModels);
  }
}
