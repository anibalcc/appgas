import 'package:appgas/src/appTheme.dart';
import 'package:appgas/src/customDrawer/drawerUserController.dart';
import 'package:appgas/src/customDrawer/homeDrawer.dart';
import 'package:appgas/src/pages/login.dart';
import 'package:appgas/src/pages/main_page.dart';
import 'package:appgas/src/pages/misdatos.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = MainPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            animationController: (AnimationController animationController) {
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexData) {
              changeIndex(drawerIndexData);
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexData) {
    if (drawerIndex != drawerIndexData) {
      drawerIndex = drawerIndexData;

      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = MainPage();
          });
          break;
        case DrawerIndex.Datos:
          setState(() {
            screenView = MisDatos();
          });
          break;
        default:
          setState(() {
            screenView = Login();
          });
      }

      // if (drawerIndex == DrawerIndex.HOME) {
      //   setState(() {
      //     screenView = Login();
      //   });
      // } else if (drawerIndex == DrawerIndex.Help) {
      //   setState(() {
      //     screenView = MainPage();
      //   });
      // } else if (drawerIndex == DrawerIndex.FeedBack) {
      //   setState(() {
      //     screenView = MainPage();
      //   });
      // } else if (drawerIndex == DrawerIndex.Invite) {
      //   setState(() {
      //     screenView = MainPage();
      //   });
      // } else {
      //   //do in your way......
      // }
    }
  }
}
