import 'package:fluttertoast/fluttertoast.dart' as ft;
import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/model/services/media_service.dart';
import 'package:islamabad_club_app/model/statement_of_account_model.dart';
import 'package:islamabad_club_app/presentation/feedback_management_one_screen/feedback_management_one_screen.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_iconbutton.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_stack_1.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:islamabad_club_app/widgets/app_bar/custom_app_bar.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import '../../core/sharedpreference.dart';
class MemberPortalFiveScreen extends StatefulWidget {
  @override
  _MemberPortalFiveScreenState createState() => _MemberPortalFiveScreenState();
}

class _MemberPortalFiveScreenState extends State<MemberPortalFiveScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  MediaService mediaService = MediaService();
  StatementOfAccountModel info = StatementOfAccountModel();
  double _total = 0.00;

  @override
  void initState() {
    super.initState();
    initializeInfo();
  }

  Future<void> initializeInfo() async {
    info = await fetchData();
    _total = double.parse(info.data![info.data!.length-1].bal!)
        +double.parse(info.data![info.data!.length-1].dr!)
        -double.parse(info.data![info.data!.length-1].cr!);
    setState(() {});
  }

  Future<StatementOfAccountModel> fetchData() async {
    try {
      Map<String, dynamic> requestBody = {
        'USR_REF': SharedData.preferences.getString('userSN')!
      };
      dynamic response =
      await mediaService.postRequest('soa', requestBody);
      if (response['data'] == null) {
        ft.Fluttertoast.showToast(
            msg: response['message'], toastLength: ft.Toast.LENGTH_LONG);
        return StatementOfAccountModel();
      } else {
        return StatementOfAccountModel.fromJson(response);
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
          msg: "Check Your Internet Connection!",
          toastLength: ft.Toast.LENGTH_LONG);
      return StatementOfAccountModel();
    }
  }

  @override
  Widget build(BuildContext context) {
    notificationShow(context);
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
            },
          ),
          centerTitle: true,
          title: AppbarSubtitle(text: "Statement of Accounts"),
          actions: [
            AppbarStack1(
              margin: getMargin(left: 24, top: 8, right: 24, bottom: 8),
            ),
          ],
        ),
        body: info.data?.isEmpty ?? true
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Month",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4B0606),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Debit",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Credit",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Balance",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Statement of Account Items
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: info.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final singleItem = info.data?[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Align text left
                        children: [
                          // Balance Line
                          Row(
                            children: [
                              Expanded(child: SizedBox()), // Empty cell for "Month"
                              Expanded(child: SizedBox()), // Empty cell for "Debit"
                              Expanded(child: SizedBox()), // Empty cell for "Credit"
                              Expanded(
                                child: Text(
                                  singleItem?.bal ?? "",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Debit and Credit Line
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  singleItem?.month ?? "",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  singleItem?.dr ?? "",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  singleItem?.cr ?? "",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Expanded(child: SizedBox()), // Empty cell for "Balance"
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 46, 0),
                  child: Text("$_total",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B0606),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(onChanged: (BottomBarEnum type) {
          Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
        }),
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
}