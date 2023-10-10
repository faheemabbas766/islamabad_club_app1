import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import 'package:islamabad_club_app/widgets/custom_elevated_button.dart';


import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class OnlineCinemaBookingDetailsScreen extends StatelessWidget {
  OnlineCinemaBookingDetailsScreen();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    
    notificationShow(context);
    onTapArrowleft(BuildContext context) {
      Navigator.pop(context);
    }
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
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
          title: AppbarSubtitle(text: "Online Movie Details"),
          actions: [
            AppbarStack1(
                margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
          ]),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getVerticalSize(
                  512,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: 0.9,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgImage506x375,
                        height: getVerticalSize(
                          1111,
                        ),
                        width: getHorizontalSize(
                          600,
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: getPadding(
                          left: 62,
                          top: 5,
                          right: 62,
                          bottom: 5,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgBg287x205,
                              height: getVerticalSize(
                                287,
                              ),
                              width: getHorizontalSize(
                                205,
                              ),
                              radius: BorderRadius.circular(
                                getHorizontalSize(
                                  12,
                                ),
                              ),
                              margin: getMargin(
                                top: 57,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 24,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgCalendarGray500,
                                    height: getSize(
                                      16,
                                    ),
                                    width: getSize(
                                      16,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 4,
                                      top: 1,
                                    ),
                                    child: Text(
                                      "2021",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.labelLargeGray500
                                          .copyWith(
                                        letterSpacing: getHorizontalSize(
                                          0.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 12,
                                    ),
                                    child: SizedBox(
                                      height: getVerticalSize(
                                        16,
                                      ),
                                      child: VerticalDivider(
                                        width: getHorizontalSize(
                                          1,
                                        ),
                                        thickness: getVerticalSize(
                                          1,
                                        ),
                                        color: appTheme.gray60001,
                                      ),
                                    ),
                                  ),
                                  CustomImageView(
                                    svgPath: ImageConstant.imgClock,
                                    height: getSize(
                                      16,
                                    ),
                                    width: getSize(
                                      16,
                                    ),
                                    margin: getMargin(
                                      left: 11,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 4,
                                      bottom: 1,
                                    ),
                                    child: Text(
                                      "148 Minutes",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.labelLargeGray500
                                          .copyWith(
                                        letterSpacing: getHorizontalSize(
                                          0.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 12,
                                    ),
                                    child: SizedBox(
                                      height: getVerticalSize(
                                        16,
                                      ),
                                      child: VerticalDivider(
                                        width: getHorizontalSize(
                                          1,
                                        ),
                                        thickness: getVerticalSize(
                                          1,
                                        ),
                                        color: appTheme.gray60001,
                                      ),
                                    ),
                                  ),
                                  CustomImageView(
                                    svgPath: ImageConstant.imgFilm,
                                    height: getSize(
                                      16,
                                    ),
                                    width: getSize(
                                      16,
                                    ),
                                    margin: getMargin(
                                      left: 11,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 3,
                                      top: 1,
                                    ),
                                    child: Text(
                                      "Action",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.labelLargeGray500
                                          .copyWith(
                                        letterSpacing: getHorizontalSize(
                                          0.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomElevatedButton(
                              text: "Buy Tickets",
                              margin: getMargin(
                                top: 24,
                              ),
                              leftIcon: Container(
                                margin: getMargin(
                                  right: 4,
                                ),
                                child: CustomImageView(
                                  svgPath: ImageConstant
                                      .imgCalendarOnprimarycontainer,
                                ),
                              ),
                              buttonStyle: CustomButtonStyles.fillAmber600TL24
                                  .copyWith(
                                      fixedSize:
                                          MaterialStateProperty.all<Size>(Size(
                                getHorizontalSize(
                                  161,
                                ),
                                getVerticalSize(
                                  48,
                                ),
                              ))),
                              buttonTextStyle: CustomTextStyles
                                  .titleMediumOnPrimaryContainerMedium_1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 24,
                  top: 20,
                ),
                child: Text(
                  "Story Line",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style:
                      CustomTextStyles.titleLargeRedHatDisplay.copyWith(
                    letterSpacing: getHorizontalSize(
                      0.12,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: getHorizontalSize(
                    324,
                  ),
                  margin: getMargin(
                    left: 24,
                    top: 6,
                    right: 26,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "For the first time in the cinematic history of Spider-Man, our friendly neighborhood hero's identity is revealed, bringing his Super Hero responsibilities into conflict with his normal life and putting those he cares about most at risk. ",
                          style:
                              CustomTextStyles.bodyMediumBlack90002_1.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Navigator.pushNamed(
                navigatorKey.currentContext!, getCurrentRoute(type));
          },
        ),
      );
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
}
