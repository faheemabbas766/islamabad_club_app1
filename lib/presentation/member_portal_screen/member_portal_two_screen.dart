import 'package:flutter/foundation.dart';
import 'package:islamabad_club_app/presentation/feedback_management_one_screen/feedback_management_one_screen.dart';
import 'package:islamabad_club_app/presentation/member_portal_screen/widgets/member_portal_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_iconbutton.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_stack_1.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:islamabad_club_app/widgets/app_bar/custom_app_bar.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';


class MemberPortalTwoScreen extends StatelessWidget {
  MemberPortalTwoScreen({Key? key}) : super(key: key);

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
                      onTapArrowleft(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "Member Portal"),
                actions: [
                  AppbarStack1(
                      margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
                ]),
            body: Padding(
                padding: getPadding(left: 24, top: 29, right: 24),
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(27));
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return MemberPortalItemWidget(context,index);
                    })),
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
        return AppRoutes.homeScreenContainerScreen;
      case BottomBarEnum.ProfilePage:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeScreenContainerScreen:
        return HomeScreenPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft(BuildContext context) {
    while (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    Navigator.pushNamed(context, AppRoutes.homeScreenContainerScreen);
  }
}
