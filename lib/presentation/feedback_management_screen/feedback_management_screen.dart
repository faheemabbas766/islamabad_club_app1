import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/presentation/feedback_management_main_screen/feedback_management_main_screen.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import 'package:islamabad_club_app/widgets/custom_text_form_field.dart';
import '../../core/sharedpreference.dart';
import '../../model/services/media_service.dart';

import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:fluttertoast/fluttertoast.dart'as ft;
class FeedbackManagementScreen extends StatefulWidget {
  const FeedbackManagementScreen();
  @override
  State<FeedbackManagementScreen> createState() => _FeedbackManagementScreenState();
}

class _FeedbackManagementScreenState extends State<FeedbackManagementScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  List<Category> dropdownItemListCategory = [];
  List<Category> dropdownItemListSubCategory = [];
  List<Category> dropdownItemListIssue = [];
  TextEditingController feedbackComplaintController = TextEditingController();
  String _filePath = '';
  String selectedCategoryId = '';
  String selectedSubCategoryId = '';
  String selectedIssueId = '';
  MediaService mediaService = MediaService();
  @override
  void initState() {
    super.initState();
    fetchInfo();
  }

  Future<void> fetchInfo() async {
    await fetchCat();
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
  Future<void> fetchIssue() async {
    try {
      Map<String, dynamic> bodyData = {
        'cci_ccs_ref': selectedSubCategoryId,
      };
      dynamic response = await mediaService.postRequest('getissue', bodyData);
      if (response['status'] == 'Success') {
        final List<Category> categories = (response['data'] as List<dynamic>).map((data) {
          return Category(id: data['cci_id'], name: data['cci_name']);
        }).toList();
        setState(() {
          dropdownItemListIssue = categories;
        });
      } else {
        print("Status: ${response['status']}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  Future<void> submitComplaint() async {
    try {
      if (selectedSubCategoryId.isNotEmpty &&
          selectedCategoryId.isNotEmpty &&
          selectedIssueId.isNotEmpty) {
        Map<String, dynamic> bodyData = {
          'cm_cat': selectedCategoryId,
          'cm_sub_cat': selectedSubCategoryId,
          'cm_issue': selectedIssueId,
          'USR_SN': SharedData.preferences.getString('userSN'), // Ensure you have a default value here
          'cm_msg':
          feedbackComplaintController.text,
        };
        final request = http.MultipartRequest(
          'POST',
          Uri.parse('https://islamabadclub.finalsolutions.com.pk/add_complaint'),
        );

        bodyData.forEach((key, value) {
          request.fields[key] = value.toString();
        });
        if (_filePath.isNotEmpty) {
          final fileName = '${SharedData.preferences.getString('userSN')}_${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())}'+'.'+_filePath.split('.').last;
          request.files.add(await http.MultipartFile.fromPath(
            'upload_file',
            _filePath,
            filename: fileName, // Preserve the original file name and extension
          ));
        }
        final response = await request.send();
        if (response.statusCode == 200) {
          final responseBody = await response.stream.bytesToString();
          final responseJson = json.decode(responseBody);
          if (responseJson['status'] == 'Success') {
            ft.Fluttertoast.showToast(
              msg: responseJson['message'],
              toastLength: ft.Toast.LENGTH_SHORT,
            );
            Navigator.pop(context);
          } else {
            ft.Fluttertoast.showToast(
              msg: responseJson['message'],
              toastLength: ft.Toast.LENGTH_SHORT,
            );
            print("Status: ${responseJson['status']}");
          }
        } else {
          ft.Fluttertoast.showToast(
            msg: 'Failed to submit the complaint. Status code: ${response.statusCode}',
            toastLength: ft.Toast.LENGTH_SHORT,
          );
        }
      } else {
        ft.Fluttertoast.showToast(
          msg: "Fill all Fields to Submit!",
          toastLength: ft.Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      print("Error: $e");
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
                title: AppbarSubtitle(text: "Add Complaint"),
                actions: [
                  AppbarStack1(
                      margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
                ]),
            body: SingleChildScrollView(
                child: Padding(
                    padding: getPadding(left: 24, right: 23),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                                padding: getPadding(top: 28),
                                child: Text("Add Complaints:",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles
                                        .titleSmallSemiBold_1)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Category",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.titleSmall),
                          ),
                          Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.all(8),
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
                                  dropdownItemListIssue = [];
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
                            margin: EdgeInsets.all(8),
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
                                  fetchIssue();
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Issue",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.titleSmall),
                          ),
                          Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.all(8),
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
                              items: dropdownItemListIssue.map((category) {
                                return DropdownMenuItem<String>(
                                  value: category.id, // Use the category name as the value
                                  child: Text(category.name), // Display the category name
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedIssueId = value.toString();
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextFormField(
                                textInputAction: TextInputAction.done,
                                controller: feedbackComplaintController,
                                contentPadding: getPadding(
                                    left: 18, top: 10, right: 18, bottom: 15),
                                textStyle: CustomTextStyles
                                    .bodyMediumBlack90002_1,
                                hintText: "Complaint Description",
                                hintStyle: CustomTextStyles
                                    .bodyMediumBlack90002_1,
                                maxLines: 5,
                                filled: true,
                                fillColor: theme
                                    .colorScheme.onPrimaryContainer
                                    .withOpacity(1),
                                defaultBorderDecoration:
                                TextFormFieldStyleHelper.outlineGray200,
                                enabledBorderDecoration:
                                TextFormFieldStyleHelper.outlineGray200,
                                focusedBorderDecoration:
                                TextFormFieldStyleHelper.outlineGray200,
                                disabledBorderDecoration:
                                TextFormFieldStyleHelper.outlineGray200),
                          ),
                          Padding(
                              padding: getPadding(left: 1, top: 15),
                              child: Text("File Input",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.titleSmall)),
                          Row(
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                ),
                                onPressed: () async {
                                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg', 'png'],
                                  );

                                  if (result != null) {
                                    setState(() {
                                      _filePath = result.files.single.path ?? '';
                                    });
                                  }
                                },
                                child: Text('Input File'),
                              ),
                              Text(
                                _filePath.isEmpty
                                    ? '  No File chosen'
                                    : '  File: ${_filePath.length <= 30 ? _filePath : '...' + _filePath.substring(_filePath.length - 30)}',
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: getPadding(top: 14, right: 1),
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        CustomElevatedButton(
                                            onTap:(){
                                              Navigator.pop(context);
                                            },
                                            text: "Cancel".toUpperCase(),
                                            buttonStyle: CustomButtonStyles
                                                .fillPrimaryContainer
                                                .copyWith(
                                                fixedSize: MaterialStateProperty
                                                    .all<Size>(Size(
                                                    getHorizontalSize(
                                                        150),
                                                    getVerticalSize(
                                                        40)))),
                                            buttonTextStyle: CustomTextStyles
                                                .titleMediumOnPrimaryContainer),
                                        SizedBox(width: 10),
                                        CustomElevatedButton(
                                            onTap: submitComplaint,
                                            text: "Submit".toUpperCase(),
                                            margin: getMargin(left: 9),
                                            buttonStyle: CustomButtonStyles
                                                .fillPrimaryTL3
                                                .copyWith(
                                                fixedSize: MaterialStateProperty
                                                    .all<Size>(Size(
                                                    getHorizontalSize(
                                                        150),
                                                    getVerticalSize(
                                                        40)))),
                                            buttonTextStyle: CustomTextStyles
                                                .titleMediumOnPrimaryContainer),
                                      ]))),
                        ]))),
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
class Category {
  String id;
  final String name;

  Category({required this.id, required this.name});
}
