import 'package:fluttertoast/fluttertoast.dart' as ft;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/model/services/media_service.dart';
import 'package:islamabad_club_app/notification_services.dart';
import 'package:islamabad_club_app/widgets/custom_elevated_button.dart';
import 'package:islamabad_club_app/widgets/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  MediaService mediaService = MediaService();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  Future<void> login() async {
    Map<String, dynamic> requestBody = {
      'username': idController.text,
      'password': passwordController.text,
      'fire_token': await NotificationServices().getDeviceToken(),
    };

    try {
      dynamic response = await mediaService.postRequest('login', requestBody);
      print("Response Map: $response");
      print("Status: ${response['status']}");
      if (response['status'] == 'Success') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        await prefs.setString('userSN', response['data']['USR_SN']);
        await prefs.setString('userName', response['data']['MEMBER_NAME']);
        await prefs.setString('USR_GRP_REF', response['data']['USR_GRP_REF']);
        await prefs.setString('USR_NAME', response['data']['USR_NAME']);
        Navigator.pushReplacementNamed(
            context, AppRoutes.homeScreenContainerScreen);
      } else {
        idController.clear();
        passwordController.clear();
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

  @override
  Widget build(BuildContext context) {
    
    notificationShow(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        resizeToAvoidBottomInset: false,
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
                    "Log in to your account",
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
                      "Member ID",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.labelLargeBlack90002,
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: "i.e. SXXXX,NSXXXX",
                  controller: idController,
                  autofocus: true,
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
                      return 'Member ID is required';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(left: 1, top: 5),
                    child: Text(
                      "Password",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.labelLargeBlack90002,
                    ),
                  ),
                ),
                CustomTextFormField(
                  hintText: "Password",
                  controller: passwordController,
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
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: getPadding(top: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.forgetPasswordScreen);
                      },
                      child: Text(
                        "Forgot Password?",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style:
                        CustomTextStyles.bodySmallMontserratBlack9000212,
                      ),
                    ),
                  ),
                ),
                CustomElevatedButton(
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      await login();
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  text: isLoading ? 'Logging In...' : 'Log In',
                  margin: getMargin(
                    left: 1,
                    top: 30,
                    bottom: 10,
                  ),
                  buttonStyle: CustomButtonStyles.fillAmber600.copyWith(
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size(
                        double.maxFinite,
                        getVerticalSize(60),
                      ),
                    ),
                  ),
                  buttonTextStyle: CustomTextStyles.titleMediumOnPrimaryContainer18,
                ),
                if (isLoading)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                Padding(
                  padding: getPadding(top: 35, bottom: 5),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Create a new account?",
                          style: CustomTextStyles.titleSmallGray600,
                        ),
                        TextSpan(
                          text: " Sign Up",
                          style: CustomTextStyles.titleSmallAmber600_1,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.signUpScreen);
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
        ),
      ),
    );
  }
}
