import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/event_details.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_stack_1.dart';
import 'package:islamabad_club_app/widgets/app_bar/custom_app_bar.dart';
import 'package:islamabad_club_app/widgets/custom_elevated_button.dart';
import 'package:fluttertoast/fluttertoast.dart'as ft;
import '../../all_event_screen.dart';
import '../../core/sharedpreference.dart';
import '../../model/services/media_service.dart';
import '../../model/statement_of_account_model.dart';
class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage();

  @override
  State<HomeScreenPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenPage> {
  final TextEditingController locationController = TextEditingController();
  double totalBillDashboard = 0.00;
  bool isLoading = true;
  StatementOfAccountModel info = StatementOfAccountModel();
  dynamic newsList = [];
  @override
  void initState() {
    super.initState();
    initializeInfo();
  }
  Future<void> initializeInfo() async {
    info = await fetchData();
    setState(() async {
      totalBillDashboard = double.parse(info.data![info.data!.length-1].bal!)
          +double.parse(info.data![info.data!.length-1].dr!)
          -double.parse(info.data![info.data!.length-1].cr!);
      await fetchNews();
    });
  }
  Future<StatementOfAccountModel> fetchData() async {
    try {
      Map<String, dynamic> requestBody = {
        'USR_REF': SharedData.preferences.getString('userSN')!
      };
      MediaService mediaService = MediaService();
      dynamic response =
      await mediaService.postRequest('soa', requestBody);
      if (response['data'] == null) {
        ft.Fluttertoast.showToast(
            msg: response['message'], toastLength: ft.Toast.LENGTH_LONG);
        return StatementOfAccountModel();
      } else {
        return StatementOfAccountModel.fromJson(response);
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
          msg: "Check Your Internet Connection!",
          toastLength: ft.Toast.LENGTH_LONG);
      return StatementOfAccountModel();
    }
  }
  Future<void> fetchNews() async {
    try {
      MediaService mediaService = MediaService();
      Map<String, dynamic> requestBody = {
        'USR_SN': SharedData.preferences.getString('userSN'),
      };
      dynamic response = await mediaService.postRequest('newsdata', requestBody);
      if (response['status'] == 'Success') {
        setState(() {
          newsList = response['data'];
          isLoading = false;
        });
      } else {
        print("Status: ${response['status']}");
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
          msg: "Check Your Internet Connection!",
          toastLength: ft.Toast.LENGTH_LONG);
    }
  }
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          height: getVerticalSize(59),
          title: Padding(
            padding: getPadding(left: 100),
            child: Text(
              "ISLAMABAD CLUB",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: CustomTextStyles.titleMediumBlack900Medium,
            ),
          ),
          actions: [
            AppbarStack1(
              margin: getMargin(left: 24, top: 7, right: 24, bottom: 8),
            ),
          ],
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(left: 23, right: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgIclogonew1791x800,
                width: mediaQueryData.size.width * 0.2, // 50% of screen width
                height: mediaQueryData.size.height * 0.1,
              ),
              Container(
                margin: getMargin(left: 1, top: 29, right: 1),
                padding: getPadding(all: 14),
                decoration: AppDecoration.outline1.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: getPadding(top: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: getPadding(bottom: 1),
                            child: Text(
                              "Current Bill",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleSmallGray100,
                            ),
                          ),
                          // Padding(
                          //   padding: getPadding(top: 1),
                          //   child: Text(
                          //     "Due in 5 days",
                          //     overflow: TextOverflow.ellipsis,
                          //     textAlign: TextAlign.left,
                          //     style: CustomTextStyles.titleSmallGray100,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(top: 11),
                      child: Text(
                        "Rs. ${totalBillDashboard.toInt()}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                    CustomElevatedButton(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutes.memberPortalOnlinePaymentScreen);
                      },
                      width: double.maxFinite,
                      height: getVerticalSize(45),
                      text: "Pay Now",
                      margin: getMargin(top: 15),
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle: CustomTextStyles.titleMediumOnPrimaryContainer,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: getPadding(left: 1, top: 29, right: 1),
                  child: GridView.builder(
                    shrinkWrap: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: getVerticalSize(60),
                      crossAxisCount: 2,
                      mainAxisSpacing: getHorizontalSize(13),
                      crossAxisSpacing: getHorizontalSize(13),
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return HomeScreenItemWidget(index);
                    },
                  ),
                ),
              ),
              isLoading? Center(child: CircularProgressIndicator())
                  : InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EventDetailsScreen(
                        eventName: "faheem",
                        eventDetails: "dffafdlafjsd",
                        startDate: "343",
                        endDate: "3e43",
                        imageUrl: "https://media.istockphoto.com/id/1411960046/photo/young-asian-family-of-three-walking-hand-in-hand.jpg?s=2048x2048&w=is&k=20&c=iOGGVwDVtOiU1N-1aVYYxS_leKSlz1Yrjh46ku-a_tE="
                    )),
                  );
                },
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgWelcomescreen,
                      height: getSize(84),
                      width: getSize(84),
                      radius: BorderRadius.circular(getHorizontalSize(4)),
                    ),
                    Padding(
                      padding: getPadding(left: 15, top: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                newsList['data'][0]['NOTG_TITLE'],
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: CustomTextStyles.titleSmallBlack90001SemiBold,
                              ),
                              SizedBox(
                                  width: mediaQueryData.size.width * 0.19),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => AllEventsScreen()),
                                  );
                                },
                                child: Text(
                                  "See all",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFFfcb900),
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            width: getHorizontalSize(182),
                            margin: getMargin(top: 8),
                            child: Text(
                              "Join us for a delicious English brunch on Saturday, July 30th from 11am to 2pm.",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.labelLargeBluegray400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class HomeScreenItemWidget extends StatelessWidget {
  final int index;

  const HomeScreenItemWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(all: 8),
      decoration: AppDecoration.outline2.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          child: buildItemView(index),
          onTap: () => handleTap(index, context),
        ),
      ),
    );
  }

  void handleTap(int index, BuildContext context) {
    final routes = [
      AppRoutes.memberPortalScreen,
      AppRoutes.onlineFoodScreen,
      AppRoutes.feedbackManagementMainScreen,
      AppRoutes.onlineCinemaBookingMainScreen,
      AppRoutes.memberPortalOnlinePaymentScreen,
      // Add more routes as needed
    ];

    if (index >= 0 && index < routes.length) {
      Navigator.pushNamed(context, routes[index]);
    }
  }

  Widget buildItemView(int index) {
    final titles = [
      "Member\nPortal",
      "Online\nFood",
      "Feedback\nManagement",
      "Online\nCinema Book",
      "Online\nBill Payment",
      "F & B\nMenus",
    ];

    final images = [
      ImageConstant.imgFamily,
      ImageConstant.food,
      ImageConstant.imgfeed,
      ImageConstant.imgMobile1,
      ImageConstant.imgBill,
      ImageConstant.imgEvaluation,
    ];

    return GestureDetector(
      child: Row(
        children: [
          CustomImageView(
            imagePath: images[index],
            height: getSize(24),
            width: getSize(24),
            margin: getMargin(top: 9, bottom: 8),
          ),
          Padding(
            padding: getPadding(left: 12, top: 4),
            child: Text(
              titles[index],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: theme.textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
