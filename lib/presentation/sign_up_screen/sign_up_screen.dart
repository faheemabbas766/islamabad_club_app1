import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController memberIdController = TextEditingController();
  TextEditingController nicController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isCheckbox = false;
  late DateTime selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDateTime) {
      setState(() {
        selectedDateTime = picked;
        dobController.text = selectedDateTime.toString(); // Update the text field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    notificationShow(context);
    mediaQueryData = MediaQuery.of(context);

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgIclogonew1791x800,
                    height: getVerticalSize(
                      100,
                    ),
                    width: getHorizontalSize(
                      99,
                    ),
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        top: 14,
                      ),
                      child: Text(
                        "Create account",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.titleLargeBlack90002,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 1,
                      top: 60,
                    ),
                    child: Text(
                      "Member ID",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.labelLargeBlack90002,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: "i.e. SXXXX,NSXXXX",
                    controller: memberIdController,
                    margin: getMargin(left: 1, top: 4),
                    textInputAction: TextInputAction.next,
                    defaultBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                    enabledBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                    focusedBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                    disabledBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a value';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: getPadding(left: 1, top: 10),
                    child: Text(
                      "NIC",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.labelLargeBlack90002,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: "14 digit NIC",
                    controller: nicController,
                    margin: getMargin(left: 1, top: 4),
                    textInputAction: TextInputAction.next,
                    defaultBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                    enabledBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                    focusedBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                    disabledBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a value';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: getPadding(left: 1, top: 10),
                    child: Text(
                      "DOB",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.labelLargeBlack90002,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      _selectDateTime(context);
                    },
                    child: CustomTextFormField(
                      hintText: "i.e. 2000-10-20",
                      controller: dobController,
                      textInputType: TextInputType.datetime,
                      margin: getMargin(left: 1, top: 4),
                      textInputAction: TextInputAction.next,
                      defaultBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                      enabledBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                      focusedBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                      disabledBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: getPadding(left: 1, top: 10),
                    child: Text(
                      "Email",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.labelLargeBlack90002,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: "email@example.com",
                    controller: emailController,
                    margin: getMargin(left: 1, top: 5),
                    defaultBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                    enabledBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                    focusedBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                    disabledBorderDecoration: TextFormFieldStyleHelper.outlineGray9007f,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a value';
                      }
                      // Add more validation rules for email format
                      return null;
                    },
                  ),
                  CheckboxListTile(
                    title: Text(
                      "By creating an account you have to agree\nwith our terms & conditions.",
                      style: CustomTextStyles.bodySmallMontserratGray600,
                    ),
                    value: isCheckbox,
                    onChanged: (newValue) {
                      setState(() {
                        isCheckbox = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CustomElevatedButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.homeScreenContainerScreen);
                      }
                    },
                    text: "Create account",
                    margin: getMargin(
                      left: 1,
                      top: 50,
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
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        top: 28,
                        bottom: 5,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have an account? ",
                              style: CustomTextStyles.titleSmallErrorContainer,
                            ),
                            TextSpan(
                              text: "Log In",
                              style: CustomTextStyles.titleSmallAmber600_1.copyWith(
                                decoration: TextDecoration.underline, // Add underline to indicate it's clickable
                              ),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
