import 'package:flutter/material.dart';
import 'package:islamabad_club_app/model/services/media_service.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/movie_model.dart';
import '../../routes/app_routes.dart';

import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import '../online_cinema_booking_one_screen/online_cinema_booking_one_screen.dart';

class OnlineCinemaBookingMainScreen extends StatefulWidget {
  const OnlineCinemaBookingMainScreen();

  @override
  State<OnlineCinemaBookingMainScreen> createState() => _BookingAppState();
}

class _BookingAppState extends State<OnlineCinemaBookingMainScreen> {
  MediaService mediaService = MediaService();
  bool isLoading = true;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  List<Movie> dropdownItemListMovies = [];
  List<String> dropdownItemListGuestTicket = [];
  List<String> dropdownItemListMemberTicket = [];
  List<dynamic> dropdownMovieDates = [];
  List<dynamic> dropdownMovieTimes = [];

  @override
  void initState() {
    super.initState();
    fatchData();
  }
  Future<void> fatchData()async {
    await getMovieTitle();
    setState(() {
      isLoading = false;
    });
  }
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
        body:isLoading
            ? Center(
          child: CircularProgressIndicator(), // Show indicator while loading
        )
            : SingleChildScrollView(
            child: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (var movie in dropdownItemListMovies)
                                    InkWell(
                                      onTap: () {
                                        detailsMovie = movie;
                                        //Navigator.pushNamed(context, AppRoutes.onlineCinemaBookingDetailsScreen);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 330,
                                          height: 140, // Adjust the height to fit the image and title
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            image: DecorationImage(
                                              image: NetworkImage(movie.mmTitleImg), // Replace with your image URL
                                              fit: BoxFit.cover, // You can adjust the fit as needed
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 82), // Add spacing between the image and title
                                              Text(
                                                movie.mmName,
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  shadows: [
                                                    Shadow(
                                                      color: Colors.black,
                                                      offset: Offset(2.0, 2.0), // Adjust the offset as needed
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            CustomDropDown(
                              icon: Container(
                                margin: getMargin(left: 30, right: 20),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowdownBlack9000224x24,
                                ),
                              ),
                              hintText: "Select a Movie",
                              hintStyle: TextStyle(overflow: TextOverflow.ellipsis),
                              margin: getMargin(top: 28),
                              items: castListToString(dropdownItemListMovies),
                              prefix: Container(
                                margin: getMargin(left: 20, top: 10, right: 24, bottom: 10),
                                child: CustomImageView(svgPath: ImageConstant.imgFilmBlack90002),
                              ),
                              prefixConstraints: BoxConstraints(maxHeight: getVerticalSize(45)),
                              filled: true,
                              fillColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                              contentPadding: getPadding(top: 13, bottom: 13),
                              onChanged: (value) {
                                selectedDate = '';
                                selectedTime = '';
                                selectedGuestTicket = 0;
                                selectedMemberTicket = 0;
                                dropdownMovieDates = [];
                                dropdownMovieTimes = [];
                                dropdownItemListGuestTicket = [];
                                dropdownItemListMemberTicket = [];
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
                                selectedTime = '';
                                selectedGuestTicket = 0;
                                selectedMemberTicket = 0;
                                dropdownMovieTimes = [];
                                dropdownItemListGuestTicket = [];
                                dropdownItemListMemberTicket = [];
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
                                selectedGuestTicket = 0;
                                selectedMemberTicket = 0;
                                dropdownItemListGuestTicket = [];
                                dropdownItemListMemberTicket = [];
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
                                    selectedMovie != null && (selectedMemberTicket != 0 || selectedGuestTicket != 0))
                                  Navigator.pushNamed(context, AppRoutes.onlineCinemaSeatsScreen);
                              },
                              text: "Search".toUpperCase(),
                              margin: getMargin(top: 40, bottom: 5),
                              buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                                fixedSize: MaterialStateProperty.all<Size>(
                                  Size(double.maxFinite, getVerticalSize(60)),
                                ),
                              ),
                              buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryContainer,
                            ),
                          ]),
                    )))));
  }
}


String? selectedMovie;
String? selectedDate;
String? selectedTime;
int selectedMemberTicket = 0;
int selectedGuestTicket = 0;
Movie detailsMovie = Movie(mmSn: "mmSn", mmName: "mmName", mmRemarks: "mmRemarks", mmTitleImg: "mmTitleImg");
int rateMember = 0;
int rateGuest = 0;
int gustTotal = 0;
int memberTotal = 0;