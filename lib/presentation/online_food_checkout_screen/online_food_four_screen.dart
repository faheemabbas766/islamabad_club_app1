import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/model/providers/shopping_cart_provider.dart';
import 'package:islamabad_club_app/model/services/media_service.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import 'package:islamabad_club_app/widgets/custom_checkbox_button.dart';
import 'package:islamabad_club_app/widgets/custom_elevated_button.dart';
import 'package:islamabad_club_app/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';
import '../../core/sharedpreference.dart';
import '../../model/profile_model.dart';

import 'package:fluttertoast/fluttertoast.dart' as ft;
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
class OnlineFoodFourScreen extends StatefulWidget {
  OnlineFoodFourScreen({Key? key}) : super(key: key);

  @override
  _OnlineFoodFourScreenState createState() => _OnlineFoodFourScreenState();
}

class _OnlineFoodFourScreenState extends State<OnlineFoodFourScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
    getArea();
  }
  Future<void> getArea() async {
    try{
      MediaService mediaService = MediaService();
      dynamic response = await mediaService.postRequest('food_area', "");
      if (response['status'] == 'Success') {
        areas = List<Map<String, dynamic>>.from(response['data']);
        setState(() {
        });
        print("abc");
      }
    } catch (e) {
      print("ERROR:"+e.toString());
    }
  }
  Future<void> fetchData() async {
    try{
      MediaService mediaService = MediaService();
      Map<String, dynamic> requestBody = {
        'USR_SN': SharedData.preferences.getString('userSN'),
      };
      dynamic response = await mediaService.postRequest('personalinfo', requestBody);
      print("Response Map: $response");  // Print the entire response map
      print("Status: ${response['status']}"); // Print the 'status' field from the response map
      if (response['status'] == 'Success') {
        Profile profile = Profile.fromJson(response);
        nameController.text = profile.data!.meminfo!.mEMBERNAME!;
        addressController.text = profile.data!.meminfo!.mAILINGADDRESS!;
        secondaryContactController.text = profile.data!.meminfo!.rESPHONENO!;
        primaryContactController.text = profile.data!.meminfo!.mOBILENO!;
        memberIdController.text = SharedData.preferences.getString('userSN')!;
        setState(() {

        });
        print("abc");
      }
    } catch (e) {
      print("ERROR:"+e.toString());
    }
  }
  Future<void> placeOrder() async {
    try{

      List<Map<String, String>> shoppingCartList = shoppingCartProvider.cart.items.map<Map<String, String>>((item) {
        return {
          "FOD_FI_REF": item.id.toString(),
          "FOD_QTY": item.quantity.toString(),
          "FOD_FI_RATE": item.price.toString(),
        };
      }).toList();



      MediaService mediaService = MediaService();
      Map<String, dynamic> requestBody = {
        "FO_TOTALBILL":shoppingCartProvider.calculateTotalPrice().toString(),
        "FO_TOTALTAX":shoppingCartProvider.getGST().toString(),
        "FO_SERVCHRG":shoppingCartProvider.getServiceCharges().toString(),
        "FO_ORDERBY":SharedData.preferences.getString('userSN'),//user login
        "FO_PAYMODE":selectedRadio == "cash" ? 1.toString() : 0.toString(),
        "FO_SERVMODE":shoppingCartProvider.getType() == "Take Away" ? 1.toString() : 0.toString(),// take away or del
        "FO_DELEVCHRG":shoppingCartProvider.getDeliveryCharges().toString(),
        "FO_FA_REF":areas.firstWhere((area) => area['FA_AREA'] == selectedArea)['FA_SN'].toString(), // area id
        "FO_ADDRESS":addressController.text,
        "FO_CONTACTNO":secondaryContactController.text,
        "SHOPPING_CART": shoppingCartList
      };
      dynamic response = await mediaService.postRequest('placeorder', requestBody);
      print("Response Map: $response");  // Print the entire response map
      print("Status: ${response['status']}"); // Print the 'status' field from the response map
      if (response['status'] == 'Success') {
        setState(() {
        });
        print("abc");
      }
    } catch (e) {
      print("ERROR:"+e.toString());
    }
  }
  void showPlaceOrderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: AlertDialog(
            title: Text('Place Order Successfully'),
            content: Text('Your order has been placed successfully.'),
            actions: [
              Center(
                child: Icon(
                  Icons.done,
                  color: Colors.green,
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(AppRoutes.onlineFoodScreen);
                  },
                  child: Text('Close'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController memberIdController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController primaryContactController = TextEditingController();
  TextEditingController secondaryContactController = TextEditingController();
  String selectedRadio = "cash";
  String selectedArea = "E7";
  List<Map<String, dynamic>> areas = [];
  bool isCheckbox = false;
  var shoppingCartProvider;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    notificationShow(context);
    shoppingCartProvider = Provider.of<ShoppingCartProvider>(context, listen: false);
    
    return SafeArea(
        child: Scaffold(
            backgroundColor:
            theme.colorScheme.onPrimaryContainer.withOpacity(1),
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(59),
                leadingWidth: 64,
                leading: AppbarIconbutton(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 8, bottom: 8),
                    onTap: () {
                      while(Navigator.canPop(context))
                        Navigator.pop(context);
                      Navigator.pushNamed(context, AppRoutes.onlineFoodReviewPaymentScreen);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "Checkout"),
                actions: [
                  AppbarStack1(
                      margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
                ]),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(left: 24, right: 24),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(top: 35),
                                  child: Text("Service Type :\t\t\t\t\t"
                                      "${Provider.of<ShoppingCartProvider>(context, listen: false).getType()}",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .titleMediumBlack90002Medium
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.32)))),
                              Padding(
                                  padding: getPadding(top: 31),
                                  child: Text("Order Deliver Address",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .titleMediumBlack90002Medium
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.32)))),
                              Padding(
                                  padding: getPadding(top: 18),
                                  child: Text("Name",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .titleSmallBluegray400
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.28)))),
                              CustomTextFormField(
                                  controller: nameController,
                                  enabled: false,
                                  margin: getMargin(top: 8),
                                  textInputAction: TextInputAction.next,
                                  defaultBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400,
                                  enabledBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400,
                                  focusedBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400,
                                  disabledBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400),
                              Padding(
                                  padding: getPadding(top: 19),
                                  child: Text("Membership No.",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .titleSmallBluegray400
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.28)))),
                              CustomTextFormField(
                                  controller: memberIdController,
                                  enabled: false,
                                  margin: getMargin(top: 7),
                                  textInputAction: TextInputAction.next,
                                  defaultBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400,
                                  enabledBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400,
                                  focusedBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400,
                                  disabledBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400),
                              Padding(
                                  padding: getPadding(top: 19),
                                  child: Text("Delivery Area",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .titleSmallBluegray400
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.28)))),

                              DropdownButton(
                                value: selectedArea,
                                items: [
                                  for (var area in areas)
                                    DropdownMenuItem(
                                      child: Text(area['FA_AREA']!),
                                      value: area['FA_AREA'],
                                    )
                                ],
                                onChanged: (value) {
                                  selectedArea = value.toString();
                                  setState(() {

                                  });
                                },
                              ),

                              Padding(
                                  padding: getPadding(top: 17),
                                  child: Text("Address",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .titleSmallBluegray400
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.28)))),
                              CustomTextFormField(
                                  controller: addressController,
                                  margin: getMargin(top: 9),
                                  textInputAction: TextInputAction.next,
                                  defaultBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400,
                                  enabledBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400,
                                  focusedBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400,
                                  disabledBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400),
                              Padding(
                                  padding: getPadding(top: 19),
                                  child: Text("Primary Contact",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .titleSmallBluegray400
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.28)))),
                              CustomTextFormField(
                                  controller: primaryContactController,
                                  enabled: false,
                                  margin: getMargin(top: 7),
                                  defaultBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400,
                                  enabledBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400,
                                  focusedBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400,
                                  disabledBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400),
                              Padding(
                                  padding: getPadding(top: 18),
                                  child: Text("Secondary Contact (can be Edit)",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles
                                          .titleSmallBluegray400
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.28)))),
                              CustomTextFormField(
                                  controller: secondaryContactController,
                                  margin: getMargin(top: 7),
                                  defaultBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400,
                                  enabledBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400,
                                  focusedBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400,
                                  disabledBorderDecoration:
                                  TextFormFieldStyleHelper
                                      .outlineBluegray400),
                              Padding(
                                  padding: getPadding(top: 10),
                                  child: Row(children: [
                                    Row(
                                      children: [
                                        Radio(
                                          value: "cash",
                                          groupValue: selectedRadio,
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedRadio = newValue.toString();
                                            });
                                          },
                                        ),
                                        Text('Cash'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: "Charge to Card",
                                          groupValue: selectedRadio,
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedRadio = newValue.toString();
                                            });
                                          },
                                        ),
                                        Text('Charge to Card'),
                                      ],
                                    ),
                                  ])),
                              Padding(
                                  padding: getPadding(top: 22),
                                  child: Text("Terms & Conditions",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles
                                          .titleMediumBlack90002Medium
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.32)))),
                              Container(
                                  width: getHorizontalSize(306),
                                  margin: getMargin(top: 10, right: 21),
                                  child: Text(
                                      "Premliminary this service in only for selected \n     areas",
                                      maxLines: null,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .labelLargeBluegray400
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.24)))),
                              Padding(
                                  padding: getPadding(top: 10),
                                  child: Text(
                                      "Order serving time will be 11 AM to 10 PM",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .labelLargeBluegray400
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.24)))),
                              Padding(
                                  padding: getPadding(top: 10),
                                  child: Text(
                                      "15% GST will be applicable on all items",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .labelLargeBluegray400
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.24)))),
                              Container(
                                  width: getHorizontalSize(314),
                                  margin: getMargin(top: 10, right: 13),
                                  child: Text(
                                      "Incase of home delivery, charges Rs. 500 wil be\n     applicable.",
                                      maxLines: null,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles
                                          .labelLargeBluegray400
                                          .copyWith(
                                          letterSpacing:
                                          getHorizontalSize(0.24)))),
                              CustomCheckboxButton(
                                  text: "  I agree to above terms and conditions",
                                  iconSize: getHorizontalSize(12),
                                  value: isCheckbox,
                                  margin:
                                  getMargin(left: 3, top: 20, right: 63),
                                  textStyle:
                                  CustomTextStyles.labelLargeBluegray400,
                                  onChange: (value) {
                                    isCheckbox = value;
                                    setState(() {

                                    });
                                  }),
                              CustomElevatedButton(
                                  onTap: (){
                                    if(isCheckbox){
                                      placeOrder();
                                      Provider.of<ShoppingCartProvider>(context, listen: false).cart.items = [];
                                      showPlaceOrderDialog(context);
                                    }else{
                                      ft.Fluttertoast.showToast(
                                          msg: "Please Agree to above terms and conditions",
                                    toastLength: ft.Toast.LENGTH_SHORT);
                                    }
                                  },
                                  text: "Place order".toUpperCase(),
                                  margin: getMargin(top: 49),
                                  buttonStyle: CustomButtonStyles.fillPrimary
                                      .copyWith(
                                      fixedSize:
                                      MaterialStateProperty.all<Size>(
                                          Size(double.maxFinite,
                                              getVerticalSize(60)))),
                                  buttonTextStyle: CustomTextStyles
                                      .titleSmallOnPrimaryContainer)
                            ])))),
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
  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
