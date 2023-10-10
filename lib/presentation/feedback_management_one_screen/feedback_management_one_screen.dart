import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/model/complaint_result_model.dart';
import 'package:islamabad_club_app/model/services/media_service.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import 'package:islamabad_club_app/widgets/custom_elevated_button.dart';
import '../../core/sharedpreference.dart';

import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../feedback_management_screen/feedback_management_screen.dart';
import 'package:fluttertoast/fluttertoast.dart'as ft;

import '../feedback_management_search_result_screen/feedback_management_search_result_screen.dart';
class FeedbackManagementOneScreen extends StatefulWidget {
  const FeedbackManagementOneScreen();

  @override
  State<FeedbackManagementOneScreen> createState() => _FeedbackManagementOneScreenState();
}

class _FeedbackManagementOneScreenState extends State<FeedbackManagementOneScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  List<Category> dropdownItemListCategory = [];
  List<Category> dropdownItemListSubCategory = [];
  TextEditingController complaintsController = TextEditingController();
  List<Category> dropdownStatusList = [];
  DateTime? fromDate;
  DateTime? toDate;
  String? selectedCategoryId;
  String? selectedSubCategoryId;
  String? selectedStatusId;
  MediaService mediaService = MediaService();
  @override
  void initState() {
    super.initState();
    fetchInfo();
  }
  Future<void> fetchInfo() async {
    await fetchCat();
    await fetchStatus();
  }
  Future<void> fetchCat() async {
    try {
      dynamic response = await mediaService.postRequest('getcategories', "");
      if (response['status'] == 'Success') {
        final List<Category> categories = (response['data'] as List<dynamic>).map((data) {
          return Category(id: data['cc_id'], name: data['cc_name']);
        }).toList();
        setState(() {
          dropdownItemListCategory = categories;
        });
      } else {
        print("Status: ${response['status']}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  Future<void> fetchStatus() async {
    try {
      dynamic response = await mediaService.postRequest('get_status', "");
      if (response['status'] == 'Success') {
        final List<Category> categories = (response['data'] as List<dynamic>).map((data) {
          return Category(id: data['cs_id'], name: data['cs_name']);
        }).toList();
        setState(() {
          dropdownStatusList = categories;
        });
      } else {
        print("Status: ${response['status']}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  Future<void> fetchSubCat() async {
    try {
      Map<String, dynamic> requestBody = {
        'cc_ref': selectedCategoryId,
      };
      dynamic response = await mediaService.postRequest('getsubcategories', requestBody);
      if (response['status'] == 'Success') {
        final List<Category> categories = (response['data'] as List<dynamic>).map((data) {
          return Category(id: data['ccs_id'], name: data['ccs_name']);
        }).toList();
        setState(() {
          dropdownItemListSubCategory = categories;
        });
      } else {
        print("Status: ${response['status']}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  Future<void> search() async {
    try {
      if(selectedSubCategoryId !=''){
        Map<String, dynamic> bodyData = {
          'trackno': complaintsController.text,
          'cat': selectedCategoryId?? '',
          'subcat': selectedSubCategoryId?? '',
          'status': selectedStatusId?? '',
          'frmdate': fromDate == null ? '' : DateFormat('yyyy-MM-dd').format(fromDate!),
          'todate': toDate == null ? '' : DateFormat('yyyy-MM-dd').format(toDate!),

          'USR_GRP_REF': SharedData.preferences.getString('USR_GRP_REF'),
          'USR_SN': SharedData.preferences.getString('userSN'),
        };
        dynamic response = await mediaService.postRequest('search_complaints', bodyData);
        if (response['status'] == 'Success') {
          responseDataList = (response['data'] as List?)?.map((json) => ComplaintResult.fromJson(json)).toList();
          Navigator.pushNamed(
              context, AppRoutes.feedbackManagementSearchResultScreen);
        } else {
          ft.Fluttertoast.showToast(
            msg: response['message'],
            toastLength: ft.Toast.LENGTH_SHORT,
          );
          print("Status: ${response['status']}");
        }
      }else{
        ft.Fluttertoast.showToast(
          msg: "Add Description to Submit!",
          toastLength: ft.Toast.LENGTH_SHORT,
        );
      }
    }catch (e) {
      print("Error: $e");
      ft.Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: ft.Toast.LENGTH_SHORT,
      );
    }
  }
  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != fromDate) {
      if (toDate == null || picked.isBefore(toDate!)) {
        setState(() {
          fromDate = picked;
          toDate = picked.add(Duration(days: 1));
        });
      } else {

      }
    }
  }
  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: toDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != toDate) {
      setState(() {
        toDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    
    notificationShow(context);
    mediaQueryData = MediaQuery.of(context);
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
                title: AppbarSubtitle(text: "Search Complaint"),
                actions: [
                  AppbarStack1(
                      margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
                ]),
            body: SingleChildScrollView(
              child: Container(
                  padding: getPadding(left: 24, right: 24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Text("My Complaints",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleSmallSemiBold_1),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Category",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.titleSmall),
                        ),
                        Container(
                          width: double.maxFinite,
                          child: DropdownButtonFormField(
                            hint: Text("Select"),
                            focusNode:FocusNode(),
                            decoration:  InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: appTheme.amber600,
                                  width: 3,
                                ),
                              ),
                            ),
                            items: dropdownItemListCategory.map((category) {
                              return DropdownMenuItem<String>(
                                value: category.id, // Use the category name as the value
                                child: Text(category.name), // Display the category name
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState((){
                                dropdownItemListSubCategory = [];
                                selectedCategoryId = value.toString();
                                fetchSubCat();
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Sub Category",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.titleSmall),
                        ),
                        Container(
                          width: double.maxFinite,
                          child: DropdownButtonFormField(
                            hint: Text("Select"),
                            focusNode:FocusNode(),
                            decoration:  InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: appTheme.amber600,
                                  width: 3,
                                ),
                              ),
                            ),
                            items: dropdownItemListSubCategory.map((category) {
                              return DropdownMenuItem<String>(
                                value: category.id, // Use the category name as the value
                                child: Text(category.name), // Display the category name
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedSubCategoryId = value.toString();
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Complaints No.",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.titleSmall),
                        ),
                        Container(
                          width: double.maxFinite,
                          child: TextField(
                            controller: complaintsController,
                            focusNode:FocusNode(),
                            decoration:  InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: appTheme.amber600,
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Status",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.titleSmall),
                        ),
                        Container(
                          width: double.maxFinite,
                          child: DropdownButtonFormField(
                            hint: Text("Select"),
                            focusNode:FocusNode(),
                            decoration:  InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: appTheme.amber600,
                                  width: 3,
                                ),
                              ),
                            ),
                            items: dropdownStatusList.map((category) {
                              return DropdownMenuItem<String>(
                                value: category.id, // Use the category name as the value
                                child: Text(category.name), // Display the category name
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState((){
                                selectedStatusId = value.toString();
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("From Date",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.titleSmall),
                        ),
                        Container(
                          width: double.maxFinite,
                          child: GestureDetector(
                            onTap: () => _selectFromDate(context),
                            child: Container(
                              padding: EdgeInsets.only(left: 19, top: 11, right: 19, bottom: 11),
                              decoration: AppDecoration.outline14.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder4,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 1, top: 3),
                                    child: Text(
                                      fromDate != null
                                          ? "${fromDate?.month}/${fromDate?.day}/${fromDate?.year}"
                                          : "mm/dd/yyyy",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.titleSmallBlack90002,
                                    ),
                                  ),
                                  CustomImageView(
                                    svgPath: ImageConstant.imgCalendarBlack90002,
                                    height: getSize(22),
                                    width: getSize(22),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("To Date",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.titleSmall),
                        ),
                        Container(
                          width: double.maxFinite,
                          child: GestureDetector(
                            onTap: () => _selectToDate(context),
                            child: Container(
                              padding: EdgeInsets.only(left: 19, top: 11, right: 19, bottom: 11),
                              decoration: AppDecoration.outline14.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder4,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 1, top: 3),
                                    child: Text(
                                      toDate != null
                                          ? "${toDate?.month}/${toDate?.day}/${toDate?.year}"
                                          : "mm/dd/yyyy",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: CustomTextStyles.titleSmallBlack90002,
                                    ),
                                  ),
                                  CustomImageView(
                                    svgPath: ImageConstant.imgCalendarBlack90002,
                                    height: getSize(22),
                                    width: getSize(22),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        CustomElevatedButton(
                            onTap: search,
                            text: "Search".toUpperCase(),
                            margin: getMargin(top: 20, bottom: 5),
                            buttonStyle: CustomButtonStyles.fillPrimary
                                .copyWith(
                                fixedSize: MaterialStateProperty.all<Size>(
                                    Size(getHorizontalSize(200),
                                        getVerticalSize(40)))),
                            buttonTextStyle:
                            CustomTextStyles.titleMediumOnPrimaryContainer,
                            alignment: Alignment.center)
                      ])),
            ),
            bottomNavigationBar:
            CustomBottomBar(onChanged: (BottomBarEnum type) {
              Navigator.pushReplacementNamed(
                  navigatorKey.currentContext!, getCurrentRoute(type));
            })));
  }
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
