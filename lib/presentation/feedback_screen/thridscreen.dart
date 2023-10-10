// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:islamabad_club_app/presentation/feedback_screen/thirdscreen.dart';
//
// class FeedBackPage extends StatefulWidget {
//   const FeedBackPage();
//
//   @override
//   State<FeedBackPage> createState() => _FeedBackPageState();
// }
//
// class _FeedBackPageState extends State<FeedBackPage> {
//   String dropdownvalue = 'select';
//   String dropdownvalue1 = 'select';
//   String dropdownvalue2 = 'select';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: IconButton(
//                             onPressed: () {
//                               Navigator.pop(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => const FeedBackPage(),
//                                   ));
//                             },
//                             icon: const Icon(Icons.arrow_back_ios)),
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
//                       const SizedBox(
//                         width: 33,
//                       ),
//                       const Icon(Icons.notifications),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 47,
//                   ),
//                   Text(
//                     'Add Complaints:',
//                     style: GoogleFonts.montserrat(
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     'Category',
//                     style: GoogleFonts.montserrat(
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   const SizedBox(
//                     height: 11,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(
//                             color: const Color(0xff000000), width: 1)),
//                     child: DropdownButton<String>(
//                       isExpanded: true,
//                       value: dropdownvalue,
//                       style: const TextStyle(color: Colors.white),
//                       underline: Container(
//                         height: 2,
//                         color: Colors.white,
//                       ),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           dropdownvalue = newValue!;
//                         });
//                       },
//                       items: [
//                         DropdownMenuItem<String>(
//                             value: "select",
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "select",
//                                 style: GoogleFonts.montserrat(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             )),
//                         DropdownMenuItem<String>(
//                             value: "one",
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "one",
//                                 style: GoogleFonts.montserrat(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             )),
//                         DropdownMenuItem<String>(
//                             value: "two",
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "two",
//                                 style: GoogleFonts.montserrat(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             )),
//                         DropdownMenuItem<String>(
//                             value: "three",
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "three",
//                                 style: GoogleFonts.montserrat(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             )),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     'Sub Category',
//                     style: GoogleFonts.montserrat(
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   const SizedBox(
//                     height: 11,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(
//                             color: const Color(0xff000000), width: 1)),
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
//                       items: [
//                         DropdownMenuItem<String>(
//                             value: "select",
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "select",
//                                 style: GoogleFonts.montserrat(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             )),
//                         DropdownMenuItem<String>(
//                             value: "one",
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "one",
//                                 style: GoogleFonts.montserrat(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             )),
//                         DropdownMenuItem<String>(
//                             value: "two",
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "two",
//                                 style: GoogleFonts.montserrat(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             )),
//                         DropdownMenuItem<String>(
//                             value: "three",
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "three",
//                                 style: GoogleFonts.montserrat(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             )),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     'issue',
//                     style: GoogleFonts.montserrat(
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   const SizedBox(
//                     height: 11,
//                   ),
//                   Container(
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
//                       items: [
//                         DropdownMenuItem<String>(
//                             value: "select",
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "select",
//                                 style: GoogleFonts.montserrat(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             )),
//                         DropdownMenuItem<String>(
//                             value: "one",
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 14),
//                               child: Text(
//                                 "one",
//                                 style: GoogleFonts.montserrat(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             )),
//                         DropdownMenuItem<String>(
//                             value: "two",
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "two",
//                                 style: GoogleFonts.montserrat(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             )),
//                         DropdownMenuItem<String>(
//                             value: "three",
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 14,
//                               ),
//                               child: Text(
//                                 "three",
//                                 style: GoogleFonts.montserrat(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             )),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 27,
//                   ),
//                   TextField(
//                     decoration: InputDecoration(
//                         border: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0xffEDEDED),
//                             width: 0,
//                           ),
//                         ),
//                         enabledBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0xffEDEDED),
//                             width: 0,
//                           ),
//                         ),
//                         focusedBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Color(0xffEDEDED),
//                             width: 2,
//                           ),
//                         ),
//                         hintText: 'Complaint Description',
//                         hintStyle: GoogleFonts.montserrat(
//                           color: Colors.black,
//                           fontSize: 10,
//                           fontWeight: FontWeight.w500,
//                           fontStyle: FontStyle.normal,
//                         )),
//                     keyboardType: TextInputType.multiline,
//                     minLines: 1,
//                     maxLines: 5,
//                   ),
//                   const SizedBox(
//                     height: 18,
//                   ),
//                   Text(
//                     'File Input',
//                     style: GoogleFonts.montserrat(
//                         color: const Color(0xff000000),
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   const SizedBox(
//                     height: 13,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         height: 28,
//                         width: 110,
//                         decoration: BoxDecoration(
//                           color: const Color(0xffD9D9D9),
//                           border: Border.all(
//                             color: const Color(0xff000000),
//                           ),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 15, vertical: 3),
//                         child: Column(
//                           children: [
//                             Text(
//                               'Choose File',
//                               style: GoogleFonts.montserrat(
//                                 color: const Color(0xff000000),
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w500,
//                                 fontStyle: FontStyle.normal,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 6,
//                       ),
//                       Text(
//                         'No file chosen',
//                         style: GoogleFonts.montserrat(
//                           color: const Color(0xff000000),
//                           fontSize: 10,
//                           fontWeight: FontWeight.w500,
//                           fontStyle: FontStyle.normal,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 82,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                           width: 143,
//                           height: 40,
//                           child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.red,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(4.531),
//                                   side: const BorderSide(color: Colors.red),
//                                 ),
//                               ),
//                               onPressed: () {},
//                               child: Text(
//                                 'Cancel',
//                                 style: GoogleFonts.montserrat(
//                                     color: Colors.white,
//                                     fontSize: 12.59,
//                                     fontWeight: FontWeight.w700),
//                               ))),
//                       const SizedBox(
//                         width: 11.58,
//                       ),
//                       SizedBox(
//                         width: 143,
//                         height: 40,
//                         child: TextButton(
//                             style: TextButton.styleFrom(
//                               backgroundColor: Colors.amber,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(4.531),
//                                 side: const BorderSide(color: Colors.amber),
//                               ),
//                             ),
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         const FeedBackPageTwo(),
//                                   ));
//                             },
//                             child: Text(
//                               'Submit',
//                               style: GoogleFonts.montserrat(
//                                   color: Colors.white,
//                                   fontSize: 12.59,
//                                   fontWeight: FontWeight.w700),
//                             )),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 28,
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
