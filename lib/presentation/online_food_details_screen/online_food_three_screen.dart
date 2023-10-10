import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/model/services/media_service.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/presentation/online_food_screen/online_food_screen.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import 'package:islamabad_club_app/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';
import '../../model/providers/shopping_cart_provider.dart';

import 'package:fluttertoast/fluttertoast.dart' as ft;

import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class OnlineFoodThreeScreen extends StatefulWidget {
  OnlineFoodThreeScreen({Key? key}) : super(key: key);

  @override
  _OnlineFoodThreeScreenState createState() => _OnlineFoodThreeScreenState();
}

class _OnlineFoodThreeScreenState extends State<OnlineFoodThreeScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  dynamic itemDetails;
  int count = 1;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fatchData();
  }
  Future<void> fatchData() async {
    await loadItem();
    setState(() {
      isLoading = false;
    });
  }
  Future<void> loadItem() async {
    try{
      Map<String, dynamic> requestBody = {
        'FI_SN': itemId,
      };
      MediaService mediaService = MediaService();
      dynamic response = await mediaService.postRequest('single_item_details', requestBody);
      print("Response Map: $response");  // Print the entire response map
      print("Status: ${response['status']}");
      if (response['status'] == 'Success') {
        itemDetails = response['data'];
        setState(() {
        });

      }else{

        ft.Fluttertoast.showToast(
          msg: response['message'],
          toastLength: ft.Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: ft.Toast.LENGTH_SHORT,
      );
    }
  }



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
                title: AppbarSubtitle(text: "Foods Details"),
                actions: [
                  AppbarStack1(
                      margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
                ]),
            resizeToAvoidBottomInset: false,
            body: isLoading
                ? Center(
              child: CircularProgressIndicator(), // Show indicator while loading
            )
                : Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, right: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                            margin: getMargin(top: 9, bottom: 5),
                            child: Stack(alignment: Alignment.center, children: [
                              CustomImageView(
                                  svgPath:
                                      ImageConstant.imgSettingsOnprimarycontainer,
                                  height: getSize(29),
                                  width: getSize(29),
                                  alignment: Alignment.topRight,
                                  margin: getMargin(top: 21, right: 16)),
                              Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: getPadding(top: 9),
                                            child: Text(itemDetails['FI_TITIE']?? "",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: CustomTextStyles
                                                    .titleSmallBlack90001SemiBold)),
                                        Padding(
                                            padding: getPadding(top: 3),
                                            child: Text(itemDetails['FIC_CAT']?? "",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: CustomTextStyles
                                                    .labelLargeGray50001
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.27)))),
                                        CustomImageView(
                                            fit: BoxFit.cover,
                                            url: itemDetails['FIT_IMAGE']??  ImageConstant.food,
                                            height: getSize(201),
                                            width: getSize(201),
                                            radius: BorderRadius.circular(
                                                getHorizontalSize(100)),
                                            margin: getMargin(top: 22)),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding:
                                                    getPadding(left: 1, top: 27),
                                                child: Text("Description",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: CustomTextStyles
                                                        .titleMediumBlack900
                                                        .copyWith(
                                                            letterSpacing:
                                                                getHorizontalSize(
                                                                    0.33))))),
                                        Container(
                                            width: getHorizontalSize(322),
                                            margin: getMargin(top: 15),
                                            child: Text(itemDetails['FI_DESC']?? "",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: CustomTextStyles
                                                    .bodySmallRedHatDisplayGray50001
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.24)))),
                                        Padding(
                                            padding:
                                                getPadding(top: 29, right: 8),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      height: getVerticalSize(39),
                                                      width:
                                                          getHorizontalSize(156),
                                                      child: Stack(
                                                        alignment: Alignment.centerRight,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: Card(
                                                              clipBehavior: Clip.antiAlias,
                                                              elevation: 0,
                                                              margin: EdgeInsets.all(0),
                                                              shape: RoundedRectangleBorder(
                                                                side: BorderSide(color: appTheme.gray300Cc, width: getHorizontalSize(1)),
                                                                borderRadius: BorderRadiusStyle.customBorderTL8,
                                                              ),
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    if (count > 1) {
                                                                      count--;
                                                                    }
                                                                  });
                                                                },
                                                                child: Container(
                                                                  height: getVerticalSize(39),
                                                                  width: getHorizontalSize(42),
                                                                  padding: getPadding(left: 11, top: 9, right: 11, bottom: 9),
                                                                  decoration: AppDecoration.outline12.copyWith(borderRadius: BorderRadiusStyle.customBorderTL8),
                                                                  child: Stack(
                                                                    children: [
                                                                      CustomImageView(
                                                                        svgPath: ImageConstant.imgAkariconsminus,
                                                                        height: getSize(19),
                                                                        width: getSize(19),
                                                                        alignment: Alignment.center,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment.center,
                                                            child: Text(
                                                              count.toString(),
                                                              style: CustomTextStyles.titleMediumRedHatDisplayAmber600,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment.centerRight,
                                                            child: Card(
                                                              clipBehavior: Clip.antiAlias,
                                                              elevation: 0,
                                                              margin: EdgeInsets.all(0),
                                                              shape: RoundedRectangleBorder(
                                                                side: BorderSide(color: appTheme.gray300Cc, width: getHorizontalSize(1)),
                                                                borderRadius: BorderRadiusStyle.customBorderTL8,
                                                              ),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    count++;
                                                                  });
                                                                },
                                                                child: Container(
                                                                  height: getVerticalSize(39),
                                                                  width: getHorizontalSize(42),
                                                                  padding: getPadding(left: 15, top: 14, right: 15, bottom: 14),
                                                                  decoration: AppDecoration.outline12.copyWith(borderRadius: BorderRadiusStyle.customBorderTL8),
                                                                  child: Stack(
                                                                    children: [
                                                                      CustomImageView(
                                                                        svgPath: ImageConstant.imgPlus,
                                                                        height: getSize(11),
                                                                        width: getSize(11),
                                                                        alignment: Alignment.centerLeft,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                  ),
                                                  Padding(
                                                      padding: getPadding(
                                                          top: 2, bottom: 6),
                                                      child: Text(double.parse(itemDetails['FI_RATE'] ?? "0.00").toStringAsFixed(2),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: CustomTextStyles
                                                              .titleLargeRedHatDisplay
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.46))))
                                                ])),
                                        CustomElevatedButton(
                                          onTap: (){
                                            var shoppingCartProvider = Provider.of<ShoppingCartProvider>(context, listen: false);
                                            var newItem = CartItem(itemDetails['FI_SN'], itemDetails['FI_TITIE'], double.parse(itemDetails['FI_RATE']),count,itemDetails['FIT_IMAGE']?? ImageConstant.imageNotFound);
                                            shoppingCartProvider.addItem(newItem);
                                            print("add to cart");
                                            ft.Fluttertoast.showToast(
                                              msg: "Item Added to Cart",
                                              toastLength: ft.Toast.LENGTH_SHORT,
                                            );
                                          },
                                            text: "add to cart".toUpperCase(),
                                            margin: getMargin(top: 27),
                                            buttonStyle: CustomButtonStyles
                                                .fillPrimary
                                                .copyWith(
                                                    fixedSize:
                                                        MaterialStateProperty
                                                            .all<Size>(Size(
                                                                double.maxFinite,
                                                                getVerticalSize(
                                                                    60)))),
                                            buttonTextStyle: CustomTextStyles
                                                .titleSmallOnPrimaryContainer)
                                      ]))
                            ])),
                      )
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
