import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/services/media_service.dart';
import '../../routes/app_routes.dart';

import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../notification_screen/notification.dart';

class NotificationDetailsScreen extends StatefulWidget {

  NotificationDetailsScreen();

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationDetailsScreen> {
  String htmlData = '';
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchNotificationDetails();
  }

  Future<void> fetchNotificationDetails() async {
    try {
      Map<String, dynamic> requestBody = {
        'NOTG_SN': notificationId,
      };
      MediaService mediaService = MediaService();
      dynamic response =
      await mediaService.postRequest('general_notification_detail', requestBody);

      if (response['status'] == 'Success') {
        setState(() {
          htmlData = response['data']['NOTG_TEXT'];
          isLoading = false;
        });
      } else {
        print("Status: ${response['status']}");
      }
    } catch (e) {
      print("Error in General Notification: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    
    notificationShow(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      appBar: CustomAppBar(
        height: getVerticalSize(59),
        leadingWidth: 64,
        leading: AppbarIconbutton(
          svgPath: ImageConstant.imgArrowleft,
          margin: getMargin(left: 24, top: 8, bottom: 8),
          onTap: () => onTapArrowLeft(context),
        ),
        centerTitle: true,
        title: AppbarSubtitle(text: "Notification Details"),
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(), // Show indicator while loading
      )
          : SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Html(data: htmlData),
      ),
    );
  }
}

  onTapArrowLeft(BuildContext context) {
    while(Navigator.canPop(context))
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, AppRoutes.notificationScreen);
}
