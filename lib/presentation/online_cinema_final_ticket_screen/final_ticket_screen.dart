import 'dart:io';
import 'package:flutter/material.dart';
import 'package:islamabad_club_app/presentation/online_cinema_booking_one_screen/online_cinema_booking_one_screen.dart';
import 'package:islamabad_club_app/presentation/online_cinema_seats_screen/online_cinema_seats_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import '../../core/sharedpreference.dart';
import '../../model/services/media_service.dart';
import '../../routes/app_routes.dart';
import '../../widgets/cinema_ticket.dart';
import '../online_cinema_booking_main_screen/online_cinema_booking_main_screen.dart';
import 'package:fluttertoast/fluttertoast.dart' as ft;
import 'package:image_gallery_saver/image_gallery_saver.dart';
class FinalTicketScreen extends StatefulWidget {
  const FinalTicketScreen();

  @override
  State<FinalTicketScreen> createState() => _TablePageState();
}

class _TablePageState extends State<FinalTicketScreen> {
  bool isLoading = true;
  ScreenshotController screenshotController = ScreenshotController();
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Future<void> fetchData() async{
    await checkRates();
    setState(() {
      isLoading = false;
    });
  }
  MediaService mediaService = MediaService();
  Future<void> checkRates()async {
    Map<String, dynamic> requestBody = {
      'movie_date': selectedDateId,
    };
    try {
      dynamic response = await mediaService.postRequest('get_rates', requestBody);
      if (response['status'] == 'Success') {
        Map<String, dynamic> data = response['data'];
        rateMember = int.parse(data['member_rate']);
        rateGuest = int.parse(data['guest_rate']);
        memberTotal = rateMember * selectedMemberTicket;
        gustTotal = rateGuest * selectedGuestTicket;
      }
    } catch (e) {}
  }
  Future<void> bookingComplete()async {
    Map<String, dynamic> requestBody = {
      'movie_id': selectedMovieId,
      'movie_date': selectedDateId,
      'movie_time': selectedTimeId,
      'member_ticket': selectedMemberTicket,
      'guest_ticket': selectedGuestTicket,
      'seats_selected': selectedSeatList.join(','),
      'USR_SN': SharedData.preferences.getString('userSN'),
    };
    try {
      dynamic response = await mediaService.postRequest('book_tickets', requestBody);
      if (response['status'] == 'Success') {
        print("!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   Booking completed    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@!");
        ft.Fluttertoast.showToast(msg: response['message'], toastLength: ft.Toast.LENGTH_LONG,);
        await _showTicketReceipt(context);
        while(Navigator.canPop(context))
          Navigator.pop(context);
        Navigator.pushNamed(context, AppRoutes.onlineCinemaBookingMainScreen);
      }else{
        ft.Fluttertoast.showToast(
          msg: 'Failed!!!',
          toastLength: ft.Toast.LENGTH_LONG,);
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: ft.Toast.LENGTH_LONG,);
    }
  }

  Future<void> _showTicketReceipt(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Screenshot(
                controller: screenshotController,
                child: CinemaTicketContainer(
                  movieTitle: selectedMovie!,
                  date: selectedDate!,
                  time: selectedTime!,
                  seat: selectedSeatList.join(','),
                  userName: SharedData.preferences.getString('userName')!,
                  userId: SharedData.preferences.getString('userSN')!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0x26BE16FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.58),
                          ),
                        ),
                        onPressed: () async {
                          var capturedImage = await screenshotController.capture();
                          if (capturedImage != null) {
                            final directory = await getTemporaryDirectory();
                            final filePath = '${directory.path}/screenshot.png';
                            final file = File(filePath);
                            await file.writeAsBytes(capturedImage);
                            Share.shareFiles([filePath]);
                          }
                        },
                        child: const Text(
                          'Share',
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              letterSpacing: 0.15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0x26BE16FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.58),
                          ),
                        ),
                        onPressed: () async {
                          var capturedImage = await screenshotController.capture();
                          await ImageGallerySaver.saveImage(capturedImage!);
                          ft.Fluttertoast.showToast(
                            msg: "Image Saved in Gallery!",
                            toastLength: ft.Toast.LENGTH_LONG,);
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              letterSpacing: 0.15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0x26BE16FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.58),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Close',
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              letterSpacing: 0.15),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading? Center(child: CircularProgressIndicator(),)
          :SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 104.08733,
                      height: 41.4507,
                      decoration: BoxDecoration(
                          color: const Color(0x1AFEBD11),
                          border: Border.all(
                            color: const Color(0xFF000000),
                            width: 0.46056,
                          ),
                          borderRadius: BorderRadius.circular(4.61)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            selectedMovie!,
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF000000)),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: Container(
                      width: 110,
                      height: 41.4507,
                      decoration: BoxDecoration(
                          color: const Color(0x1AFEBD11),
                          border: Border.all(
                            color: const Color(0xFF000000),
                            width: 0.46056,
                          ),
                          borderRadius: BorderRadius.circular(4.61)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            selectedDate!,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF000000)),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: Container(
                      width: 104.08733,
                      height: 41.4507,
                      decoration: BoxDecoration(
                          color: const Color(0x1AFEBD11),
                          border: Border.all(
                            color: const Color(0xFF000000),
                            width: 0.46056,
                          ),
                          borderRadius: BorderRadius.circular(4.61)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Total Seats: ${(selectedGuestTicket+selectedMemberTicket).toString()}',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF000000)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: Text(
                  'Selected Seat Numbers :${selectedSeatList.join(',')}',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF000000),
                    letterSpacing: 0.09,
                  ),
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              Table(
                border: TableBorder.all(
                  style: BorderStyle.solid,
                  color: Color(0xFFEDEDED),
                ),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(
                            child: Text(
                              'Type',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                      TableCell(
                        child: Center(
                            child: Text(
                              'Quantity',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                      TableCell(
                        child: Center(
                            child: Text(
                              'Rate',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                      TableCell(
                        child: Center(
                            child: Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(
                            child: Text(
                              'Member Tickets',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                      TableCell(
                        child: Center(
                            child: Text(
                              selectedMemberTicket.toString(),
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                      TableCell(
                        child: Center(
                            child: Text(
                              '$rateMember',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                      TableCell(
                        child: Center(
                            child: Text(
                              '${rateMember * selectedMemberTicket}',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(
                            child: Text(
                              'Guest Ticket',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                      TableCell(
                        child: Center(
                            child: Text(
                              selectedGuestTicket.toString(),
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                      TableCell(
                        child: Center(
                            child: Text(
                              '$rateGuest',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                      TableCell(
                        child: Center(
                            child: Text(
                              '${rateGuest * selectedGuestTicket}',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Center(
                            child: Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                      TableCell(
                        child: Center(
                            child: Text(
                              '',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                      TableCell(
                        child: Center(
                            child: Text(
                              '',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                      TableCell(
                        child: Center(
                            child: Text(
                              '${gustTotal + memberTotal}',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF222222),
                                letterSpacing: 0.03,
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 32.69,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFEBD11),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.58),
                          side: const BorderSide(color: Color(0xFFFEBD11)),
                        ),
                      ),
                      onPressed: () async {
                        await bookingComplete();
                      },
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          letterSpacing: 0.15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.17,
                  ),
                  SizedBox(
                    height: 45,
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF0202),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.58),
                          side: const BorderSide(color: Color(0xFFFF0202)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            letterSpacing: 0.15),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}