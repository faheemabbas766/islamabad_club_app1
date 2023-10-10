import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:islamabad_club_app/model/services/media_service.dart';
import 'package:islamabad_club_app/presentation/online_cinema_booking_one_screen/online_cinema_booking_one_screen.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import 'package:fluttertoast/fluttertoast.dart' as ft;
import '../../widgets/custom_elevated_button.dart';
import '../online_cinema_booking_main_screen/online_cinema_booking_main_screen.dart';
List<String> selectedSeatList = [];
class SeatsScreen extends StatefulWidget {
  const SeatsScreen();
  @override
  State<SeatsScreen> createState() => _SeatsScreenState();
}

class _SeatsScreenState extends State<SeatsScreen> {
  bool loading = true;
  String status = 'A';
  List<dynamic> seatsList = [];
  MediaService mediaService = MediaService();
  final int _duration = 301;
  final CountDownController _controller = CountDownController();
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Future<void> fetchData() async {
    selectedSeatList = [];
    await getAllSeatsUpdate();
    setState(() {
      loading = false;
    });
  }
  String getValueForKey(String key, List<dynamic> data) {
    for (var item in data) {
      if (item is Map<String, dynamic> && item.containsKey(key)) {
        return item[key];
      }
    }
    return '';
  }
  Future<void> getAllSeatsUpdate()async {
    Map<String, dynamic> requestBody = {
      'movie_id': selectedMovieId,
      'date': selectedDateId,
      'time_id': selectedTimeId
    };
    try {
      dynamic response = await mediaService.postRequest('get_show_seats', requestBody);
      if (response['status'] == 'Success') {
        for (var item in response['data']) {
          seatsList.add(item);
        }
      }
    }catch(e){
      ft.Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: ft.Toast.LENGTH_LONG,);
    }

    setState(() {
      loading = false;
    });
  }
  Future<void> checkStatus(String seat)async {
    if (selectedSeatList.contains(seat)) {
      status = 'R';
      selectedSeatList.remove(seat);
    } else {
      status = 'A';
      if(selectedSeatList.length < (selectedGuestTicket+ selectedMemberTicket))
        selectedSeatList.add(seat);
      else{
        ft.Fluttertoast.showToast(
          msg: "Selected Seats are Completed!! You can't hold more seats.",
          toastLength: ft.Toast.LENGTH_LONG,);
        return;
      }
    }
    setState(() {
    });
    Map<String, dynamic> requestBody = {
      'seat_no': seat,
      'movie_id': selectedMovieId,
      'movie_time': selectedTimeId,
      'movie_date': selectedDateId,
      'select_status': status,
    };
    try {
      dynamic response = await mediaService.postRequest('set_status', requestBody);
      print("Response Map: $response"); // Print the entire response map
      print("Status: ${response['status']}");
      if(response['code'] == 102){
        ft.Fluttertoast.showToast(
          msg: response['message'],
          toastLength: ft.Toast.LENGTH_LONG,);
      }
      if(response['code'] == 101) {
        ft.Fluttertoast.showToast(
          msg: response['message'],
          toastLength: ft.Toast.LENGTH_LONG,);
      }

    }catch(e){
      ft.Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: ft.Toast.LENGTH_LONG,);
    }
  }
  Widget customContainer(bool isGreen,String text) {
    return InkWell(
      onTap: () async {
        print("button pressed: "+text);
        if(isGreen){
          await checkStatus(text);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 30,
          width: 35,
          decoration: BoxDecoration(
            border: Border.all(
              color: selectedSeatList.contains(text)
                  ? Colors.orange
                  : isGreen
                  ? Colors.blue
                  : Colors.red,
              width: 1.5,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14, // Adjust the seat number size
                    color: isGreen ? Colors.blue : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: new Text('Are you sure?'),
          content: new Text('Do you want to go back an App'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
              child: new Text('No'),
            ),
            TextButton(
              onPressed: () async {
                for(int i=0; i<selectedSeatList.length;i++){
                  Map<String, dynamic> requestBody = {
                    'seat_no': selectedSeatList[i],
                    'movie_id': selectedMovieId,
                    'movie_time': selectedTimeId,
                    'movie_date': selectedDateId,
                    'select_status': 'R',
                  };
                  try {
                    await mediaService.postRequest('set_status', requestBody);
                  }catch(e){
                  }
                }
                Navigator.of(context).pop(true);
              },
              child: new Text('Yes'),
            ),
          ],
        ),
      )) ??
          false;
    }
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          body: loading? Center(child: CircularProgressIndicator(),)
              :SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularCountDownTimer(
                    duration: _duration,
                    initialDuration: 0,
                    controller: _controller,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 6,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 6,
                    ringColor: Colors.grey[300]!,
                    ringGradient: null,
                    fillColor: Colors.red,
                    fillGradient: null,
                    backgroundColor: Colors.amber[500],
                    backgroundGradient: null,
                    strokeWidth: 8.0,
                    strokeCap: StrokeCap.round,
                    textStyle: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),

                    textFormat: CountdownTextFormat.S,
                    isReverse: true,
                    isReverseAnimation: true,
                    isTimerTextShown: true,
                    autoStart: true,
                    onStart: () {
                      debugPrint('Countdown Started');
                    },
                    onComplete: () async {
                      for(int i=0; i<selectedSeatList.length;i++){
                        Map<String, dynamic> requestBody = {
                          'seat_no': selectedSeatList[i],
                          'movie_id': selectedMovieId,
                          'movie_time': selectedTimeId,
                          'movie_date': selectedDateId,
                          'select_status': 'R',
                        };
                        try {
                          await mediaService.postRequest('set_status', requestBody);
                        }catch(e){
                        }
                      }
                      Navigator.of(context).pop(true);
                      ft.Fluttertoast.showToast(
                        msg: "Session Time Out!!!",
                        toastLength: ft.Toast.LENGTH_LONG,);
                    },
                    onChange: (String timeStamp) {
                      debugPrint('Countdown Changed $timeStamp');
                    },
                    timeFormatterFunction: (defaultFormatterFunction, duration) {
                        return Function.apply(defaultFormatterFunction, [duration]);
                    },
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            selectedMovie!,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 1, // Width of the separator line
                            color: Colors.black, // Color of the separator line
                            height: 20, // Height of the separator line (adjust as needed)
                            margin: EdgeInsets.symmetric(horizontal: 16), // Adjust margin as needed
                          ),
                          Text(
                            selectedDate!,
                            style: TextStyle(fontSize: 14),
                          ),
                          Container(
                            width: 1, // Width of the separator line
                            color: Colors.black, // Color of the separator line
                            height: 20, // Height of the separator line (adjust as needed)
                            margin: EdgeInsets.symmetric(horizontal: 16), // Adjust margin as needed
                          ),
                          Text(
                            selectedTime!,
                            style: TextStyle(fontSize: 14),
                          ),
                          Container(
                            width: 1, // Width of the separator line
                            color: Colors.black, // Color of the separator line
                            height: 20, // Height of the separator line (adjust as needed)
                            margin: EdgeInsets.symmetric(horizontal: 16), // Adjust margin as needed
                          ),
                          Text(
                            'Total Seats: ${selectedMemberTicket+selectedGuestTicket}',
                            style: TextStyle(fontSize: 14),
                          ),
                          Container(
                            width: 1, // Width of the separator line
                            color: Colors.black, // Color of the separator line
                            height: 20, // Height of the separator line (adjust as needed)
                            margin: EdgeInsets.symmetric(horizontal: 16), // Adjust margin as needed
                          ),
                          Column(
                            children: [
                              BoxWithStatus(
                                color: Colors.blue,
                                statusText: 'Available',
                              ),
                              BoxWithStatus(
                                color: Colors.orange,
                                statusText: 'Selected',
                              ),
                              BoxWithStatus(
                                color: Colors.red,
                                statusText: 'Reserved',
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 600,
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              border: Border.all(width: 2),
                            ),
                            child: Text("Screen",style: TextStyle(
                              fontSize: 20,
                            ), textAlign: TextAlign.center,
                            ),
                          ),
                          Row(
                            children: [
                              customContainer(getValueForKey('N1', seatsList)=='A'? true: false, 'N1'),
                              customContainer(getValueForKey('N2', seatsList)=='A'? true: false, 'N2'),
                              customContainer(getValueForKey('N3', seatsList)=='A'? true: false, 'N3'),
                              customContainer(getValueForKey('N4', seatsList)=='A'? true: false, 'N4'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('N5', seatsList)=='A'? true: false, 'N5'),
                              customContainer(getValueForKey('N6', seatsList)=='A'? true: false, 'N6'),
                              customContainer(getValueForKey('N7', seatsList)=='A'? true: false, 'N7'),
                              customContainer(getValueForKey('N8', seatsList)=='A'? true: false, 'N8'),
                              customContainer(getValueForKey('N9', seatsList)=='A'? true: false, 'N9'),
                              customContainer(getValueForKey('N10', seatsList)=='A'? true: false, 'N10'),
                              customContainer(getValueForKey('N11', seatsList)=='A'? true: false, 'N11'),
                              customContainer(getValueForKey('N12', seatsList)=='A'? true: false, 'N12'),
                              customContainer(getValueForKey('N13', seatsList)=='A'? true: false, 'N13'),
                              customContainer(getValueForKey('N14', seatsList)=='A'? true: false, 'N14'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('N15', seatsList)=='A'? true: false, 'N15'),
                              customContainer(getValueForKey('N16', seatsList)=='A'? true: false, 'N16'),
                              customContainer(getValueForKey('N17', seatsList)=='A'? true: false, 'N17'),
                              customContainer(getValueForKey('N18', seatsList)=='A'? true: false, 'N18'),
                            ],
                          ),
                          Row(
                            children: [
                              customContainer(getValueForKey('M1', seatsList)=='A'? true: false, 'M1'),
                              customContainer(getValueForKey('M2', seatsList)=='A'? true: false, 'M2'),
                              customContainer(getValueForKey('M3', seatsList)=='A'? true: false, 'M3'),
                              customContainer(getValueForKey('M4', seatsList)=='A'? true: false, 'M4'),
                              customContainer(getValueForKey('M5', seatsList)=='A'? true: false, 'M5'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('M6', seatsList)=='A'? true: false, 'M6'),
                              customContainer(getValueForKey('M7', seatsList)=='A'? true: false, 'M7'),
                              customContainer(getValueForKey('M8', seatsList)=='A'? true: false, 'M8'),
                              customContainer(getValueForKey('M9', seatsList)=='A'? true: false, 'M9'),
                              customContainer(getValueForKey('M10', seatsList)=='A'? true: false, 'M10'),
                              customContainer(getValueForKey('M11', seatsList)=='A'? true: false, 'M11'),
                              customContainer(getValueForKey('M12', seatsList)=='A'? true: false, 'M12'),
                              customContainer(getValueForKey('M13', seatsList)=='A'? true: false, 'M13'),
                              customContainer(getValueForKey('M14', seatsList)=='A'? true: false, 'M14'),
                              customContainer(getValueForKey('M15', seatsList)=='A'? true: false, 'M15'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('M16', seatsList)=='A'? true: false, 'M16'),
                              customContainer(getValueForKey('M17', seatsList)=='A'? true: false, 'M17'),
                              customContainer(getValueForKey('M18', seatsList)=='A'? true: false, 'M18'),
                              customContainer(getValueForKey('M19', seatsList)=='A'? true: false, 'M19'),
                              customContainer(getValueForKey('M20', seatsList)=='A'? true: false, 'M20'),
                            ],
                          ),
                          Row(
                            children: [
                              customContainer(getValueForKey('L1', seatsList)=='A'? true: false, 'L1'),
                              customContainer(getValueForKey('L2', seatsList)=='A'? true: false, 'L2'),
                              customContainer(getValueForKey('L3', seatsList)=='A'? true: false, 'L3'),
                              customContainer(getValueForKey('L4', seatsList)=='A'? true: false, 'L4'),
                              customContainer(getValueForKey('L5', seatsList)=='A'? true: false, 'L5'),
                              SizedBox(width: 40),

                              customContainer(getValueForKey('L6', seatsList)=='A'? true: false, 'L6'),
                              customContainer(getValueForKey('L7', seatsList)=='A'? true: false, 'L7'),
                              customContainer(getValueForKey('L8', seatsList)=='A'? true: false, 'L8'),
                              customContainer(getValueForKey('L9', seatsList)=='A'? true: false, 'L9'),
                              customContainer(getValueForKey('L10', seatsList)=='A'? true: false, 'L10'),
                              customContainer(getValueForKey('L11', seatsList)=='A'? true: false, 'L11'),
                              customContainer(getValueForKey('L12', seatsList)=='A'? true: false, 'L12'),
                              customContainer(getValueForKey('L13', seatsList)=='A'? true: false, 'L13'),
                              customContainer(getValueForKey('L14', seatsList)=='A'? true: false, 'L14'),
                              customContainer(getValueForKey('L15', seatsList)=='A'? true: false, 'L15'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('L16', seatsList)=='A'? true: false, 'L16'),
                              customContainer(getValueForKey('L17', seatsList)=='A'? true: false, 'L17'),
                              customContainer(getValueForKey('L18', seatsList)=='A'? true: false, 'L18'),
                              customContainer(getValueForKey('L19', seatsList)=='A'? true: false, 'L19'),
                              customContainer(getValueForKey('L20', seatsList)=='A'? true: false, 'L20'),
                            ],
                          ),
                          Row(
                            children: [
                              customContainer(getValueForKey('K1', seatsList)=='A'? true: false, 'K1'),
                              customContainer(getValueForKey('K2', seatsList)=='A'? true: false, 'K2'),
                              customContainer(getValueForKey('K3', seatsList)=='A'? true: false, 'K3'),
                              customContainer(getValueForKey('K4', seatsList)=='A'? true: false, 'K4'),
                              customContainer(getValueForKey('K5', seatsList)=='A'? true: false, 'K5'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('K6', seatsList)=='A'? true: false, 'K6'),
                              customContainer(getValueForKey('K7', seatsList)=='A'? true: false, 'K7'),
                              customContainer(getValueForKey('K8', seatsList)=='A'? true: false, 'K8'),
                              customContainer(getValueForKey('K9', seatsList)=='A'? true: false, 'K9'),
                              customContainer(getValueForKey('K10', seatsList)=='A'? true: false, 'K10'),
                              customContainer(getValueForKey('K11', seatsList)=='A'? true: false, 'K11'),
                              customContainer(getValueForKey('K12', seatsList)=='A'? true: false, 'K12'),
                              customContainer(getValueForKey('K13', seatsList)=='A'? true: false, 'K13'),
                              customContainer(getValueForKey('K14', seatsList)=='A'? true: false, 'K14'),
                              customContainer(getValueForKey('K15', seatsList)=='A'? true: false, 'K15'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('K16', seatsList)=='A'? true: false, 'K16'),
                              customContainer(getValueForKey('K17', seatsList)=='A'? true: false, 'K17'),
                              customContainer(getValueForKey('K18', seatsList)=='A'? true: false, 'K18'),
                              customContainer(getValueForKey('K19', seatsList)=='A'? true: false, 'K19'),
                              customContainer(getValueForKey('K20', seatsList)=='A'? true: false, 'K20'),
                            ],
                          ),
                          Row(
                            children: [
                              customContainer(getValueForKey('J1', seatsList)=='A'? true: false, 'J1'),
                              customContainer(getValueForKey('J2', seatsList)=='A'? true: false, 'J2'),
                              customContainer(getValueForKey('J3', seatsList)=='A'? true: false, 'J3'),
                              customContainer(getValueForKey('J4', seatsList)=='A'? true: false, 'J4'),
                              customContainer(getValueForKey('J5', seatsList)=='A'? true: false, 'J5'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('J6', seatsList)=='A'? true: false, 'J6'),
                              customContainer(getValueForKey('J7', seatsList)=='A'? true: false, 'J7'),
                              customContainer(getValueForKey('J8', seatsList)=='A'? true: false, 'J8'),
                              customContainer(getValueForKey('J9', seatsList)=='A'? true: false, 'J9'),
                              customContainer(getValueForKey('J10', seatsList)=='A'? true: false, 'J10'),
                              customContainer(getValueForKey('J11', seatsList)=='A'? true: false, 'J11'),
                              customContainer(getValueForKey('J12', seatsList)=='A'? true: false, 'J12'),
                              customContainer(getValueForKey('J13', seatsList)=='A'? true: false, 'J13'),
                              customContainer(getValueForKey('J14', seatsList)=='A'? true: false, 'J14'),
                              customContainer(getValueForKey('J15', seatsList)=='A'? true: false, 'J15'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('J16', seatsList)=='A'? true: false, 'J16'),
                              customContainer(getValueForKey('J17', seatsList)=='A'? true: false, 'J17'),
                              customContainer(getValueForKey('J18', seatsList)=='A'? true: false, 'J18'),
                              customContainer(getValueForKey('J19', seatsList)=='A'? true: false, 'J19'),
                              customContainer(getValueForKey('J20', seatsList)=='A'? true: false, 'J20'),
                            ],
                          ),
                          Row(
                            children: [
                              customContainer(getValueForKey('I1', seatsList)=='A'? true: false, 'I1'),
                              customContainer(getValueForKey('I2', seatsList)=='A'? true: false, 'I2'),
                              customContainer(getValueForKey('I3', seatsList)=='A'? true: false, 'I3'),
                              customContainer(getValueForKey('I4', seatsList)=='A'? true: false, 'I4'),
                              customContainer(getValueForKey('I5', seatsList)=='A'? true: false, 'I5'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('I6', seatsList)=='A'? true: false, 'I6'),
                              customContainer(getValueForKey('I7', seatsList)=='A'? true: false, 'I7'),
                              customContainer(getValueForKey('I8', seatsList)=='A'? true: false, 'I8'),
                              customContainer(getValueForKey('I9', seatsList)=='A'? true: false, 'I9'),
                              customContainer(getValueForKey('I10', seatsList)=='A'? true: false, 'I10'),
                              customContainer(getValueForKey('I11', seatsList)=='A'? true: false, 'I11'),
                              customContainer(getValueForKey('I12', seatsList)=='A'? true: false, 'I12'),
                              customContainer(getValueForKey('I13', seatsList)=='A'? true: false, 'I13'),
                              customContainer(getValueForKey('I14', seatsList)=='A'? true: false, 'I14'),
                              customContainer(getValueForKey('I15', seatsList)=='A'? true: false, 'I15'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('I16', seatsList)=='A'? true: false, 'I16'),
                              customContainer(getValueForKey('I17', seatsList)=='A'? true: false, 'I17'),
                              customContainer(getValueForKey('I18', seatsList)=='A'? true: false, 'I18'),
                              customContainer(getValueForKey('I19', seatsList)=='A'? true: false, 'I19'),
                              customContainer(getValueForKey('I20', seatsList)=='A'? true: false, 'I20'),
                            ],
                          ),
                          Row(
                            children: [
                              customContainer(getValueForKey('H1', seatsList)=='A'? true: false, 'H1'),
                              customContainer(getValueForKey('H2', seatsList)=='A'? true: false, 'H2'),
                              customContainer(getValueForKey('H3', seatsList)=='A'? true: false, 'H3'),
                              customContainer(getValueForKey('H4', seatsList)=='A'? true: false, 'H4'),
                              customContainer(getValueForKey('H5', seatsList)=='A'? true: false, 'H5'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('H6', seatsList)=='A'? true: false, 'H6'),
                              customContainer(getValueForKey('H7', seatsList)=='A'? true: false, 'H7'),
                              customContainer(getValueForKey('H8', seatsList)=='A'? true: false, 'H8'),
                              customContainer(getValueForKey('H9', seatsList)=='A'? true: false, 'H9'),
                              customContainer(getValueForKey('H10', seatsList)=='A'? true: false, 'H10'),
                              customContainer(getValueForKey('H11', seatsList)=='A'? true: false, 'H11'),
                              customContainer(getValueForKey('H12', seatsList)=='A'? true: false, 'H12'),
                              customContainer(getValueForKey('H13', seatsList)=='A'? true: false, 'H13'),
                              customContainer(getValueForKey('H14', seatsList)=='A'? true: false, 'H14'),
                              customContainer(getValueForKey('H15', seatsList)=='A'? true: false, 'H15'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('H16', seatsList)=='A'? true: false, 'H16'),
                              customContainer(getValueForKey('H17', seatsList)=='A'? true: false, 'H17'),
                              customContainer(getValueForKey('H18', seatsList)=='A'? true: false, 'H18'),
                              customContainer(getValueForKey('H19', seatsList)=='A'? true: false, 'H19'),
                              customContainer(getValueForKey('H20', seatsList)=='A'? true: false, 'H20'),
                            ],
                          ),
                          Row(
                            children: [
                              customContainer(getValueForKey('G1', seatsList)=='A'? true: false, 'G1'),
                              customContainer(getValueForKey('G2', seatsList)=='A'? true: false, 'G2'),
                              customContainer(getValueForKey('G3', seatsList)=='A'? true: false, 'G3'),
                              SizedBox(width: 185),
                              customContainer(getValueForKey('G4', seatsList)=='A'? true: false, 'G4'),
                              customContainer(getValueForKey('G5', seatsList)=='A'? true: false, 'G5'),
                              customContainer(getValueForKey('G6', seatsList)=='A'? true: false, 'G6'),
                              customContainer(getValueForKey('G7', seatsList)=='A'? true: false, 'G7'),
                              customContainer(getValueForKey('G8', seatsList)=='A'? true: false, 'G8'),
                              customContainer(getValueForKey('G9', seatsList)=='A'? true: false, 'G9'),
                              SizedBox(width: 185),
                              customContainer(getValueForKey('G10', seatsList)=='A'? true: false, 'G10'),
                              customContainer(getValueForKey('G11', seatsList)=='A'? true: false, 'G11'),
                              customContainer(getValueForKey('G12', seatsList)=='A'? true: false, 'G12'),
                            ],
                          ),
                          Row(
                            children: [
                              customContainer(getValueForKey('F1', seatsList)=='A'? true: false, 'F1'),
                              customContainer(getValueForKey('F2', seatsList)=='A'? true: false, 'F2'),
                              customContainer(getValueForKey('F3', seatsList)=='A'? true: false, 'F3'),
                              SizedBox(width: 185),
                              customContainer(getValueForKey('F4', seatsList)=='A'? true: false, 'F4'),
                              customContainer(getValueForKey('F5', seatsList)=='A'? true: false, 'F5'),
                              customContainer(getValueForKey('F6', seatsList)=='A'? true: false, 'F6'),
                              customContainer(getValueForKey('F7', seatsList)=='A'? true: false, 'F7'),
                              customContainer(getValueForKey('F8', seatsList)=='A'? true: false, 'F8'),
                              customContainer(getValueForKey('F9', seatsList)=='A'? true: false, 'F9'),
                              SizedBox(width: 185),
                              customContainer(getValueForKey('F10', seatsList)=='A'? true: false, 'F10'),
                              customContainer(getValueForKey('F11', seatsList)=='A'? true: false, 'F11'),
                              customContainer(getValueForKey('F12', seatsList)=='A'? true: false, 'F12'),
                            ],
                          ),
                          Row(
                            children: [
                              customContainer(getValueForKey('E1', seatsList)=='A'? true: false, 'E1'),
                              customContainer(getValueForKey('E2', seatsList)=='A'? true: false, 'E2'),
                              customContainer(getValueForKey('E3', seatsList)=='A'? true: false, 'E3'),
                              SizedBox(width: 185),

                              customContainer(getValueForKey('E4', seatsList)=='A'? true: false, 'E4'),
                              customContainer(getValueForKey('E5', seatsList)=='A'? true: false, 'E5'),
                              customContainer(getValueForKey('E6', seatsList)=='A'? true: false, 'E6'),
                              customContainer(getValueForKey('E7', seatsList)=='A'? true: false, 'E7'),
                              customContainer(getValueForKey('E8', seatsList)=='A'? true: false, 'E8'),
                              customContainer(getValueForKey('E9', seatsList)=='A'? true: false, 'E9'),
                              SizedBox(width: 185),
                              customContainer(getValueForKey('E10', seatsList)=='A'? true: false, 'E10'),
                              customContainer(getValueForKey('E11', seatsList)=='A'? true: false, 'E11'),
                              customContainer(getValueForKey('E12', seatsList)=='A'? true: false, 'E12'),
                            ],
                          ),
                          Row(
                            children: [
                              customContainer(getValueForKey('D1', seatsList)=='A'? true: false, 'D1'),
                              customContainer(getValueForKey('D2', seatsList)=='A'? true: false, 'D2'),
                              customContainer(getValueForKey('D3', seatsList)=='A'? true: false, 'D3'),
                              customContainer(getValueForKey('D4', seatsList)=='A'? true: false, 'D4'),
                              customDisable('D5'),
                              customContainer(getValueForKey('D5', seatsList)=='A'? true: false, 'D6'),
                              customContainer(getValueForKey('D6', seatsList)=='A'? true: false, 'D7'),
                              customDisable('D8'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('D7', seatsList)=='A'? true: false, 'D9'),
                              customContainer(getValueForKey('D8', seatsList)=='A'? true: false, 'D10'),
                              customContainer(getValueForKey('D9', seatsList)=='A'? true: false, 'D11'),
                              customContainer(getValueForKey('D10', seatsList)=='A'? true: false, 'D12'),
                              customContainer(getValueForKey('D11', seatsList)=='A'? true: false, 'D13'),
                              customContainer(getValueForKey('D12', seatsList)=='A'? true: false, 'D14'),
                              SizedBox(width: 40),
                              customDisable('D15'),
                              customContainer(getValueForKey('D16', seatsList)=='A'? true: false, 'D16'),
                              customContainer(getValueForKey('D17', seatsList)=='A'? true: false, 'D17'),
                              customDisable('18'),
                              customContainer(getValueForKey('D19', seatsList)=='A'? true: false, 'D19'),
                              customContainer(getValueForKey('D20', seatsList)=='A'? true: false, 'D20'),
                              customContainer(getValueForKey('D21', seatsList)=='A'? true: false, 'D21'),
                              customContainer(getValueForKey('D22', seatsList)=='A'? true: false, 'D22'),
                            ],
                          ),
                          Row(
                            children: [
                              customContainer(getValueForKey('C1', seatsList)=='A'? true: false, 'C1'),
                              customContainer(getValueForKey('C2', seatsList)=='A'? true: false, 'C2'),
                              customContainer(getValueForKey('C3', seatsList)=='A'? true: false, 'C3'),
                              customContainer(getValueForKey('C4', seatsList)=='A'? true: false, 'C4'),
                              customContainer(getValueForKey('C5', seatsList)=='A'? true: false, 'C5'),
                              customContainer(getValueForKey('C6', seatsList)=='A'? true: false, 'C6'),
                              customContainer(getValueForKey('C7', seatsList)=='A'? true: false, 'C7'),
                              customContainer(getValueForKey('C8', seatsList)=='A'? true: false, 'C8'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('C9', seatsList)=='A'? true: false, 'C9'),
                              customContainer(getValueForKey('C10', seatsList)=='A'? true: false, 'C10'),
                              customContainer(getValueForKey('C11', seatsList)=='A'? true: false, 'C11'),
                              customContainer(getValueForKey('C12', seatsList)=='A'? true: false, 'C12'),
                              customContainer(getValueForKey('C13', seatsList)=='A'? true: false, 'C13'),
                              customContainer(getValueForKey('C14', seatsList)=='A'? true: false, 'C14'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('C15', seatsList)=='A'? true: false, 'C15'),
                              customContainer(getValueForKey('C16', seatsList)=='A'? true: false, 'C16'),
                              customContainer(getValueForKey('C17', seatsList)=='A'? true: false, 'C17'),
                              customContainer(getValueForKey('C18', seatsList)=='A'? true: false, 'C18'),
                              customContainer(getValueForKey('C19', seatsList)=='A'? true: false, 'C19'),
                              customContainer(getValueForKey('C20', seatsList)=='A'? true: false, 'C20'),
                              customContainer(getValueForKey('C21', seatsList)=='A'? true: false, 'C21'),
                              customContainer(getValueForKey('C22', seatsList)=='A'? true: false, 'C22'),
                            ],
                          ),
                          Row(
                            children: [
                              customContainer(getValueForKey('B1', seatsList)=='A'? true: false, 'B1'),
                              customContainer(getValueForKey('B2', seatsList)=='A'? true: false, 'B2'),
                              customContainer(getValueForKey('B3', seatsList)=='A'? true: false, 'B3'),
                              customContainer(getValueForKey('B4', seatsList)=='A'? true: false, 'B4'),
                              customContainer(getValueForKey('B5', seatsList)=='A'? true: false, 'B5'),
                              customContainer(getValueForKey('B6', seatsList)=='A'? true: false, 'B6'),
                              customContainer(getValueForKey('B7', seatsList)=='A'? true: false, 'B7'),
                              customContainer(getValueForKey('B8', seatsList)=='A'? true: false, 'B8'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('B9', seatsList)=='A'? true: false, 'B9'),
                              customContainer(getValueForKey('B10', seatsList)=='A'? true: false, 'B10'),
                              customContainer(getValueForKey('B11', seatsList)=='A'? true: false, 'B11'),
                              customContainer(getValueForKey('B12', seatsList)=='A'? true: false, 'B12'),
                              customContainer(getValueForKey('B13', seatsList)=='A'? true: false, 'B13'),
                              customContainer(getValueForKey('B14', seatsList)=='A'? true: false, 'B14'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('B15', seatsList)=='A'? true: false, 'B15'),
                              customContainer(getValueForKey('B16', seatsList)=='A'? true: false, 'B16'),
                              customContainer(getValueForKey('B17', seatsList)=='A'? true: false, 'B17'),
                              customContainer(getValueForKey('B18', seatsList)=='A'? true: false, 'B18'),
                              customContainer(getValueForKey('B19', seatsList)=='A'? true: false, 'B19'),
                              customContainer(getValueForKey('B20', seatsList)=='A'? true: false, 'B20'),
                              customContainer(getValueForKey('B21', seatsList)=='A'? true: false, 'B21'),
                              customContainer(getValueForKey('B22', seatsList)=='A'? true: false, 'B22'),
                            ],
                          ),
                          Row(
                            children: [
                              customContainer(getValueForKey('A1', seatsList)=='A'? true: false, 'A1'),
                              customContainer(getValueForKey('A2', seatsList)=='A'? true: false, 'A2'),
                              customContainer(getValueForKey('A3', seatsList)=='A'? true: false, 'A3'),
                              customContainer(getValueForKey('A4', seatsList)=='A'? true: false, 'A4'),
                              customContainer(getValueForKey('A5', seatsList)=='A'? true: false, 'A5'),
                              customContainer(getValueForKey('A6', seatsList)=='A'? true: false, 'A6'),
                              customContainer(getValueForKey('A7', seatsList)=='A'? true: false, 'A7'),
                              customContainer(getValueForKey('A8', seatsList)=='A'? true: false, 'A8'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('A9', seatsList)=='A'? true: false, 'A9'),
                              customContainer(getValueForKey('A10', seatsList)=='A'? true: false, 'A10'),
                              customDisable('A11'),
                              customDisable('A12'),
                              customContainer(getValueForKey('A13', seatsList)=='A'? true: false, 'A13'),
                              customContainer(getValueForKey('A14', seatsList)=='A'? true: false, 'A14'),
                              SizedBox(width: 40),
                              customContainer(getValueForKey('A15', seatsList)=='A'? true: false, 'A15'),
                              customContainer(getValueForKey('A16', seatsList)=='A'? true: false, 'A16'),
                              customContainer(getValueForKey('A17', seatsList)=='A'? true: false, 'A17'),
                              customContainer(getValueForKey('A18', seatsList)=='A'? true: false, 'A18'),
                              customContainer(getValueForKey('A19', seatsList)=='A'? true: false, 'A19'),
                              customContainer(getValueForKey('A20', seatsList)=='A'? true: false, 'A20'),
                              customContainer(getValueForKey('A21', seatsList)=='A'? true: false, 'A21'),
                              customContainer(getValueForKey('A22', seatsList)=='A'? true: false, 'A22'),
                            ],
                          ),
                          Container(
                            width: 500,
                            child: CustomElevatedButton(
                              onTap: (){
                                if(selectedSeatList.length == (selectedGuestTicket+ selectedMemberTicket)){
                                  _controller.pause();
                                  Navigator.pushNamed(context, AppRoutes.onlineCinemaBookingFinalTicketScreen);
                                }
                                else{
                                  ft.Fluttertoast.showToast(
                                    msg: "Please select all Seats to continue!!!",
                                    toastLength: ft.Toast.LENGTH_LONG,);
                                }
                              },
                              text: "Next".toUpperCase(),
                              margin: getMargin(top: 30, bottom: 5),
                              buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                                fixedSize: MaterialStateProperty.all<Size>(
                                  Size(double.maxFinite, getVerticalSize(50)),
                                ),
                              ),
                              buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customDisable(String text) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      height: 30,
      width: 35,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 4.0,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 14, // Adjust the seat number size
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
class BoxWithStatus extends StatelessWidget {
  final Color color;
  final String statusText;

  BoxWithStatus({required this.color, required this.statusText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          color: color,
        ),
        SizedBox(width: 10,),
        Text(
          statusText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}