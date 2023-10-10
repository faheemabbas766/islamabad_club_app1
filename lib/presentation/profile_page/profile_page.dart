import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/presentation/welcome_screen/welcome_screen.dart';
import 'package:islamabad_club_app/widgets/app_bar/custom_app_bar.dart';
import 'package:islamabad_club_app/widgets/confirm_box.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/sharedpreference.dart';

import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/custom_bottom_bar.dart';
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    notificationShow(context);
    onTapArrowleft(BuildContext context) {
      while(Navigator.canPop(context)){
      Navigator.pop(context);
    }
    Navigator.pushNamed(context, AppRoutes.homeScreenContainerScreen);
    }
    
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        appBar: CustomAppBar(
            height: getVerticalSize(59),
            leadingWidth: 64,
            leading: AppbarIconbutton(
                svgPath: ImageConstant.imgArrowleft,
                margin: getMargin(left: 24, top: 8, bottom: 8),
                onTap: () {
                  onTapArrowleft(context);
                }),
            centerTitle: true,
            title: AppbarSubtitle(text: "Profile"),
            actions: [
              AppbarStack1(
                  margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
            ]),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 15,
            top: 17,
            right: 15,
            bottom: 17,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                svgPath: ImageConstant.userSvg,
                height: getSize(
                  100,
                ),
                width: getSize(
                  100,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    50,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 12,
                ),
                child: Text(
                  SharedData.preferences.getString('userName')!,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.titleMediumBlack90002,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 28,
                ),
                child: Divider(
                  height: getVerticalSize(
                    1,
                  ),
                  thickness: getVerticalSize(
                    1,
                  ),
                  color: appTheme.black90002.withOpacity(0.1),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 1,
                  top: 28,
                  right: 5,
                  bottom: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, AppRoutes.memberPortalProfileInputScreen);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.edit),
                                    SizedBox(width: 20),
                                    Text(
                                      "Edit Profile",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 25),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, AppRoutes.memberPortalOnlinePaymentMethodScreen);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.payment),
                                    SizedBox(width: 20),
                                    Text(
                                      "Payment",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 28),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, AppRoutes.notificationScreen);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.notifications),
                                    SizedBox(width: 20),
                                    Text(
                                      "Notifications",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 28),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, AppRoutes.cancelTicketsScreen);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.cancel),
                                    SizedBox(width: 20),
                                    Text(
                                      "Cancel Tickets",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 28),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, AppRoutes.changePasswordScreen);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.security),
                                    SizedBox(width: 20),
                                    Text(
                                      "Security",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 25),
                              InkWell(
                                onTap: () async {
                                  if(await showConfirmationDialog(context, "LogOut", "Are you sure want to Logout?")){
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.remove('userSN');
                                    prefs.remove('userName');
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                                          (Route<dynamic> route) => false,
                                    );
                                  }
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.logout),
                                    SizedBox(width: 20),
                                    Text(
                                      "Logout",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 16.0, color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}