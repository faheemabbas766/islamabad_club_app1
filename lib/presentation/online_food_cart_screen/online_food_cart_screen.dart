import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import 'package:islamabad_club_app/widgets/custom_elevated_button.dart';
import 'package:islamabad_club_app/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';

import '../../model/providers/shopping_cart_provider.dart';

import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
class OnlineFoodOneScreen extends StatelessWidget {
  OnlineFoodOneScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    
    notificationShow(context);
    onTapArrowleft(BuildContext context) {
        Navigator.pop(context);
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
                title: AppbarSubtitle(text: "Online Foods"),
                actions: [
                  AppbarStack1(
                      margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
                ]),
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 23, right: 23),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(top: 37),
                          child: Text("Added Items",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.headlineSmall!.copyWith(
                                  letterSpacing: getHorizontalSize(0.5)))),
                      Expanded(
                        flex: 10,
                          child: Padding(
                              padding: getPadding(top: 10),
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        height: getVerticalSize(50));
                                  },
                                  itemCount: context.watch<ShoppingCartProvider>().cart.items.length,
                                  itemBuilder: (context, index) {
                                    CartItem item = context.watch<ShoppingCartProvider>().cart.items[index];
                                    return Container(
                                      padding: getPadding(
                                        left: 10,
                                        top: 10,
                                        right: 10,
                                        bottom: 10,
                                      ),
                                      decoration: AppDecoration.outline13.copyWith(
                                        borderRadius: BorderRadiusStyle.roundedBorder8,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CustomImageView(
                                            url: item.imgPath,
                                            imagePath: ImageConstant.imgFoodimage,
                                            height: getSize(
                                              74,
                                            ),
                                            width: getSize(
                                              74,
                                            ),
                                            radius: BorderRadius.circular(
                                              getHorizontalSize(
                                                4,
                                              ),
                                            ),
                                            margin: getMargin(
                                              top: 3,
                                            ),
                                          ),
                                          Padding(
                                            padding: getPadding(
                                              left: 14,
                                              top: 16,
                                              bottom: 15,
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.name,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: CustomTextStyles.titleMediumRedHatDisplayBlack900,
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                    top: 4,
                                                  ),
                                                  child: Text(
                                                    item.price.toString(),
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: CustomTextStyles.titleSmallRedHatDisplayGray50001
                                                        .copyWith(
                                                      letterSpacing: getHorizontalSize(
                                                        0.29,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: getPadding(
                                              top: 1,
                                              right: 1,
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                CustomImageView(
                                                  svgPath: ImageConstant.imgVolumePrimary,
                                                  height: getSize(
                                                    22,
                                                  ),
                                                  width: getSize(
                                                    22,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                    top: 7,
                                                  ),
                                                  child: Text(
                                                    item.quantity.toString(),
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: CustomTextStyles.labelLargeRedHatDisplayBlack900
                                                        .copyWith(
                                                      letterSpacing: getHorizontalSize(
                                                        0.26,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                CustomIconButton(
                                                  height: 22,
                                                  width: 22,
                                                  margin: getMargin(
                                                    top: 7,
                                                  ),
                                                  padding: getPadding(
                                                    all: 7,
                                                  ),
                                                  decoration: IconButtonStyleHelper.fillPrimary,
                                                  child: CustomImageView(
                                                    svgPath: ImageConstant.imgPlusOnprimarycontainer,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }))),
                      Spacer(),
                      CustomElevatedButton(
                        onTap: (){
                          print("trying to move Review Cart");
                          Navigator.pushNamed(context, AppRoutes.onlineFoodReviewPaymentScreen);
                          print("Done ");
                        },
                          text: "add to cart".toUpperCase(),
                          margin: getMargin(bottom: 55),
                          buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                              fixedSize: MaterialStateProperty.all<Size>(
                                  Size(double.maxFinite, getVerticalSize(60)))),
                          buttonTextStyle:
                              CustomTextStyles.titleSmallOnPrimaryContainer)
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
  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
