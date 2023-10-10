import 'package:flutter/material.dart';
import 'package:islamabad_club_app/routes/app_routes.dart';
import 'package:islamabad_club_app/theme/theme_helper.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_iconbutton.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_stack_1.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:islamabad_club_app/widgets/app_bar/custom_app_bar.dart';

import 'core/utils/image_constant.dart';
import 'core/utils/size_utils.dart';

class EventDetailsScreen extends StatelessWidget {
  final String eventName;
  final String eventDetails;
  final String startDate;
  final String endDate;
  final String imageUrl;

  EventDetailsScreen({
    required this.eventName,
    required this.eventDetails,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    notificationShow(context);
    onTapArrowleft(BuildContext context) {
      while(Navigator.canPop(context))
        Navigator.pop(context);
      Navigator.pushNamed(context, AppRoutes.homeScreenContainerScreen);
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
              title: AppbarSubtitle(text: "Event Details"),
              actions: [
                AppbarStack1(
                    margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
              ]),
          resizeToAvoidBottomInset: false,
          body: Column(
            children:[
              // Background image
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),

              // Content overlay
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Event Name
                      Text(
                        eventName,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      // Event Details
                      SizedBox(height: 10.0),
                      Text(
                        eventDetails,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),

                      // Start and End Dates
                      SizedBox(height: 20.0),
                      Text(
                        'Start Date: $startDate',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'End Date: $endDate',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
