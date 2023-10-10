import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/model/services/media_service.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_iconbutton.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_stack_1.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:islamabad_club_app/widgets/app_bar/custom_app_bar.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import 'package:islamabad_club_app/widgets/custom_text_form_field.dart';
import 'package:islamabad_club_app/core/sharedpreference.dart';
import '../../model/profile_model.dart';
import 'package:fluttertoast/fluttertoast.dart' as ft;
import '../../notification_services.dart';

import '../../widgets/custom_elevated_button.dart';
class MemberPortalScreen extends StatefulWidget {
  MemberPortalScreen({Key? key}) : super(key: key);

  @override
  _MemberPortalScreenState createState() => _MemberPortalScreenState();

}
class _MemberPortalScreenState extends State<MemberPortalScreen> {
  MediaService mediaService = new MediaService();
  late Profile profile;
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Future<void> updateProfile() async {
    try{
      Map<String, dynamic> profileData = {
        'USR_SN': SharedData.preferences.getString('userSN'),
        'ACADEMIC_QUALIFICATIONS': qualificationController.text,
        'OCCUPATION': occupationController.text,
        'EMPLOYER_NAME': employeeNameController.text,
        'POSITION': positionController.text,
        'MAILING_ADDRESS': mailAddressController.text,
        'PERMANENT_ADDRESS': permanentAddressController.text,
        'CITY': cityController.text,
        'RES_PHONE_NO': residentialPhoneController.text,
        'OFF_ADD': officeAddressController.text,
        'OFF_PHONENO': officePhoneController.text,
        'MOBILE_NO': mobileController.text,
        'FAX': faxController.text,
        'EMAIL': eMailController.text,
      };
      dynamic response = await mediaService.postRequest('updatepersonalinfo', profileData);
      setState(() {
        isLoading = false;
      });
      ft.Fluttertoast.showToast(
         msg: response['message'],
          toastLength: ft.Toast.LENGTH_LONG);

    }catch(e){
      ft.Fluttertoast.showToast(
          msg: "Failed to Update!",
          toastLength: ft.Toast.LENGTH_LONG);
    }
  }
  Future<void> fetchData() async {
    try{
      Map<String, dynamic> requestBody = {
        'USR_SN': SharedData.preferences.getString('userSN'),
      };
      dynamic response = await mediaService.postRequest('personalinfo', requestBody);
      print("Response Map: $response");  // Print the entire response map
      print("Status: ${response['status']}"); // Print the 'status' field from the response map
      if (response['status'] == 'Success') {
        profile = Profile.fromJson(response);
        nameController.text = profile.data!.meminfo!.mEMBERNAME!;
        dateMemberController.text = profile.data!.meminfo!.dATEOFMEMBERSHIP!;
        nicController.text = profile.data!.meminfo!.nICNO!;
        dobController.text = profile.data!.meminfo!.dATEOFBIRTH!;

        qualificationController.text = profile.data!.meminfo!.aCADEMICQUALIFICATIONS!;
        occupationController.text = profile.data!.meminfo!.oCCUPATION!;
        employeeNameController.text = profile.data!.meminfo!.eMPLOYERNAME!;
        positionController.text = profile.data!.meminfo!.pOSITION!;
        mailAddressController.text = profile.data!.meminfo!.mAILINGADDRESS!;
        permanentAddressController.text = profile.data!.meminfo!.pERMANENTADDRESS!;
        cityController.text = profile.data!.meminfo!.cITY!;
        residentialPhoneController.text = profile.data!.meminfo!.rESPHONENO!;
        officeAddressController.text = profile.data!.meminfo!.oFFADD!;
        officePhoneController.text = profile.data!.meminfo!.oFFPHONENO!;
        mobileController.text = profile.data!.meminfo!.mOBILENO!;
        faxController.text = profile.data!.meminfo!.fAX!;
        eMailController.text = profile.data!.meminfo!.eMAIL!;
        loaded = false;
        setState(() {

        });
        print("abc");
      }
    } catch (e) {
      print("ERROR:"+e.toString());
    }
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  bool isLoading = false;
  bool loaded = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController dateMemberController = TextEditingController();
  TextEditingController nicController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController mailAddressController = TextEditingController();
  TextEditingController permanentAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController residentialPhoneController = TextEditingController();
  TextEditingController officeAddressController = TextEditingController();
  TextEditingController officePhoneController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController faxController = TextEditingController();
  TextEditingController eMailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    notificationShow(context);
    
    NotificationServices notificationServices = NotificationServices();
    notificationServices.requestNotificationPermission();
    notificationServices.forGroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value){
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
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
                      onTapArrowleft1(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "Profile"),
                actions: [
                  AppbarStack1(
                      margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
                ]),
            body: loaded
                ? Center(
              child: CircularProgressIndicator(), // Show circular progress indicator
            )
                :SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 24, right: 24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: getPadding(top: 30),
                            child: Text("Name",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            enabled: false,
                            controller: nameController,
                            margin: getMargin(top: 5),
                            textInputAction: TextInputAction.none,
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            enabledBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            focusedBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            disabledBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Text("Date of membership",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: dateMemberController,
                            enabled: false,
                            margin: getMargin(top: 4),
                            textInputAction: TextInputAction.none,
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            enabledBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            focusedBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            disabledBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002),
                        Padding(
                            padding: getPadding(top: 24),
                            child: Text("NIC",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: nicController,
                            enabled: false,
                            margin: getMargin(top: 5),
                            textInputAction: TextInputAction.none,
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            enabledBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            focusedBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            disabledBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002),
                        Padding(
                            padding: getPadding(top: 23),
                            child: Text("Date of birth",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: dobController,
                            enabled: false,
                            margin: getMargin(top: 6),
                            textInputAction: TextInputAction.none,
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            enabledBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            focusedBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            disabledBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Text("Academic Qualification",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: qualificationController,
                            margin: getMargin(top: 4),
                            textInputAction: TextInputAction.none,
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            enabledBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            focusedBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            disabledBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Text("Occupation",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: occupationController,
                            margin: getMargin(top: 4),
                            textInputAction: TextInputAction.none,
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            enabledBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            focusedBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002,
                            disabledBorderDecoration:
                                TextFormFieldStyleHelper.outlineBlack90002),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Text("Employer Name",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: employeeNameController,
                            margin: getMargin(top: 4),
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            enabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            focusedBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            disabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Text("Position",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: positionController,
                            margin: getMargin(top: 4),
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            enabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            focusedBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            disabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Text("Mailing Address",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: mailAddressController,
                            margin: getMargin(top: 4),
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            enabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            focusedBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            disabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Text("PERMANENT ADDRESS",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: permanentAddressController,
                            margin: getMargin(top: 4),
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            enabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            focusedBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            disabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Text("CITY",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: cityController,
                            margin: getMargin(top: 4),
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            enabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            focusedBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            disabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Text("RESIDENTIAL PHONE",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: residentialPhoneController,
                            margin: getMargin(top: 4),
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            enabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            focusedBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            disabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Text("OFFICE ADDRESS",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: officeAddressController,
                            margin: getMargin(top: 4),
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            enabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            focusedBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            disabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Text("OFFICE PHONE",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: officePhoneController,
                            margin: getMargin(top: 4),
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            enabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            focusedBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            disabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Text("MOBILE",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: mobileController,
                            margin: getMargin(top: 4),
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            enabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            focusedBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            disabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Text("FAX",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: faxController,
                            margin: getMargin(top: 4),
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            enabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            focusedBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            disabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Text("E-MAIL",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium)),
                        CustomTextFormField(
                            controller: eMailController,
                            margin: getMargin(top: 4),
                            filled: true,
                            fillColor: theme.colorScheme.onPrimaryContainer
                                .withOpacity(1),
                            defaultBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            enabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            focusedBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001,
                            disabledBorderDecoration:
                            TextFormFieldStyleHelper.outlineBlack90001),Stack(
                          children: [
                            CustomElevatedButton(
                              onTap: () {
                                setState(() {
                                  isLoading = true; // Set isLoading to true to show loading indicator
                                });
                                updateProfile(); // Call your API update function
                              },
                              text: isLoading ? 'Updating...' : 'Update', // Show "Updating..." while loading
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
                              Positioned.fill(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                          ],
                        ),
                      ]
                  )
              ),
            ),
          bottomNavigationBar: CustomBottomBar(onChanged: (BottomBarEnum Home) {
            // Handle bottom bar changes if needed
          }),
        )
    );
  }

  onTapArrowleft1(BuildContext context) {
    Navigator.pop(context);
  }
}
