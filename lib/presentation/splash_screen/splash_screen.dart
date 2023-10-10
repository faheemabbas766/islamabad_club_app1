import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/sharedpreference.dart';
import '../home_screen_container_screen/home_screen_container_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen();
  @override
  Widget build(BuildContext context) {
    notificationShow(context);
    Timer(Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      SharedData.preferences = prefs;
      if (prefs.getString('userSN') != null && prefs.getString('userName') != null) {
        //push and remove until
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) {return HomeScreenContainerScreen();}), (Route<dynamic> route) => false);
        // Navigator.pushReplacementNamed(context, AppRoutes.homeScreenContainerScreen);
      }else{
        Navigator.pushReplacementNamed(context, AppRoutes.welcomeScreen);
      }
    });
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Container(
            padding: getPadding(
              left: 65,
              top: 282,
              right: 65,
              bottom: 282,
            ),
            decoration: AppDecoration.fill,
            child: CustomImageView(
            imagePath: ImageConstant.imgIclogonew1791x800,
            fit: BoxFit.fitHeight,
            height: 247.0,
            width: 244.0,
            margin: EdgeInsets.only(bottom: 1.0),
          ),
          ),
        ),
      ),
    );
  }
}