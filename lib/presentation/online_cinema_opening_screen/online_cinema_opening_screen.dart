import 'package:flutter/material.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/utils.dart';
import '../../model/services/media_service.dart';
import '../../routes/app_routes.dart';

import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../home_screen_page/home_screen_page.dart';
import 'package:fluttertoast/fluttertoast.dart' as ft;

class OnlineCinemaOpeningScreen extends StatefulWidget {
  @override
  _OnlineFoodScreenState createState() => _OnlineFoodScreenState();
}
class _OnlineFoodScreenState extends State<OnlineCinemaOpeningScreen> {

  @override
  void initState() {
    super.initState();
    fatchData();
  }
  Future<void> fatchData() async {
    await loadItem();
    setState(() {
      isLoading = false;
    });
  }
  Future<void> loadItem() async {
    try{
      MediaService mediaService = MediaService();
      dynamic response = await mediaService.postRequest('single_item_details',"");
      print("Response Map: $response");  // Print the entire response map
      print("Status: ${response['status']}");
      if (response['status'] == 'Success') {
        movieTitles = response['data'];
        setState(() {
        });

      }else{

        ft.Fluttertoast.showToast(
          msg: response['message'],
          toastLength: ft.Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: ft.Toast.LENGTH_SHORT,
      );
    }
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  bool isLoading = false;
  List<String> movieTitles = [];

  @override
  Widget build(BuildContext context) {
    
    notificationShow(context);
    onTapArrowleft(BuildContext context) {
      Navigator.pop(context);
    }
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
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
          title: AppbarSubtitle(text: "Online Cinema Booking"),
          actions: [
            AppbarStack1(
                margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
          ]),
      resizeToAvoidBottomInset: false,
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(), // Show indicator while loading
      )
          : Column(
        children: [
          Positioned(
            left: 30,
            top: 30,
            child: Container(
              width: 327,
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.50, color: Color(0xFFD6D6D6)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                child: Stack(children: [

                                ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      child: Text(
                        'Search ',
                        style: TextStyle(
                          color: Color(0xFF878787),
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 1.50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFEBD11),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: IconButton(
                      onPressed: () {
                      },
                      icon: Icon(Icons.search, color: Colors.white,), ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 100),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: 909, // Adjust the width as needed
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieTitles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 24 : 0, right: 16),
                    child: Container(
                        width: 295,
                        height: 300,
                        child: Stack(
                          children: [
                            // Image Container
                            Container(
                              width: 295,
                              height: 154,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://i.ytimg.com/vi/8EPJiFfWRfw/maxresdefault.jpg"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x51000000),
                                    blurRadius: 32,
                                    offset: Offset(8, 8),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                            ),
                            // Gradient Overlay
                            Opacity(
                              opacity: 0.32,
                              child: Container(
                                width: 295,
                                height: 154,
                                decoration: ShapeDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(-0.00, -1.00),
                                    end: Alignment(0, 1),
                                    colors: [Color(0x33101011), Color(0xFF101011)],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment:  Alignment.center,
                              child:
                              SizedBox(
                                child:
                                Container(
                                  constraints:  BoxConstraints (
                                    maxWidth:  211,
                                  ),
                                  child:
                                  Text(
                                    "movieTitles[index]",
                                    style:  SafeGoogleFont (
                                      'Montserrat',
                                      fontSize:  16,
                                      fontWeight:  FontWeight.w600,
                                      height:  10,
                                      letterSpacing:  0.1199999973,
                                      color:  Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
      CustomBottomBar(onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      }),
    );
  }
}

///Handling route based on bottom click actions
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