import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import 'package:islamabad_club_app/widgets/custom_drop_down.dart';
import 'package:islamabad_club_app/widgets/custom_elevated_button.dart';
import '../../model/movie_model.dart';
import '../../model/services/media_service.dart';

import '../online_cinema_booking_main_screen/online_cinema_booking_main_screen.dart';
String? selectedMovieId;
String? selectedDateId;
String? selectedTimeId;

class OnlineCinemaBookingOneScreen extends StatefulWidget {
  OnlineCinemaBookingOneScreen();

  @override
  _OnlineCinemaBookingOneState createState() => _OnlineCinemaBookingOneState();
}

class _OnlineCinemaBookingOneState extends State<OnlineCinemaBookingOneScreen> {


  Future<void> getMovieTitle() async {
    try {
      MediaService mediaService = MediaService();
      dynamic response = await mediaService.postRequest('movie_title', '');
      if (response['status'] == 'Success') {
        final List<dynamic> data = response['data'];
        dropdownItemListMovies = data.map((json) => Movie.fromJson(json)).toList();
        setState(() {
        });
      } else {
        print("Status: ${response['status']}");
      }
    } catch (e) {
      print("Error in OTP Notification: $e");
    }
  }
  Future<void> getDate(String movieId) async {
    try {
      MediaService mediaService = MediaService();
      Map<String, dynamic> requestBody = {
        'movie_id': movieId,
      };
      dynamic response = await mediaService.postRequest('movie_date', requestBody);
      if (response['status'] == 'Success') {
        dropdownMovieDates = response['data'];
        setState(() {

        });
      } else {
        print("Status: ${response['status']}");
        // Handle the case where status is not 'Success'
      }
    } catch (e) {
      print("Error in GetDate: $e");
    }
  }
  Future<void> getTime(String movieId,String date) async {
    try {
      MediaService mediaService = MediaService();
      Map<String, dynamic> requestBody = {
        'movie_id': movieId,
        'date': date,
      };
      dynamic response = await mediaService.postRequest('movie_time', requestBody);
      if (response['status'] == 'Success') {
        dropdownMovieTimes = response['data'];
        setState(() {
        });
      } else {
        print("Status: ${response['status']}");
        // Handle the case where status is not 'Success'
      }
    } catch (e) {
      print("Error in OTP Notification: $e");
    }
  }
  Future<void> getTicketForMember(String movieId,String date, String timeId) async {
    try {
      MediaService mediaService = MediaService();
      Map<String, dynamic> requestBody = {
        'movie_id': movieId,
        'date': date,
        'time_id': timeId,
      };
      dynamic response = await mediaService.postRequest('movie_tickets_member', requestBody);
      if (response['status'] == 'Success') {
        dropdownItemListMemberTicket = (response['data'] as List).map((item) => item['MX_NO'].toString()).toList();
        setState(() {

        });
      } else {
        print("Status: ${response['status']}");
      }
    } catch (e) {
      print("Error in: $e");
    }
  }
  Future<void> getTicketForGuest(String movieId,String date, String timeId) async {
    try {
      MediaService mediaService = MediaService();
      Map<String, dynamic> requestBody = {
        'movie_id': movieId,
        'time_id': timeId,
        'date': date,
      };
      dynamic response = await mediaService.postRequest('movie_tickets_guest', requestBody);
      if (response['status'] == 'Success') {
        dropdownItemListGuestTicket = (response['data'] as List).map((item) => item['MX_NO'].toString()).toList();
        setState(() {

        });
      } else {
        print("Status: ${response['status']}");
        // Handle the case where status is not 'Success'
      }
    } catch (e) {
      print("Error in: $e");
    }
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  List<Movie> dropdownItemListMovies = [];
  List<String> dropdownItemListGuestTicket = [];
  List<String> dropdownItemListMemberTicket = [];
  List<dynamic> dropdownMovieDates = [];
  List<dynamic> dropdownMovieTimes = [];
  @override
  void initState() {
    super.initState();
    getMovieTitle();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    
    notificationShow(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomDropDown(
                icon: Container(
                  child: CustomImageView(
                    svgPath: ImageConstant.imgArrowdownBlack9000224x24,
                  ),
                ),
                hintText: "Select a Movie",
                textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                items: castListToString(dropdownItemListMovies),
                prefix: Container(
                  child: CustomImageView(svgPath: ImageConstant.imgFilmBlack90002),
                ),
                prefixConstraints: BoxConstraints(maxHeight: getVerticalSize(45)),
                filled: true,
                fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                contentPadding: getPadding(top: 13, bottom: 13),
                width: 200.0, // Increase the width of the dropdown.
                onChanged: (value) {
                  selectedMovie = value;
                  selectedMovieId = dropdownItemListMovies.firstWhere((movie) => movie.mmName == selectedMovie,).mmSn;
                  getDate(selectedMovieId!);
                },
              ),
              CustomDropDown(
                icon: Container(
                  margin: getMargin(left: 30, right: 20),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgArrowdownBlack9000224x24,
                  ),
                ),
                hintText: "Select a Date",
                hintStyle: TextStyle(overflow: TextOverflow.ellipsis),
                margin: getMargin(top: 28),
                textStyle: theme.textTheme.titleSmall,
                items: dropdownMovieDates.map((date) => date['display'] as String).toList(),
                // Convert the dynamic values to strings and use them as items
                prefix: Container(
                  margin: getMargin(left: 20, top: 10, right: 24, bottom: 10),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgCalendarBlack90002,
                  ),
                ),
                prefixConstraints: BoxConstraints(maxHeight: getVerticalSize(45)),
                filled: true,
                fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                contentPadding: getPadding(top: 13, bottom: 13),
                onChanged: (value) {
                  setState(() {
                    selectedDate = value;
                    final selectedDateData = dropdownMovieDates.where((date) => date['display'] == selectedDate).first;
                    selectedDateId = selectedDateData['val'] as String;
                    getTime(selectedMovieId!,selectedDateId!);
                  });
                },
              ),
              CustomDropDown(
                icon: Container(
                  margin: getMargin(left: 30, right: 20),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgArrowdownBlack9000224x24,
                  ),
                ),
                hintText: "Select a Time",
                margin: getMargin(top: 28),
                textStyle: theme.textTheme.titleSmall,
                items: dropdownMovieTimes.map((date) => date['MS_STARTTIME'] as String).toList(),
                prefix: Container(
                  margin: getMargin(left: 20, top: 10, right: 24, bottom: 10),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgCalendarBlack90002,
                  ),
                ),
                prefixConstraints: BoxConstraints(maxHeight: getVerticalSize(45)),
                filled: true,
                fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                contentPadding: getPadding(top: 13, bottom: 13),
                onChanged: (value) {
                  setState(() {
                    selectedTime = value;
                    final selectedDateData = dropdownMovieTimes.where((date) => date['MS_STARTTIME'] == selectedTime).first;
                    selectedTimeId = selectedDateData['MS_SN'] as String;
                    getTicketForGuest(selectedMovieId!,selectedDateId!,selectedTimeId!);
                    getTicketForMember(selectedMovieId!,selectedDateId!,selectedTimeId!);
                  });
                },
              ),
              Padding(
                padding: getPadding(top: 27),
                child: Text(
                  "Member Tickets",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.titleSmallSemiBold_1.copyWith(
                    letterSpacing: getHorizontalSize(0.12),
                  ),
                ),
              ),
              CustomDropDown(
                icon: Container(
                  margin: getMargin(left: 30, right: 20),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgArrowdownBlack9000224x24,
                  ),
                ),
                hintText: "Select Quantity",
                margin: getMargin(top: 10),
                textStyle: theme.textTheme.titleSmall,
                items: dropdownItemListMemberTicket,
                prefix: Container(
                  margin: getMargin(left: 20, top: 10, right: 24, bottom: 10),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIconsaxLinearTicketdiscount,
                  ),
                ),
                prefixConstraints: BoxConstraints(maxHeight: getVerticalSize(45)),
                filled: true,
                fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                contentPadding: getPadding(top: 13, bottom: 13),
                onChanged: (value) {
                  setState(() {
                    selectedMemberTicket = int.parse(value);
                  });
                },
              ),
              Padding(
                padding: getPadding(top: 27),
                child: Text(
                  "Guest Tickets",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.titleSmallSemiBold_1.copyWith(
                    letterSpacing: getHorizontalSize(0.12),
                  ),
                ),
              ),
              CustomDropDown(
                icon: Container(
                  margin: getMargin(left: 30, right: 20),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgArrowdownBlack9000224x24,
                  ),
                ),
                hintText: "Select Quantity",
                margin: getMargin(top: 10),
                textStyle: theme.textTheme.titleSmall,
                items: dropdownItemListGuestTicket,
                prefix: Container(
                  margin: getMargin(left: 20, top: 10, right: 24, bottom: 10),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIconsaxLinearTicketdiscount,
                  ),
                ),
                prefixConstraints: BoxConstraints(maxHeight: getVerticalSize(45)),
                filled: true,
                fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                contentPadding: getPadding(top: 13, bottom: 13),
                onChanged: (value) {
                  setState(() {
                    selectedGuestTicket = int.parse(value);
                  });
                },
              ),
              CustomElevatedButton(
                onTap: (){
                  if(selectedTime !=null && selectedDate !=null &&
                      selectedMovie != null && selectedMemberTicket !=null && selectedGuestTicket !=null)
                    Navigator.pushNamed(context, AppRoutes.onlineCinemaSeatsScreen);
                },
                text: "Search".toUpperCase(),
                margin: getMargin(top: 75, bottom: 5),
                buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(double.maxFinite, getVerticalSize(60)),
                  ),
                ),
                buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryContainer,
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(onChanged: (BottomBarEnum type) {
          Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
        }),
      ),
    );
  }

  /// Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreenPage;
      default:
        return "/";
    }
  }

  /// Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeScreenPage:
        return HomeScreenPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
