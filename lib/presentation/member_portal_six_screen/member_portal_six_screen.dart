import 'package:fluttertoast/fluttertoast.dart' as ft;
import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/model/family_model.dart';
import 'package:islamabad_club_app/model/services/media_service.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/presentation/notification_details_screen/notification_details_screen.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_iconbutton.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_stack_1.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:islamabad_club_app/widgets/app_bar/custom_app_bar.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import '../../core/sharedpreference.dart';

class MemberPortalSixScreen extends StatefulWidget {
  @override
  _MemberPortalSixScreenState createState() => _MemberPortalSixScreenState();
}

class _MemberPortalSixScreenState extends State<MemberPortalSixScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  MediaService mediaService = MediaService();
  Family info = Family();

  @override
  void initState() {
    super.initState();
    initializeInfo();
  }

  Future<void> initializeInfo() async {
    info = await fetchData();
    setState(() {});
  }

  Future<Family> fetchData() async {
    try {
      Map<String, dynamic> requestBody = {
        'USR_SN': SharedData.preferences.getString('userSN')!
      };
      dynamic response =
      await mediaService.postRequest('familyinfo', requestBody);
      if (response['data'] == null) {
        ft.Fluttertoast.showToast(
            msg: response['message'], toastLength: ft.Toast.LENGTH_LONG);
        return Family();
      } else {
        return Family.fromJson(response);
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
          msg: "Check Your Internet Connection!",
          toastLength: ft.Toast.LENGTH_LONG);
      return Family();
    }
  }

  @override
  Widget build(BuildContext context) {
    notificationShow(context);
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
              onTapArrowleft2(context);
            },
          ),
          centerTitle: true,
          title: AppbarSubtitle(text: "Family Info"),
          actions: [
            AppbarStack1(
              margin: getMargin(left: 24, top: 8, right: 24, bottom: 8),
            ),
          ],
        ),
        body: info.data?.familyInfo?.isEmpty ?? true
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            children: List.generate(
              info.data?.familyInfo?.length ?? 0,
                  (index) {
                final familyItem = info.data?.familyInfo?[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: CircleAvatar(
                      backgroundColor: appTheme.amber600,
                      child: Text(
                        familyItem?.rELATIONSHIP?.substring(0, 1) ?? '',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      familyItem?.nAME ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          familyItem?.rELATIONSHIP ?? '',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    trailing: Text(
                      'DOB: ${familyItem?.dATEOFBIRTH ?? ""}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(onChanged: (BottomBarEnum type) {
          Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
        }),
      ),
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreenPage;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeScreenPage:
        return HomeScreenPage();
      default:
        return DefaultWidget();
    }
  }

  onTapArrowleft2(BuildContext context) {
    Navigator.pop(context);
  }
}
