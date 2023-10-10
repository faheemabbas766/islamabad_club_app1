import 'package:fluttertoast/fluttertoast.dart' as ft;
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


class OnlineFoodTwoScreen extends StatefulWidget {
  OnlineFoodTwoScreen({Key? key}) : super(key: key);

  @override
  _OnlineFoodTwoScreenState createState() => _OnlineFoodTwoScreenState();
}

class _OnlineFoodTwoScreenState extends State<OnlineFoodTwoScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    
    notificationShow(context);
    var shoppingProvider = Provider.of<ShoppingCartProvider>(context, listen: false);
    mediaQueryData = MediaQuery.of(context);
    onTapArrowleft(BuildContext context) {
      while(Navigator.canPop(context))
        Navigator.pop(context);
      Navigator.pushNamed(
          context, AppRoutes.onlineFoodScreen);
    }
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
                title: AppbarSubtitle(text: "Online Foods Cart"),
                actions: [
                  AppbarStack1(
                      margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
                ]),
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
                  padding: getPadding(left: 24, right: 24),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: getPadding(top: 10),
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                      height: getVerticalSize(10));
                                },
                                itemCount: context.watch<ShoppingCartProvider>().cart.items.length,
                                itemBuilder: (context, index) {
                                  CartItem item = context.watch<ShoppingCartProvider>().cart.items[index];
                                  return Container(
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
                                            all: 10,
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 190, // Set your desired fixed width
                                                    child: Text(
                                                      item.name,
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1, // Display only one line of text
                                                      textAlign: TextAlign.left,
                                                      style: CustomTextStyles.titleMediumRedHatDisplayBlack900,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      var shoppingCartProvider = Provider.of<ShoppingCartProvider>(context, listen: false);
                                                      var newItem = CartItem(item.id, item.name, item.price, 1, item.imgPath);
                                                      shoppingCartProvider.removeItem(newItem);
                                                      print("Delete to cart");
                                                      print("Tapped Press Delete");
                                                    },
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: getPadding(
                                                      right: 20,
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
                                                  InkWell(
                                                    onTap: () {
                                                      var shoppingCartProvider = Provider.of<ShoppingCartProvider>(context, listen: false);
                                                      var newItem = CartItem(item.id, item.name, item.price, 1, item.imgPath);
                                                      shoppingCartProvider.removeItemCount(newItem);
                                                      print("remove to cart");
                                                      print("Tapped Press -");
                                                    },
                                                    child: CustomImageView(
                                                      svgPath: ImageConstant.imgVolumePrimary,
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(left: 10, right: 10),
                                                    child: Text(
                                                      item.quantity.toString(),
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: CustomTextStyles.labelLargeRedHatDisplayBlack900.copyWith(
                                                        letterSpacing: getHorizontalSize(0.26),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      var shoppingCartProvider = Provider.of<ShoppingCartProvider>(context, listen: false);
                                                      var newItem = CartItem(item.id, item.name, item.price, 1, item.imgPath);
                                                      shoppingCartProvider.addItem(newItem);
                                                      print("add to cart");
                                                      print("Tapped Press +");
                                                    },
                                                    child: CustomIconButton(
                                                      height: 25,
                                                      width: 25,
                                                      decoration: IconButtonStyleHelper.fillPrimary,
                                                      child: CustomImageView(
                                                        svgPath: ImageConstant.imgPlusOnprimarycontainer,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  );
                                }
                            )
                        ),
                        Padding(
                            padding: getPadding(top: 10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Opacity(
                                      opacity: 1.0,
                                      child: Text("Subtotal",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .titleSmallGray50001
                                              .copyWith(
                                              letterSpacing:
                                              getHorizontalSize(0.29)))),
                                  Opacity(
                                      opacity: 1.0,
                                      child: Text('Rs:${shoppingProvider.subTotalPrice().toStringAsFixed(2)}',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .titleSmallGray50001
                                              .copyWith(
                                              letterSpacing:
                                              getHorizontalSize(0.29))))
                                ])),
                        Padding(
                            padding: getPadding(top: 11),
                            child: Divider(
                                height: getVerticalSize(1),
                                thickness: getVerticalSize(1),
                                color: appTheme.gray400)),
                        Padding(
                            padding: getPadding(top: 11),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Opacity(
                                  opacity: 0.7,
                                  child: Padding(
                                    padding: getPadding(top: 1),
                                    child: Text(
                                      Provider.of<ShoppingCartProvider>(context, listen: false).cart.type == "N" ? "Service Charges" : "Delivery Charges",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.titleSmallGray50001.copyWith(
                                        letterSpacing: getHorizontalSize(0.29),
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.7,
                                  child: Padding(
                                    padding: getPadding(bottom: 1),
                                    child: Text(
                                      Provider.of<ShoppingCartProvider>(context, listen: false).cart.type == "N" ? "Rs:${shoppingProvider.getServiceCharges().toStringAsFixed(2)}" : "Rs:${shoppingProvider.getDeliveryCharges().toStringAsFixed(2)}", // Replace this with the actual logic to get the charges or delivery amount
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.titleSmallGray50001.copyWith(
                                        letterSpacing: getHorizontalSize(0.29),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: getPadding(top: 11),
                            child: Divider(
                                height: getVerticalSize(1),
                                thickness: getVerticalSize(1),
                                color: appTheme.gray400)),
                        Padding(
                            padding: getPadding(top: 11),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Opacity(
                                      opacity: 0.7,
                                      child: Padding(
                                          padding: getPadding(top: 1),
                                          child: Text("GST(15%)",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .titleSmallGray50001
                                                  .copyWith(
                                                  letterSpacing:
                                                  getHorizontalSize(
                                                      0.29))))),
                                  Opacity(
                                      opacity: 0.7,
                                      child: Padding(
                                          padding: getPadding(bottom: 1),
                                          child: Text('Rs:${shoppingProvider.getGST().toStringAsFixed(2)}',
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: CustomTextStyles
                                                  .titleSmallGray50001
                                                  .copyWith(
                                                  letterSpacing:
                                                  getHorizontalSize(
                                                      0.29)))))
                                ])),
                        Padding(
                            padding: getPadding(top: 11),
                            child: Divider(
                                height: getVerticalSize(1),
                                thickness: getVerticalSize(1),
                                color: appTheme.gray400)),
                        Padding(
                            padding: getPadding(top: 11),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: getPadding(top: 1),
                                      child: Text("Total",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .titleMediumBlack900Medium
                                              .copyWith(
                                              letterSpacing:
                                              getHorizontalSize(0.33)))),
                                  Padding(
                                      padding: getPadding(bottom: 1),
                                      child: Text('Rs:${shoppingProvider.calculateTotalPrice().toStringAsFixed(2)}',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .titleMediumBlack900Medium
                                              .copyWith(
                                              letterSpacing:
                                              getHorizontalSize(0.33))))
                                ])),
                        CustomElevatedButton(
                            onTap: (){
                              print("trying to move Food Checkout");
                              if(shoppingProvider.calculateTotalPrice() == 0){
                                ft.Fluttertoast.showToast(
                                  msg: "Please Select a Order First",
                                  toastLength: ft.Toast.LENGTH_SHORT,
                                );
                              }else{
                                Navigator.pushReplacementNamed(context, AppRoutes.onlineFoodCheckOutScreen);
                              }
                              print("Done ");
                            },
                            text: "Checkout".toUpperCase(),
                            margin: getMargin(top: 20, bottom: 5),
                            buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                                fixedSize: MaterialStateProperty.all<Size>(
                                    Size(double.maxFinite, getVerticalSize(60)))),
                            buttonTextStyle:
                            CustomTextStyles.titleSmallOnPrimaryContainer),
                      ]
                  )
                ),
            ),
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
  onTapBtnArrowleft(BuildContext context) {
    while(Navigator.canPop(context))
      Navigator.pop(context);
    Navigator.pushNamed(
        context, AppRoutes.onlineFoodReviewPaymentScreen);

  }
}
