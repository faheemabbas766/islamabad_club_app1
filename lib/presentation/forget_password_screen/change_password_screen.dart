import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as ft;
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/model/services/media_service.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import 'package:islamabad_club_app/widgets/custom_elevated_button.dart';
import 'package:islamabad_club_app/widgets/custom_text_form_field.dart';
import '../../core/sharedpreference.dart';

import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureTextNew = true;
  bool _obscureTextCon = true;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  String _statusMessage = '';

  String? _matchPasswordValidator(String? value) {
    if (value != newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> changePass() async {
    setState(() {
      _isLoading = true;
    });

    Map<String, dynamic> requestBody = {
      'USR_REF': SharedData.preferences.getString('userSN'),
      'oldpwd': oldPasswordController.text,
      'newpwd': newPasswordController.text,
    };

    try {
      MediaService mediaService = MediaService();
      dynamic response =
      await mediaService.postRequest('doChangePassword', requestBody);
      print("Response Map: $response");
      print("Status: ${response['status']}");
      _statusMessage = response['message'];
      oldPasswordController.text = "";
      newPasswordController.text = "";
      confirmPasswordController.text = "";
      setState(() {
        _isLoading = false;
      });
      ft.Fluttertoast.showToast(
        msg: _statusMessage,
        toastLength: ft.Toast.LENGTH_LONG,
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ft.Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: ft.Toast.LENGTH_LONG,
      );
    }
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    oldPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    notificationShow(context);
    onTapArrowleft(BuildContext context) {
      while(Navigator.canPop(context)){
        Navigator.pop(context);
      }
      Navigator.pushNamed(context, AppRoutes.profilePage);
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
            title: AppbarSubtitle(text: "Change Password"),
            actions: [
              AppbarStack1(
                  margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
            ]),
        body: Form(
          key: _formKey,
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
                    "Change Password",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleLargeBlack90002,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(left: 1, top: 59),
                    child: Text(
                      "Old Password:",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.labelLargeBlack90002,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: oldPasswordController,
                  margin: getMargin(top: 4),
                  textInputAction: TextInputAction.next,
                  defaultBorderDecoration:
                  TextFormFieldStyleHelper.outlineGray9007f,
                  enabledBorderDecoration:
                  TextFormFieldStyleHelper.outlineGray9007f,
                  focusedBorderDecoration:
                  TextFormFieldStyleHelper.outlineGray9007f,
                  disabledBorderDecoration:
                  TextFormFieldStyleHelper.outlineGray9007f,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  obscureText: _obscureText,
                  suffix: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(left: 1, top: 14),
                    child: Text(
                      "New Password",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.labelLargeBlack90002,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: newPasswordController,
                  margin: getMargin(top: 4),
                  textInputAction: TextInputAction.next,
                  defaultBorderDecoration:
                  TextFormFieldStyleHelper.outlineGray9007f,
                  enabledBorderDecoration:
                  TextFormFieldStyleHelper.outlineGray9007f,
                  focusedBorderDecoration:
                  TextFormFieldStyleHelper.outlineGray9007f,
                  disabledBorderDecoration:
                  TextFormFieldStyleHelper.outlineGray9007f,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  obscureText: _obscureTextNew,
                  suffix: IconButton(
                    icon: Icon(_obscureTextNew
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscureTextNew = !_obscureTextNew;
                      });
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(left: 1, top: 14),
                    child: Text(
                      "Confirm Password",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.labelLargeBlack90002,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: confirmPasswordController,
                  margin: getMargin(top: 4),
                  textInputAction: TextInputAction.next,
                  defaultBorderDecoration:
                  TextFormFieldStyleHelper.outlineGray9007f,
                  enabledBorderDecoration:
                  TextFormFieldStyleHelper.outlineGray9007f,
                  focusedBorderDecoration:
                  TextFormFieldStyleHelper.outlineGray9007f,
                  disabledBorderDecoration:
                  TextFormFieldStyleHelper.outlineGray9007f,
                  validator: _matchPasswordValidator,
                  obscureText: _obscureTextCon,
                  suffix: IconButton(
                    icon: Icon(_obscureTextCon
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscureTextCon = !_obscureTextCon;
                      });
                    },
                  ),
                ),
                CustomElevatedButton(
                  text: "Save",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await changePass();
                    }
                  },
                  margin: getMargin(top: 34),
                  buttonStyle: CustomButtonStyles.fillAmber600.copyWith(
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(
                          double.maxFinite,
                          getVerticalSize(60),
                        ),
                      )),
                  buttonTextStyle:
                  CustomTextStyles.titleMediumOnPrimaryContainer18,
                ),
                if (_isLoading)
                  Padding(
                    padding: getPadding(top: 10),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}
