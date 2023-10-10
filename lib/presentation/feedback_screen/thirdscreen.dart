// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:intl/intl.dart';
// import 'package:islamabad_club_app/presentation/feedback_screen/screen.dart';
// import 'package:islamabad_club_app/presentation/feedback_screen/thridscreen.dart';
//
// class FeedBackPageTwo extends StatefulWidget {
//   const FeedBackPageTwo();
//
//   @override
//   State<FeedBackPageTwo> createState() => _FeedBackPageTwoState();
// }
//
// class _FeedBackPageTwoState extends State<FeedBackPageTwo> {
//   final TextEditingController _date = TextEditingController();
//   final TextEditingController _datet = TextEditingController();
//
//   String dropdownvalue = "All";
//   String dropdownvalue1 = "All";
//   String dropdownvalue2 = "All";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//           child: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           Navigator.pop(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const FeedBackPage(),
//                               ));
//                         },
//                         icon: const Icon(Icons.arrow_back_ios),
//                         color: const Color(0xff101010),
//                       ),
//                       const Expanded(
//                         child: SizedBox(
//                           width: 33,
//                         ),
//                       ),
//                       Text(
//                         'Feedback Management',
//                         style: GoogleFonts.montserrat(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: const Color(0xff101010)),
//                       ),
//                       const Expanded(
//                         child: SizedBox(
//                           width: 33,
//                         ),
//                       ),
//                       const Icon(Icons.notifications),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 39,
//                   ),
//                   Text(
//                     'My Complaints',
//                     style: GoogleFonts.montserrat(
//                       color: const Color(0xff000000),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     'Category',
//                     style: GoogleFonts.montserrat(
//                       color: const Color(0xff000000),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       fontStyle: FontStyle.normal,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 11,
//                   ),
//                   Container(
//                     // padding:
//                     //     const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       border:
//                           Border.all(color: const Color(0xff000000), width: 1),
//                     ),
//                     child: Column(
//                       children: [
//                         DropdownButton<String>(
//                           isExpanded: true,
//                           value: dropdownvalue1,
//                           style: const TextStyle(color: Colors.white),
//                           underline: Container(
//                             height: 2,
//                             color: Colors.white,
//                           ),
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               dropdownvalue1 = newValue!;
//                             });
//                           },
//                           items: const [
//                             DropdownMenuItem<String>(
//                                 value: "All",
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 20,
//                                     vertical: 14,
//                                   ),
//                                   child: Text(
//                                     "All",
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                 )),
//                             DropdownMenuItem<String>(
//                                 value: "one",
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 20,
//                                     vertical: 14,
//                                   ),
//                                   child: Text(
//                                     "one",
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                 )),
//                             DropdownMenuItem<String>(
//                                 value: "two",
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 20,
//                                     vertical: 14,
//                                   ),
//                                   child: Text(
//                                     "two",
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                 )),
//                             DropdownMenuItem<String>(
//                                 value: "three",
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 20,
//                                     vertical: 14,
//                                   ),
//                                   child: Text(
//                                     "three",
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                 )),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     'Sub Category',
//                     style: GoogleFonts.montserrat(
//                       color: const Color(0xff000000),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       fontStyle: FontStyle.normal,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 11,
//                   ),
//                   Container(
//                     // padding:
//                     //     const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       border:
//                           Border.all(color: const Color(0xff000000), width: 1),
//                     ),
//                     child: DropdownButton<String>(
//                       isExpanded: true,
//                       value: dropdownvalue1,
//                       style: const TextStyle(color: Colors.white),
//                       underline: Container(
//                         height: 2,
//                         color: Colors.white,
//                       ),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           dropdownvalue1 = newValue!;
//                         });
//                       },
//                       items: const [
//                         DropdownMenuItem<String>(
//                             value: "All",
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "All",
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             )),
//                         DropdownMenuItem<String>(
//                             value: "one",
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "one",
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             )),
//                         DropdownMenuItem<String>(
//                             value: "two",
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "two",
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             )),
//                         DropdownMenuItem<String>(
//                             value: "three",
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "three",
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             )),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     'Complaints No.',
//                     style: GoogleFonts.montserrat(
//                       color: const Color(0xff000000),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       fontStyle: FontStyle.normal,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 11,
//                   ),
//                   const TextField(
//                     style: TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 0,
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 0,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2,
//                         ),
//                       ),
//                       hintText: "",
//                       hintStyle: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black,
//                       ),
//                       // contentPadding:
//                       //     EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     'Status',
//                     style: GoogleFonts.montserrat(
//                       color: const Color(0xff000000),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       fontStyle: FontStyle.normal,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 11,
//                   ),
//                   Container(
//                     // padding:
//                     //     const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(
//                             color: const Color(0xff000000), width: 1)),
//                     child: DropdownButton<String>(
//                       isExpanded: true,
//                       value: dropdownvalue2,
//                       style: const TextStyle(color: Colors.white),
//                       underline: Container(
//                         height: 2,
//                         color: Colors.white,
//                       ),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           dropdownvalue2 = newValue!;
//                         });
//                       },
//                       items: const [
//                         DropdownMenuItem<String>(
//                             value: "All",
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "All",
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             )),
//                         DropdownMenuItem<String>(
//                             value: "one",
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "one",
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             )),
//                         DropdownMenuItem<String>(
//                             value: "two",
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "two",
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             )),
//                         DropdownMenuItem<String>(
//                             value: "three",
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "three",
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             )),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     'From Date',
//                     style: GoogleFonts.montserrat(
//                       color: const Color(0xff000000),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       fontStyle: FontStyle.normal,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 11,
//                   ),
//                   TextField(
//                     controller: _date,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 0,
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 0,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.black,
//                           width: 2,
//                         ),
//                       ),
//                       labelText: 'mm/dd/yyyy',
//                       hintStyle: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black,
//                       ),
//                       contentPadding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                       filled: true,
//                       fillColor: Colors.white,
//                       suffixIcon: Icon(Icons.calendar_month),
//                     ),
//                     onTap: () async {
//                       DateTime? pickeddate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime(2100));
//                       if (pickeddate != null) {
//                         setState(() {
//                           _date.text =
//                               DateFormat("mm/dd/yyyy").format(pickeddate);
//                         });
//                       }
//                     },
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     'To Date',
//                     style: GoogleFonts.montserrat(
//                       color: const Color(0xff000000),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       fontStyle: FontStyle.normal,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 11,
//                   ),
//                   TextField(
//                     controller: _datet,
//                     decoration: const InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: 0,
//                           ),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: 0,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: 2,
//                           ),
//                         ),
//                         labelText: "mm/dd/yyyy",
//                         hintStyle: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black,
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         suffixIcon: Icon(Icons.calendar_month)),
//                     onTap: () async {
//                       DateTime? pickeddate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime(2100));
//                       if (pickeddate != null) {
//                         setState(() {
//                           _datet.text =
//                               DateFormat("yyyy-MM--dd").format(pickeddate);
//                         });
//                       }
//                     },
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Center(
//                     child: SizedBox(
//                       width: 143,
//                       height: 40,
//                       child: TextButton(
//                           style: TextButton.styleFrom(
//                             backgroundColor: Colors.amber,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5.109),
//                               side: const BorderSide(color: Colors.amber),
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const SecreenApp(),
//                                 ));
//                           },
//                           child: Text(
//                             'Submit',
//                             style: GoogleFonts.montserrat(
//                                 color: Colors.white,
//                                 fontSize: 12.59,
//                                 fontWeight: FontWeight.w700),
//                           )),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         bottomNavigationBar: Container(
//             color: Colors.white,
//             child: const Padding(
//               padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//               child: GNav(
//                   backgroundColor: Colors.white,
//                   color: Color(0xff878787),
//                   activeColor: Color(0xffFEBD11),
//                   gap: 4,
//                   padding: EdgeInsets.all(16),
//                   tabBackgroundColor: Color(0xffF5F5FF),
//                   tabs: [
//                     GButton(
//                       icon: Icons.home,
//                       iconSize: 24,
//                       textSize: 12,
//                       text: "Home",
//                     ),
//                     GButton(
//                       icon: Icons.calendar_month,
//                       text: "Date",
//                     ),
//                     GButton(
//                       icon: Icons.bookmark,
//                       text: "Task",
//                     ),
//                     GButton(
//                       icon: Icons.person,
//                       text: "Profile",
//                     ),
//                   ]),
//             )));
//   }
// }
