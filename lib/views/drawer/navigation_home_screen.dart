import 'package:covid_app/utils/app_theme.dart';
import 'package:covid_app/views/drawer/drawer_user_controller.dart';
import 'package:covid_app/views/drawer/home_drawer.dart';
import 'package:covid_app/views/drawer/privacy_screen.dart';
import 'package:covid_app/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/views/admin/admin_home_screen.dart';

import 'help_screen.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = HomeScreen();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.ADMIN) {
        setState(() {
          screenView = AdminHomeScreen();
        });
      } else if (drawerIndex == DrawerIndex.Legal) {
        setState(() {
          screenView = PrivacyScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        // setState(() {
        //   screenView = InviteFriend();
        // });
      } else {
        //do in your way......
      }
    }
  }
}
