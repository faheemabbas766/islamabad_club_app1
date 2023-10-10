import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/model/online_bill_payment.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/presentation/notification_details_screen/notification_details_screen.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import 'package:islamabad_club_app/widgets/custom_elevated_button.dart';
import 'package:islamabad_club_app/widgets/custom_icon_button.dart';
import 'package:islamabad_club_app/widgets/custom_text_form_field.dart';
import '../../core/sharedpreference.dart';
import '../../model/profile.dart';
import '../../model/services/media_service.dart';


class MemberPortalThreeScreen extends StatefulWidget {
  MemberPortalThreeScreen({Key? key}) : super(key: key);

  @override
  _MemberPortalThreeScreenState createState() => _MemberPortalThreeScreenState();
}

class _MemberPortalThreeScreenState extends State<MemberPortalThreeScreen> {
  late MediaQueryData mediaQueryData;
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController convenienceChargesController = TextEditingController();
  TextEditingController totalPayableController = TextEditingController();
  TextEditingController duesController = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  MediaService mediaService = new MediaService();
  OnlineBillPayment onlineBillPayment = OnlineBillPayment();
  String? date;
  String? selectedCountry;
  String? selectedState;
  List<String> countryList= ['abc,abc'];
  List<String> stateList = [''];
  bool loaded = true;
  @override
  void initState() {
    super.initState();
    fetchOnlineBillingInfo();
  }
  Future<void> fetchState() async {
    try{
      int id = 0;
      if(selectedCountry == "PAKISTAN")
        id = 1;
      if(selectedCountry == "USA")
        id = 2;
      if(selectedCountry == "CANADA")
        id = 3;
      if(selectedCountry == "CHINA")
        id = 4;
      Map<String, dynamic> request = {
        'countryid': id,
      };
      dynamic response = await mediaService.postRequest('get_states', request);
      print("Response Map: $response");  // Print the entire response map
      print("Status: ${response['status']}"); // Print the 'status' field from the response map
      if (response['status'] == 'Success') {
        stateList = List<String>.from(response['data']['state'].map((state) => state['title']));
        print("abc");
        setState(() {

        });
      }
    } catch (e) {
      print("ERROR:"+e.toString());
    }
  }
  Future<void> fetchOnlineBillingInfo() async {
    try{
      Map<String, dynamic> requestBody = {
        'USR_REF': SharedData.preferences.getString('userSN')!,
      };
      print( SharedData.preferences.getString('userSN')!);
      dynamic response = await mediaService.postRequest('onlinepayment', requestBody);
      print("Response Map: $response");  // Print the entire response map
      print("Status: ${response['status']}"); // Print the 'status' field from the response map
      if (response['status'] == 'Success') {
        onlineBillPayment = OnlineBillPayment.fromJson(response);
        firstNameController.text = onlineBillPayment.data!.firstname!;
        lastNameController.text = onlineBillPayment.data!.lastname!;
        emailAddressController.text = onlineBillPayment.data!.email!;
        phoneController.text = onlineBillPayment.data!.mobilenum!;
        cityController.text = onlineBillPayment.data!.city!;
        addressController.text = onlineBillPayment.data!.mailingaddress!;
        duesController.text = onlineBillPayment.data!.totalbill!.toString();
        convenienceChargesController.text = onlineBillPayment.data!.convenience!.toString();
        totalPayableController.text = onlineBillPayment.data!.totalpayable!.toString();
        date = onlineBillPayment.data!.lastmonth!+","+onlineBillPayment.data!.currentyear!;
        countryList = onlineBillPayment.data!.country!
            .map<String>((country) => country.title!)
            .toList();
        loaded = false;
        setState(() {

        });
        print("abc");
      }
    } catch (e) {
      print("ERROR:"+e.toString());
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
          child: SizedBox(
            key: _formKey,
            width: mediaQueryData.size.width,
            child:  loaded
                ? Center(
              child: CircularProgressIndicator(), // Show circular progress indicator
            )
                :SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: getMargin(left: 24, right: 24),
                    padding: getPadding(top: 11, bottom: 11),
                    decoration: AppDecoration.fill1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          height: 40,
                          width: 40,
                          padding: getPadding(all: 8),
                          onTap: () {
                            onTapBtnArrowleft(context);
                          },
                          child: CustomImageView(
                            svgPath: ImageConstant.imgArrowleft,
                          ),
                        ),
                        Padding(
                          padding: getPadding(top: 11, bottom: 8),
                          child: Text(
                            "Online Payment",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          margin: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: appTheme.gray200,
                              width: getHorizontalSize(1),
                            ),
                            borderRadius: BorderRadiusStyle.roundedBorder8,
                          ),
                          child: Container(
                            height: getSize(40),
                            width: getSize(40),
                            padding: getPadding(all: 8),
                            decoration: AppDecoration.outline.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder8,
                            ),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgNotification,
                                  height: getSize(24),
                                  width: getSize(24),
                                  alignment: Alignment.center,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: getSize(8),
                                    width: getSize(8),
                                    margin: getMargin(top: 1, right: 3),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.primary,
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(left: 24, right: 24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "First Name",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.bodyMedium,
                                ),
                                CustomTextFormField(
                                  controller: firstNameController,
                                  margin: getMargin(top: 6),
                                  enabled: false,
                                ),
                                Padding(
                                  padding: getPadding(top: 24),
                                  child: Text(
                                    "Last Name",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                CustomTextFormField(
                                  controller: lastNameController,
                                  margin: getMargin(top: 5),
                                  enabled: false,
                                ),
                                Padding(
                                  padding: getPadding(top: 23),
                                  child: Text(
                                    "Email Address",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                CustomTextFormField(
                                  controller: emailAddressController,
                                  margin: getMargin(top: 6),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Email is required";
                                    }
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: getPadding(top: 23),
                                  child: Text(
                                    "Phone",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                CustomTextFormField(
                                  controller: phoneController,
                                  margin: getMargin(top: 6),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Phone name is required";
                                    }
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: getPadding(top: 25),
                                  child: Text(
                                    "City",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                CustomTextFormField(
                                  controller: cityController,
                                  margin: getMargin(top: 4),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "City is required";
                                    }
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: getPadding(top: 23),
                                  child: Text(
                                    "Address",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                CustomTextFormField(
                                  controller: addressController,
                                  margin: getMargin(top: 6),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Address is required";
                                    }
                                    return null;
                                  },
                                ),


                                Padding(
                                  padding: getPadding(top: 23),
                                  child: Text(
                                    "Country",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                DropdownButtonFormField<String>(
                                  value: selectedCountry, // You'll need to define and manage this variable
                                  onChanged: (newValue) {
                                    setState((){
                                      selectedCountry = newValue;
                                      selectedState = null; // Reset selected state when country changes
                                      stateList.clear();
                                      fetchState();
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  items: countryList.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),


                                Padding(
                                  padding: getPadding(top: 6),
                                  child: Text(
                                    "State / Province",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.bodyMedium,

                                  ),
                                ),
                                DropdownButtonFormField<String>(
                                  value: selectedState, // You'll need to define and manage this variable
                                  onChanged: (newValue) {
                                    setState((){
                                      selectedState = newValue;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: Colors.red,width: 2),
                                    ),
                                  ),
                                  items: stateList.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'City is required';
                                    }
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: getPadding(top: 24),
                                  child: Text(
                                    "Postal Code",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                CustomTextFormField(
                                  controller: postalCodeController,
                                  margin: getMargin(top: 7),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Postal Code is required";
                                    }
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: getPadding(top: 24),
                                  child: Text(
                                    "Outstanding Dues\n Till $date",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                CustomTextFormField(
                                  controller: duesController,
                                  margin: getMargin(top: 7),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Dues is required";
                                    }
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: getPadding(top: 24),
                                  child: Text(
                                    "Convenience + FED Charges (Rs)",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                CustomTextFormField(
                                  controller: convenienceChargesController,
                                  margin: getMargin(top: 7),
                                  textInputAction: TextInputAction.next,
                                  enabled: false,
                                ),
                                Padding(
                                  padding: getPadding(top: 24),
                                  child: Text(
                                    "Total Payable (Rs)",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                CustomTextFormField(
                                  controller: totalPayableController,
                                  margin: getMargin(top: 7),
                                  enabled: false,
                                ),
                              CustomElevatedButton(
                              text:"Next",
                              margin: getMargin(top: 24, bottom: 24),
                              onTap: () {
                                  profile.firstname = firstNameController.text;
                                  profile.lastname = lastNameController.text;
                                  profile.email = emailAddressController.text;
                                  profile.mobilenum = phoneController.text;
                                  profile.city = cityController.text;
                                  profile.mailingaddress = addressController.text;
                                  profile.country = selectedCountry?? "No Country";
                                  profile.state = selectedState?? "NO state";
                                  profile.postalcode = postalCodeController.text;
                                  profile.dues = duesController.text;
                                  profile.fedChareges = convenienceChargesController.text;
                                  profile.totalpayable = totalPayableController.text;
                                  Navigator.pushNamed(
                                      context, AppRoutes.memberPortalOnlineConfirmPaymentScreen);
                              },
                              buttonStyle: CustomButtonStyles.fillAmber600TL5.copyWith(
                                fixedSize: MaterialStateProperty.all<Size>(
                                  Size(double.maxFinite, getVerticalSize(49)),
                                ),
                              ),
                              buttonTextStyle: CustomTextStyles.titleMediumOnPrimaryContainer17,
                            ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Navigator.pushNamed(
              navigatorKey.currentContext!,
              getCurrentRoute(type),
            );
          },
        ),
      ),
    );
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

  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}

