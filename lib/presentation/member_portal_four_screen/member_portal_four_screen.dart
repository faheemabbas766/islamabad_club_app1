import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_iconbutton.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_stack_1.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:islamabad_club_app/widgets/app_bar/custom_app_bar.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import 'package:islamabad_club_app/widgets/custom_elevated_button.dart';



// ignore_for_file: must_be_immutable
class MemberPortalFourScreen extends StatelessWidget {
  MemberPortalFourScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    notificationShow(context);
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor:
                theme.colorScheme.onPrimaryContainer.withOpacity(1),
            appBar: CustomAppBar(
                height: getVerticalSize(59),
                leadingWidth: 64,
                leading: AppbarIconbutton(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 8, bottom: 8),
                    onTap: () {
                      onTapArrowleft5(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "Room reservation"),
                actions: [
                  AppbarStack1(
                      margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 22, right: 24, bottom: 22),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: getVerticalSize(104),
                          width: getHorizontalSize(327),
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    height: getVerticalSize(20),
                                    width: getHorizontalSize(327),
                                    decoration: BoxDecoration(
                                        color: appTheme.gray5001,
                                        border: Border(
                                            top: BorderSide(
                                                color: appTheme.blueGray10001,
                                                width: getHorizontalSize(1)),
                                            bottom: BorderSide(
                                                color: appTheme.blueGray10001,
                                                width:
                                                    getHorizontalSize(1)))))),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    height: getVerticalSize(20),
                                    width: getHorizontalSize(327),
                                    margin: getMargin(top: 21),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: appTheme.blueGray10001,
                                                width: getHorizontalSize(1)),
                                            bottom: BorderSide(
                                                color: appTheme.blueGray10001,
                                                width:
                                                    getHorizontalSize(1)))))),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    height: getVerticalSize(20),
                                    width: getHorizontalSize(327),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: appTheme.blueGray10001,
                                                width: getHorizontalSize(1)),
                                            bottom: BorderSide(
                                                color: appTheme.blueGray10001,
                                                width:
                                                    getHorizontalSize(1)))))),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    height: getVerticalSize(20),
                                    width: getHorizontalSize(327),
                                    margin: getMargin(bottom: 21),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: appTheme.blueGray10001,
                                                width: getHorizontalSize(1)),
                                            bottom: BorderSide(
                                                color: appTheme.blueGray10001,
                                                width:
                                                    getHorizontalSize(1)))))),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                    height: getVerticalSize(99),
                                    width: getHorizontalSize(327),
                                    child: Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                  height: getVerticalSize(20),
                                                  width: getHorizontalSize(327),
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          top: BorderSide(
                                                              color: appTheme
                                                                  .blueGray10001,
                                                              width:
                                                                  getHorizontalSize(
                                                                      1)),
                                                          bottom: BorderSide(
                                                              color: appTheme
                                                                  .blueGray10001,
                                                              width:
                                                                  getHorizontalSize(
                                                                      1)))))),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                  padding: getPadding(left: 11),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Room Category",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: CustomTextStyles
                                                                .montserratGray900SemiBold
                                                                .copyWith(
                                                                    letterSpacing:
                                                                        getHorizontalSize(
                                                                            0.03))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 13),
                                                            child: Text(
                                                                "Regular Rooms (Single)",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .montserratGray900Medium6)),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 13),
                                                            child: Text(
                                                                "Regular Rooms (Double)",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .montserratGray900Medium6)),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 12),
                                                            child: Text(
                                                                "Suites",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .montserratGray900Medium6)),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 13),
                                                            child: Text(
                                                                "Deluxe Suites",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .montserratGray900Medium6))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                  padding:
                                                      getPadding(right: 121),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Member Charges",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: CustomTextStyles
                                                                .montserratGray900SemiBold
                                                                .copyWith(
                                                                    letterSpacing:
                                                                        getHorizontalSize(
                                                                            0.03))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 13),
                                                            child: Text(
                                                                "10600.00",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .montserratGray900Medium6)),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 13),
                                                            child: Text(
                                                                "12200.00",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .montserratGray900Medium6)),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 13),
                                                            child: Text(
                                                                "18100.00",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .montserratGray900Medium6)),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 13),
                                                            child: Text(
                                                                "27300.00",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .montserratGray900Medium6))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                  padding:
                                                      getPadding(right: 10),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Guest Charges",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: CustomTextStyles
                                                                .montserratGray900SemiBold
                                                                .copyWith(
                                                                    letterSpacing:
                                                                        getHorizontalSize(
                                                                            0.03))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 13),
                                                            child: Text(
                                                                "19200.00",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .montserratGray900Medium6)),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 13),
                                                            child: Text(
                                                                "20900.00",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .montserratGray900Medium6)),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 13),
                                                            child: Text(
                                                                "29100.00",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .montserratGray900Medium6)),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 13),
                                                            child: Text(
                                                                "47300.00",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: CustomTextStyles
                                                                    .montserratGray900Medium6))
                                                      ])))
                                        ])))
                          ])),
                      Spacer(),
                      CustomElevatedButton(
                          text: "New Request",
                          margin: getMargin(bottom: 16),
                          buttonStyle: CustomButtonStyles.fillAmber600.copyWith(
                              fixedSize: MaterialStateProperty.all<Size>(
                                  Size(double.maxFinite, getVerticalSize(60)))),
                          buttonTextStyle:
                              CustomTextStyles.titleMediumOnPrimaryContainer17)
                    ])),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Navigator.pushReplacementNamed(
                  navigatorKey.currentContext!, getCurrentRoute(type));
            })));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreenPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeScreenPage:
        return HomeScreenPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft5(BuildContext context) {
    Navigator.pop(context);
  }
}
