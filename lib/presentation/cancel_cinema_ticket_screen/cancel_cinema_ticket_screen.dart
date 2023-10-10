import 'package:flutter/material.dart';
import '../../core/sharedpreference.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/services/media_service.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:fluttertoast/fluttertoast.dart' as ft;
class CancelTicketScreen extends StatefulWidget {
  CancelTicketScreen();

  @override
  _CancelTicketScreenState createState() => _CancelTicketScreenState();
}

class _CancelTicketScreenState extends State<CancelTicketScreen> {
  List<dynamic> ticketList = [];
  bool isLoading = true;
  bool selectAll = false;
  @override
  void initState() {
    super.initState();
    fetchInfo();
  }
  Future<void> fetchInfo() async {
    await getTickets();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> getTickets() async {
    try {
      MediaService mediaService = MediaService();
      Map<String, dynamic> requestBody = {
        'USR_SN': SharedData.preferences.getString('userSN'),
      };
      dynamic response = await mediaService.postRequest('my_bookings', requestBody);
      if (response['status'] == 'Success') {
        setState(() {
          ticketList = response['data'];
        });
      } else {
        print("Status: ${response['status']}");
      }
    } catch (e) {
      print("Error in Tickets Loading...: $e");
    }
  }
  Future<void> cancelTickets() async {
    setState(() {
      isLoading = true;
    });
    try {
      MediaService mediaService = MediaService();
      for(var item in ticketList){
        item['USR_SN'] = SharedData.preferences.getString('userSN');
      }
      dynamic response = await mediaService.postRequest('cancel_tickets', ticketList);
      if (response['status'] == 'Success') {
        ft.Fluttertoast.showToast(
          msg: response['message'],
          toastLength: ft.Toast.LENGTH_LONG,
        );
      } else {
        print("Status: ${response['status']}");
        ft.Fluttertoast.showToast(
          msg: response['message'],
          toastLength: ft.Toast.LENGTH_LONG,
        );
      }
      setState(() async {
        await getTickets();
      });
    } catch (e) {
      print("Error in Tickets Loading...: $e");
      ft.Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: ft.Toast.LENGTH_LONG,
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                }),
            centerTitle: true,
            title: AppbarSubtitle(text: "Cancel Tickets"),
            actions: [
              AppbarStack1(
                  margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
            ]),
        body: isLoading? Center(child: CircularProgressIndicator(),)
            :ticketList.isEmpty
            ? Center(child: Text("No Ticket Yet",textAlign: TextAlign.center))
            :  SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select All"),
                    Checkbox(value: selectAll, onChanged: (value){
                      setState(() {
                        selectAll = !selectAll;
                        for(var ticket in ticketList)
                          ticket['isselect'] = selectAll.toString();
                      });
                    },),
                  ],
                ),
              ),
              Column(
                children: ticketList.map((ticket) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Movie Name: ${ticket['MM_NAME'] ?? "Title not available"}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Movie Date: ${ticket['MMS_DATE'] ?? "Date not available"}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Show Time: ${ticket['MS_STARTTIME'] ?? "Start time not available"}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Ticket No: ${ticket['MT_SN'] ?? "MT SN not available"}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Seat No: ${ticket['MSN_ROW']+ticket['MSN_NUMBER'] ?? "MSN Row not available"}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Type: ${ticket['MBT_TITLE'] ?? "MBT Title not available"}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Checkbox(
                              value: ticket['isselect'] == "true", // Use "true" to represent true and "false" to represent false
                              onChanged: (value) {
                                setState(() {
                                  ticket['isselect'] = value! ? "true" : "false"; // Toggle the value
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomElevatedButton(
                  onTap: () async {
                      setState(() {
                        isLoading = false; // Set isLoading back to false after login completes
                      });
                      await cancelTickets();
                  },
                  text: isLoading ? 'Cancelling...' : 'Cancel Ticket',
                  margin: getMargin(
                    left: 1,
                    top: 30,
                    bottom: 10,
                  ),
                  buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size(
                        double.maxFinite,
                        getVerticalSize(60),
                      ),
                    ),
                  ),
                  buttonTextStyle: CustomTextStyles.titleMediumOnPrimaryContainer18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
