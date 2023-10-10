import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islamabad_club_app/model/complaint_result_model.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';

import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class FeedbackManagementSearchResultScreen extends StatefulWidget {
  const FeedbackManagementSearchResultScreen();

  @override
  State<FeedbackManagementSearchResultScreen> createState() =>
      _FeedbackManagementSearchResultState();
}

class _FeedbackManagementSearchResultState extends State<FeedbackManagementSearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    notificationShow(context);
    mediaQueryData = MediaQuery.of(context);
    
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
                      Navigator.pop(context);
                    }
              ),
              centerTitle: true,
              title: AppbarSubtitle(text: "Search Complaint"),
              actions: [
                AppbarStack1(
                    margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
              ]),
          body: ListView.builder(
            itemCount: responseDataList?.length,
            itemBuilder: (context, index) {
              final complaint = responseDataList![index];
              return Card(
                elevation: 4, // Add shadow to the card
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Add margins
                child: ListTile(
                  contentPadding: EdgeInsets.all(16), // Add padding within the ListTile
                  title: Text(
                    complaint.ccName ?? '',
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: theme.colorScheme.inversePrimary,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8), // Add spacing
                      Text(
                        'Complaint# ${complaint.cmId ?? ''}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date: ${(complaint.cmSysDate != null) ? DateFormat('yyyy-MM-dd').format(DateTime.parse(complaint.cmSysDate)) : ''}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Time: ${(complaint.cmSysDate != null) ? DateFormat('HH:mm:ss').format(DateTime.parse(complaint.cmSysDate)) : ''}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Date: ${complaint.cmSysDate?? ''}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4), // Add spacing
                      Text(
                        'Status: ${complaint.cmStatus ?? ''}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: complaint.cmStatus == 'IN PROGRESS'
                              ? Colors.amber
                              : complaint.cmStatus == 'RESOLVED'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Navigate to the details page when a complaint is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeedbackManagementComplaintDetailsScreen(complaint: complaint),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        )
    );
  }
}


class FeedbackManagementComplaintDetailsScreen extends StatelessWidget {
  final ComplaintResult complaint;

  FeedbackManagementComplaintDetailsScreen({required this.complaint});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Complaint Detail",
            style: TextStyle(
              color: Colors.white, // Text color
              fontSize: 20.0,      // Text size
              fontWeight: FontWeight.bold, // Text weight
            ),
          ),
          backgroundColor: Colors.amberAccent, // Background color
          elevation: 4.0, // Shadow elevation
          centerTitle: true, // Center align the title
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white, // Icon color
              ),
              onPressed: () {
                // Add your action here
              },
            ),
          ],
        ),
          body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date: ${(complaint.cmSysDate != null) ? DateFormat('yyyy-MM-dd').format(DateTime.parse(complaint.cmSysDate)) : ''}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Time: ${(complaint.cmSysDate != null) ? DateFormat('HH:mm:ss').format(DateTime.parse(complaint.cmSysDate)) : ''}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Complaint# ${complaint.cmId}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Category:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                complaint.ccName ?? '',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Subcategory:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                complaint.ccsName ?? '',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Issue:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                complaint.cciName ?? '',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Status:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                complaint.cmStatus ?? '',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Complaint Text:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                complaint.cmMsg ?? '',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


