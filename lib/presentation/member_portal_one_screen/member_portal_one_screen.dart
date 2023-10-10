import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/model/monthly_billing_model.dart';
import 'package:islamabad_club_app/model/services/media_service.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/presentation/notification_details_screen/notification_details_screen.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_iconbutton.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_stack_1.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:islamabad_club_app/widgets/app_bar/custom_app_bar.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import 'package:islamabad_club_app/widgets/custom_drop_down.dart';
import 'package:islamabad_club_app/widgets/custom_elevated_button.dart';
import '../../core/sharedpreference.dart';


class MemberPortalOneScreen extends StatefulWidget {
  MemberPortalOneScreen({Key? key}) : super(key: key);

  @override
  _MemberPortalOneScreenState createState() => _MemberPortalOneScreenState();
}

class _MemberPortalOneScreenState extends State<MemberPortalOneScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  MediaService mediaService = MediaService();
  String? selectedValue = "Not Selected";
  DateTime currentDate = DateTime.now();
  List<String> dropdownItemList = [];
  MonthlyBillingModel info = MonthlyBillingModel();
  double bill = 0;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchInfo();
  }
  Future<void> fetchInfo() async{
    fetchMonths();
  }
  Future<void> fetchMonths() async {
    try {
      dynamic response = await mediaService.postRequest('billing_months', '');
      if (response['status'] == 'Success') {
        final List<String> categories = (response['data'] as List)
            .map((data) => data['YearMonth'] as String)
            .toList();
        setState(() {
          dropdownItemList = categories;
        });
      } else {
        print("Status: ${response['status']}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  Future<void> fetchBill() async {
    Map<String, dynamic> profileData = {
      'USR_REF': SharedData.preferences.getString('userSN'),
      'mon': selectedValue,
    };
    dynamic response = await mediaService.postRequest('monthlybilling', profileData);
    if(response['data']!= null){
      if(response['data']['payable']!= null){
        setState(() {
          info = MonthlyBillingModel.fromJson(response);
          bill = 0;
          for (final cateringItem in info.data?.catering ?? []) {
            if (cateringItem != null) {
              bill += double.parse(cateringItem.tOTALBILL.toString());
            }
          }
        });
      }else{

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    notificationShow(context);
    
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
                      onTapArrowleft3(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "Monthly Billing"),
                actions: [
                  AppbarStack1(
                      margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 19, right: 24, bottom: 19),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Select Month",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                            CustomTextStyles.bodySmallMontserratBlack9000212),
                        Padding(
                            padding: getPadding(top: 8),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: CustomDropDown(
                                          icon: Container(
                                              margin:
                                              getMargin(left: 20, right: 20),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowdown)),
                                          hintText: "Please Select",
                                          margin: getMargin(right: 9),
                                          textStyle: CustomTextStyles
                                              .bodySmallMontserratBlack9000212,
                                          items: dropdownItemList,
                                          filled: true,
                                          fillColor: theme
                                              .colorScheme.onPrimaryContainer
                                              .withOpacity(1),
                                          contentPadding: getPadding(
                                              left: 20, top: 15, bottom: 15),
                                          defaultBorderDecoration:
                                          DropDownStyleHelper.outlineGray200,
                                          enabledBorderDecoration:
                                          DropDownStyleHelper.outlineGray200,
                                          focusedBorderDecoration:
                                          DropDownStyleHelper.outlineGray200,
                                          disabledBorderDecoration:
                                          DropDownStyleHelper.outlineGray200,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedValue = value;
                                            });
                                          })),
                                  Expanded(
                                      child: CustomElevatedButton(
                                          text: "Show",
                                          onTap: () async {
                                            setState(() {
                                              isLoading = true;
                                            });
                                            await fetchBill();
                                            setState(() {
                                              isLoading = false;
                                            });
                                          },
                                          margin: getMargin(left: 9),
                                          buttonStyle: CustomButtonStyles
                                              .outlineOnPrimary
                                              .copyWith(
                                              fixedSize: MaterialStateProperty
                                                  .all<Size>(Size(
                                                  double.maxFinite,
                                                  getVerticalSize(45)))),
                                          buttonTextStyle: CustomTextStyles
                                              .titleMediumGray200))
                                ])),
                        isLoading? Center(child: CircularProgressIndicator(),)
                            :Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text("Debit Adj Rs. "),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(info.data?.payable![0].aDJDR.toString() ?? '0.00', textAlign: TextAlign.right),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text("Credit Adj Rs."),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      info.data?.payable![0].aDJCR.toString() ?? '0.00',
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text("Prev Bal. Rs:  "),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(info.data?.payable![0].bal.toString() ?? '0.00', textAlign: TextAlign.right),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text("Curr Bill Rs:"),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(info.data?.payable![0].tOTALBILL.toString() ?? '0.00', textAlign: TextAlign.right),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Text(
                                          "Total:",
                                          style: TextStyle(fontWeight: FontWeight.bold))
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(info.data?.payable![0].tdues.toString() ?? '0.00', textAlign: TextAlign.right,
                                        style: TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: getMargin(top: 10),
                            padding: getPadding(
                                left: 30, top: 14, right: 30, bottom: 14),
                            decoration: AppDecoration.outline5.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder4),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: getPadding(bottom: 1),
                                      child: Text("Particulars",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .labelLargeBlack90002)),
                                  Text("Amount",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                      CustomTextStyles.labelLargeBlack90002)
                                ])),
                        SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                              info.data?.subscription!.length?? 0,
                                  (index) {
                                final subscriptionItem = info.data?.subscription?[index];
                                final headname = subscriptionItem?.hEADNAME ?? '';
                                final charges = subscriptionItem?.cHARGES ?? '0.00';

                                return Container(
                                  margin: getMargin(top: 5),
                                  padding: getPadding(left: 30, top: 14, right: 30, bottom: 14),
                                  decoration: AppDecoration.outline.copyWith(
                                    borderRadius: BorderRadiusStyle.roundedBorder100,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: getPadding(bottom: 1),
                                        child: Text(
                                          headname,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles.labelLargeBlack90002,
                                        ),
                                      ),
                                      Text(
                                        charges,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: CustomTextStyles.labelLargeBlack90002,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                            margin: getMargin(top: 11, bottom: 5),
                            padding: getPadding(
                                left: 19, top: 14, right: 19, bottom: 14),
                            decoration: AppDecoration.outline6.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder4),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Chit No.",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                      CustomTextStyles.labelLargeBlack90002),
                                  Text("Date",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                      CustomTextStyles.labelLargeBlack90002),
                                  Text("Amount",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                      CustomTextStyles.labelLargeBlack90002)
                                ])),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              for (final cateringItem in info.data?.catering ?? [])
                                if (cateringItem != null)
                                  Container(
                                    margin: getMargin(top: 11, bottom: 5),
                                    padding: getPadding(left: 19, top: 14, right: 19, bottom: 14),
                                    decoration: AppDecoration.outline.copyWith(
                                      borderRadius: BorderRadiusStyle.roundedBorder100,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          cateringItem.bILLNO ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles.labelLargeBlack90002,
                                        ),
                                        Text(
                                          cateringItem.bILLDATE ?? '0.00',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles.labelLargeBlack90002,
                                        ),
                                        Text(
                                          cateringItem.tOTALBILL.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles.labelLargeBlack90002,
                                        ),
                                      ],
                                    ),
                                  ),
                            ],
                          ),
                        ),
                        Container(
                            margin: getMargin(top: 11, bottom: 5),
                            padding: getPadding(
                                left: 19, top: 14, right: 19, bottom: 14),
                            decoration: AppDecoration.outline.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder100),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                      CustomTextStyles.titleMediumBlack900),
                                  Text('',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                      CustomTextStyles.labelLargeBlack90002),
                                  Text(bill.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                      CustomTextStyles.titleMediumBlack900)
                                ])),
                      ]),
                )),
            bottomNavigationBar:
            CustomBottomBar(onChanged: (BottomBarEnum type) {
              Navigator.pushReplacementNamed(
                  navigatorKey.currentContext!, getCurrentRoute(type));
            })));
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

  onTapArrowleft3(BuildContext context) {
    Navigator.pop(context);
  }
}
