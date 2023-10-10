import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/core/sharedpreference.dart';
import 'package:islamabad_club_app/model/services/media_service.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_iconbutton.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/utils.dart';

import '../../widgets/app_bar/custom_app_bar.dart';
String notificationId = '';
class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool optButton = false;
  List<dynamic> generalNotificationList = [];
  List<dynamic> optNotificationList = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchInfo();
  }
  Future<void> fetchInfo() async {
    await generalNotification();
    await optNotification();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> optNotification() async {
    try {
      Map<String, dynamic> mapdata = {
        'USR_SN': SharedData.preferences.getString('userSN'),
      };

      MediaService mediaService = MediaService();
      dynamic response = await mediaService.postRequest('otp_notification', mapdata);

      if (response['status'] == 'Success') {
        print(response.toString());
        if(response['data'] == '')
          print("No OTP Notification");
        else
          optNotificationList = response['data'];
        setState(() {
        });
      } else {
        print("Status: ${response['status']}");
        // Handle the case where status is not 'Success'
      }
    } catch (e) {
      print("Error in OTP Notification: $e");
    }
  }

  Future<void> generalNotification() async {
    try {
      MediaService mediaService = MediaService();
      dynamic response = await mediaService.postRequest('general_notification', "");

      if (response['status'] == 'Success') {
        setState(() {
          generalNotificationList = response['data'];
        });
      } else {
        print("Status: ${response['status']}");
      }
    } catch (e) {
      print("Error in General Notification: $e");
    }
  }

  void toggleContentVisibility() {
    setState(() {
      optButton = !optButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    Timer(Duration(seconds: 0), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      SharedData.preferences = prefs;
      if (prefs.getString('userSN') == null && prefs.getString('userName') == null)
        Navigator.pushReplacementNamed(context, AppRoutes.logInScreen);
    });
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / 375; // Base width used for scaling
    double ffem = fem * 0.97;

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        appBar: CustomAppBar(
          height: getVerticalSize(59),
          leadingWidth: 64,
          leading: AppbarIconbutton(
            svgPath: ImageConstant.imgArrowleft,
            margin: getMargin(left: 24, top: 8, bottom: 8),
            onTap: () => onTapArrowLeft(context),
          ),
          centerTitle: true,
          title: AppbarSubtitle(text: "Notification"),
         ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20 * fem, top: 20 * fem),
                  child: NotificationToggleButton(
                    fem: fem,
                    ffem: ffem,
                    optButton: optButton,
                    onTap: toggleContentVisibility,
                  ),
                ),
                Expanded(
                  child: isLoading
                      ? Center(
                    child: CircularProgressIndicator(), // Show indicator while loading
                  )
                      :  Container(
                    child: optButton
                        ? OptNotificationContent(optNotificationList: generalNotificationList)
                        : GeneralNotificationContent(generalNotificationList: optNotificationList),
                  ),
                ),
              ],
            ),
        Positioned(
        bottom: 40,
        right: 10,
        child: Stack(
          children: [
            FloatingActionButton(
              child: Icon(Icons.refresh, color: Colors.white),
              backgroundColor: Colors.transparent,
              onPressed: (){
                setState(() {
                  isLoading = !isLoading;
                });
                fetchInfo();
              },
            ),
          ],
        ),
      ),
          ],
        ),
      ),
    );
  }

  void onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

class NotificationToggleButton extends StatelessWidget {
  final double fem;
  final double ffem;
  final bool optButton;
  final VoidCallback onTap;

  NotificationToggleButton({
    required this.fem,
    required this.ffem,
    required this.optButton,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8 * fem, 9 * fem, 8 * fem, 9 * fem),
      width: 334 * fem,
      height: 50 * fem,
      decoration: BoxDecoration(
        color: Color(0xfff5f4f7),
        borderRadius: BorderRadius.circular(6 * fem),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NotificationTabButton(
            isSelected: !optButton,
            fem: fem,
            ffem: ffem,
            label: 'Transactional',
            onTap: onTap,
          ),
          NotificationTabButton(
            isSelected: optButton,
            fem: fem,
            ffem: ffem,
            label: 'General',
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

class NotificationTabButton extends StatelessWidget {
  final bool isSelected;
  final double fem;
  final double ffem;
  final String label;
  final VoidCallback onTap;

  NotificationTabButton({
    required this.isSelected,
    required this.fem,
    required this.ffem,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 7 * fem, 0 * fem),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Container(
          width: 152 * fem,
          height: double.infinity,
          decoration: BoxDecoration(
            color: isSelected ? Color(0xf4d39000) : Color(0xffffffff),
            borderRadius: BorderRadius.circular(6 * fem),
          ),
          child: Center(
            child: Text(
              label,
              style: SafeGoogleFont(
                'Montserrat',
                fontSize: 10 * ffem,
                fontWeight: FontWeight.w600,
                height: 1.2175 * ffem / fem,
                color: isSelected ? Color(0xffffffff) : Color(0xff000000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OptNotificationContent extends StatelessWidget {
  final List<dynamic> optNotificationList;

  OptNotificationContent({required this.optNotificationList});

  @override
  Widget build(BuildContext context) {
    return optNotificationList.isEmpty
        ? Text("No Notification Yet",textAlign: TextAlign.center)
        :  Column(
        children: optNotificationList.map((notification) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              notificationId = notification['NOTG_SN'];
              Navigator.pushNamed(context, AppRoutes.notificationDetailsScreen);
            },
            child: Container(
              height: 120, // Adjust the height as needed
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!, // Adjust the color as needed
                  width: 1.5, // Adjust the width as needed
                ),
                borderRadius: BorderRadius.circular(6),
                color: Color(0xfff5f4f7),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0), // Add desired padding
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  tileColor: Colors.transparent, // Use transparent tile color
                  leading: Container(
                    width: 65,
                    height: 70,
                    child: ClipRRect(
                      child: CustomImageView(
                        imagePath: notification['NOTG_TITLE_IMAGE']!="" ? notification['NOTG_TITLE_IMAGE']:ImageConstant.imgIclogonew1791x800,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(notification['NOTG_TITLE'] ?? "Title not available"),
                  subtitle: Text(notification['NOTG_SHORT_TEXT'] ?? "Subtitle not available"),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class GeneralNotificationContent extends StatelessWidget {
  final List<dynamic> generalNotificationList;

  GeneralNotificationContent({required this.generalNotificationList});

  @override
  Widget build(BuildContext context) {

    return generalNotificationList.isEmpty
        ? Text("No Notification Yet",textAlign: TextAlign.center)
        :  SingleChildScrollView(
          child: Column(
      children: generalNotificationList.map((notification) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3, // Adjust the elevation as needed
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(

                          child: FittedBox(
                            child: Text(
                              notification['NOT_TEXT'] ?? "Title not available",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          notification['NOT_CREATED_AT'] ?? "Date not available",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.notification_important, color: Colors.orange),
                  ],
                ),
              ),
            ),
          );
      }).toList(),
    ),
        );
  }
}
