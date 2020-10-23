import 'package:flutter/material.dart';
import 'package:login/Activity/LoginActivity.dart';
import 'package:login/Activity/my_diary_screen.dart';
import 'package:login/Activity/training_screen.dart';
import 'package:login/Hellper/HellperSharePreferenced.dart';
import 'package:login/Hellper/HellperStyle.dart';
import 'package:login/Hellper/HellperBottomBar.dart';
import 'package:login/Model/tabIcon_data.dart';

class HomeActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyHomeActivity();
  }
}

class MyHomeActivity extends State<HomeActivity> with TickerProviderStateMixin {

  AnimationController animationController;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  Widget tabBody = Container(
    color: HellperStyle.background,
  );

  @override
  void initState() {
    _LoginScreen();
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MyDiaryScreen(animationController: animationController);
    super.initState();
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  _LoginScreen() async {
    var isLoggedIn = (HellperSharePreferenced.getBoolValuesSF() ?? '');
    if (isLoggedIn != true) {
      // Navigator.pushReplacement(
          // context, MaterialPageRoute(builder: (context) => LoginActivity()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: HellperStyle.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0 || index == 2) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MyDiaryScreen(animationController: animationController);
                });
              });
            } else if (index == 1 || index == 3) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      TrainingScreen(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}