import 'package:flutter/material.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/profile.dart';
import '../../routes/app_routes.dart';

import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';

class ConfirmPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    notificationShow(context);
    onTapArrowleft(BuildContext context) {
        Navigator.pop(context);
    }
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
            title: AppbarSubtitle(text: "Confirmation"),
            actions: [
              AppbarStack1(
                  margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
            ]),
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInlineListTile('First Name', profile.firstname),
                    buildInlineListTile('Last Name', profile.lastname),
                    buildInlineListTile('Email Address', profile.email),
                    buildInlineListTile('Phone', profile.mobilenum),
                    buildInlineListTile('City', profile.city),
                    buildInlineListTile('Address', profile.mailingaddress),
                    buildInlineListTile('Country', profile.country),
                    buildInlineListTile('State', profile.state),
                    buildInlineListTile('Postal Code', profile.postalcode),
                    buildInlineListTile('Outstanding Dues', profile.dues),
                    buildInlineListTile('Convenience + FED charges', profile.fedChareges),
                    buildInlineListTile('Total Payable', profile.totalpayable),
                    SizedBox(height: 24.0),
                    Text(
                      "Disclaimer: You are now leaving Islamabad Club's website and going to HBL website that is not operated by the Islamabad Club. We are not responsible for the content or availability of linked site.",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      "Dear Member, in order to pay your dues online, please make sure your Debit / Credit card is active for online / E-commerce transactions. Kindly contact your Bank for activation of E-commerce service on your Debit (ATM) or Credit card. Thank You.\n\nPayment updation will reflect on the next working day",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    SizedBox(height: 32.0),
                    CustomElevatedButton(
                      text:"Confirm",
                      margin: getMargin(top: 24, bottom: 24),
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutes.memberPortalOnlinePaymentMethodScreen);
                      },
                      buttonStyle: CustomButtonStyles.fillAmber600TL5.copyWith(
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size(double.maxFinite, getVerticalSize(49)),
                        ),
                      ),
                      buttonTextStyle: CustomTextStyles.titleMediumOnPrimaryContainer17,
                    ),
                    SizedBox(height: 32.0),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.symmetric(vertical: 11),
    );
  }
}
Widget buildInlineListTile(String title, String subtitle) {
  return Row(
    children: [
      Expanded(
        child: ListTile(
          title: Text(title),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
}