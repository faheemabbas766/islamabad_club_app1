import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as ft;
import 'package:intl/intl.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/widgets/custom_elevated_button.dart';
import 'package:islamabad_club_app/widgets/custom_text_form_field.dart';
import '../../model/services/media_service.dart';

import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController memberIdController = TextEditingController();
  TextEditingController NICController = TextEditingController();
  TextEditingController DOBController = TextEditingController();
  List<String> dropdownItems = [];
  String selectedValue = '';
  bool isLoading = false;
  DateTime? selectedDate;
  MediaService mediaService = MediaService();

  @override
  void initState() {
    super.initState();
    fetchDropDown();
  }

  Future<void> fetchDropDown() async {
    try {
      setState(() {
        isLoading = true;
      });

      dynamic response = await mediaService.postRequest('forgotpwd', null);
      print("Response Map: $response");

      List<dynamic> responseData = response['data'];
      dropdownItems = responseData.map<String>((item) => item['MEMBER_ID']).toList();
      selectedValue = dropdownItems.isNotEmpty ? dropdownItems[0] : '';

      setState(() {
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ft.Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: ft.Toast.LENGTH_LONG,
      );
    }
  }
  Future<void> restPass() async {
    if (selectedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);

      Map<String, dynamic> requestBody ={
        'mid': selectedValue,
        'mno': memberIdController.text,
        'nic': NICController.text,
        'dob': formattedDate, // Use the formatted date
      };

      try {
        dynamic response = await mediaService.postRequest('restPwd', requestBody);
        print("Response Map: $response");
        print("Status: ${response['status']}");
        if (response['status_code'] == 0) {
          ft.Fluttertoast.showToast(
            msg: response['message'],
            toastLength: ft.Toast.LENGTH_LONG,
          );
        } else {
          ft.Fluttertoast.showToast(
            msg: response['message'],
            toastLength: ft.Toast.LENGTH_LONG,
          );
        }
      } catch (e) {
        ft.Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: ft.Toast.LENGTH_LONG,
        );
      }
    }
  }


  void dispose() {
    memberIdController.dispose();
    NICController.dispose();
    DOBController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    notificationShow(context);
    

    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
              height: getVerticalSize(59),
              leadingWidth: 64,
              centerTitle: true,
              title: AppbarSubtitle(text: "Member Portal"),
            ),
            body: isLoading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: getPadding(
                  left: 21,
                  top: 8,
                  right: 21,
                  bottom: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgIclogonew1791x800,
                      height: getVerticalSize(100),
                      width: getHorizontalSize(99),
                    ),
                    Padding(
                      padding: getPadding(top: 15),
                      child: Text(
                        "Forget Password",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.titleLargeBlack90002,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue!;
                                });
                              },
                              items: dropdownItems
                                  .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                                  .toList(),
                              itemHeight: 48,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        CustomTextFormField(
                          width: 244,
                          controller: memberIdController,
                          margin: getMargin(top: 4),
                          textInputAction: TextInputAction.next,
                          defaultBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                          enabledBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                          focusedBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                          disabledBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                        ),
                      ],
                    ),// Rest of your code...
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(
                          left: 1,
                          top: 14,
                        ),
                        child: Text(
                          "NIC",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.labelLargeBlack90002,
                        ),
                      ),
                    ),
                    CustomTextFormField(
                      controller: NICController,
                      margin: getMargin(
                        top: 4,
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(
                          49,
                        ),
                      ),
                      defaultBorderDecoration:
                      TextFormFieldStyleHelper.outlineGray9007f,
                      enabledBorderDecoration:
                      TextFormFieldStyleHelper.outlineGray9007f,
                      focusedBorderDecoration:
                      TextFormFieldStyleHelper.outlineGray9007f,
                      disabledBorderDecoration:
                      TextFormFieldStyleHelper.outlineGray9007f,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(
                          left: 1,
                          top: 14,
                        ),
                        child: Text(
                          "DOB",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CustomTextStyles.labelLargeBlack90002,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: DOBController,
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode()); // Hide the keyboard
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );

                        if (pickedDate != null && pickedDate != selectedDate) {
                          setState(() {
                            selectedDate = pickedDate;
                            DOBController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
                          });
                        }
                      },
                      readOnly: true, // Prevent manual text input
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    CustomElevatedButton(
                      text: "Reset Password",
                      onTap: () {
                        restPass();
                        //Navigator.pushNamed(context, AppRoutes.changePasswordScreen);
                      },
                      margin: getMargin(
                        top: 34,
                      ),
                      buttonStyle: CustomButtonStyles.fillAmber600.copyWith(
                          fixedSize: MaterialStateProperty.all<Size>(Size(
                            double.maxFinite,
                            getVerticalSize(
                              60,
                            ),
                          ))),
                      buttonTextStyle:
                      CustomTextStyles.titleMediumOnPrimaryContainer18,
                    ),
                    Padding(
                      padding: getPadding(
                        top: 35,
                        bottom: 5,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Enter password?",
                              style: CustomTextStyles.titleSmallGray600,
                            ),
                            TextSpan(
                              text: " Log In",
                              style: CustomTextStyles.titleSmallAmber600_1,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context, AppRoutes.logInScreen);
                                },
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}