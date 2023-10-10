import 'package:flutter/material.dart';
import 'package:islamabad_club_app/model/services/media_service.dart';

import '../../core/sharedpreference.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';

import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'package:fluttertoast/fluttertoast.dart'as ft;
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../feedback_management_main_screen/feedback_management_main_screen.dart';
import '../feedback_management_one_screen/feedback_management_one_screen.dart';
class FeedbackManagementSuggestionScreen extends StatefulWidget {
  FeedbackManagementSuggestionScreen();
  @override
  State<FeedbackManagementSuggestionScreen> createState() => _FeedbackManagementSuggestionScreenState();

}

class _FeedbackManagementSuggestionScreenState extends State<FeedbackManagementSuggestionScreen> {
  TextEditingController feedbackDescriptionController = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  MediaService mediaService = MediaService();
  Future<void> submitSuggestion() async {
    FocusScope.of(context).unfocus();
    try {
      if(feedbackDescriptionController.text !=''){
        Map<String, dynamic> bodyData = {
          'USR_SN': SharedData.preferences.getString('userSN'),
          'description': feedbackDescriptionController.text,
        };
        dynamic response = await mediaService.postRequest('add_suggession', bodyData);
        if (response['status'] == 'Success') {
          ft.Fluttertoast.showToast(
            msg: response['message'],
            toastLength: ft.Toast.LENGTH_SHORT,
          );
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) {return FeedbackManagementMainScreen();}), (Route<dynamic> route) => false);
        } else {
          ft.Fluttertoast.showToast(
            msg: response['massage'],
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
  @override
  Widget build(BuildContext context) {
    
    notificationShow(context);
    onTapArrowleft(BuildContext context) {
      FocusScope.of(context).unfocus();
      while(Navigator.canPop(context))
        Navigator.pop(context);
      Navigator.pushNamed(context, AppRoutes.feedbackManagementMainScreen);
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
                title: AppbarSubtitle(text: "Add Suggestion"),
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
                          Padding(
                              padding: getPadding(left: 1, top: 18),
                              child: Text("Add Suggestion:",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles
                                      .titleSmallSemiBold_1)),
                          CustomTextFormField(
                              controller: feedbackDescriptionController,
                              margin: getMargin(left: 1, top: 15),
                              contentPadding: getPadding(
                                  left: 18, top: 15, right: 18, bottom: 15),
                              textStyle: CustomTextStyles
                                  .bodyMediumBlack90002_1,
                              hintText: "Feedback Description",
                              hintStyle: CustomTextStyles
                                  .bodyMediumBlack90002_1,
                              maxLines: 13,
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
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: getPadding(top: 14, right: 1),
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        CustomElevatedButton(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (_) {
                                                        return FeedbackManagementMainScreen();
                                                      }), (Route<
                                                  dynamic> route) => false);
                                            },
                                            text: "Cancel".toUpperCase(),
                                            buttonStyle: CustomButtonStyles
                                                .fillPrimaryContainer
                                                .copyWith(
                                                fixedSize: MaterialStateProperty
                                                    .all<Size>(Size(
                                                    getHorizontalSize(
                                                        99),
                                                    getVerticalSize(
                                                        40)))),
                                            buttonTextStyle: CustomTextStyles
                                                .titleMediumOnPrimaryContainer),
                                        CustomElevatedButton(
                                            onTap: submitSuggestion,
                                            text: "Submit".toUpperCase(),
                                            margin: getMargin(left: 9),
                                            buttonStyle: CustomButtonStyles
                                                .fillPrimaryTL3
                                                .copyWith(
                                                fixedSize: MaterialStateProperty
                                                    .all<Size>(Size(
                                                    getHorizontalSize(
                                                        99),
                                                    getVerticalSize(
                                                        40)))),
                                            buttonTextStyle: CustomTextStyles
                                                .titleMediumOnPrimaryContainer)
                                      ]))),
                        ]))),
            bottomNavigationBar:
            CustomBottomBar(onChanged: (BottomBarEnum type) {
              Navigator.pushReplacementNamed(
                  navigatorKey.currentContext!, getCurrentRoute(type));
            })));
  }
}
