import 'package:flutter/material.dart';
class Notifcations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 812,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 24,
                top: 604,
                child: Container(
                  width: 326,
                  height: 114,
                  padding: const EdgeInsets.all(10.42),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF5F4F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.25),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 111,
                        height: 93,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/111x93"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 5.56, color: Colors.white),
                            borderRadius: BorderRadius.circular(18.55),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.42),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 92,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 9,
                                    child: Container(
                                      width: 184,
                                      height: 83,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Geraldo',
                                            style: TextStyle(
                                              color: Color(0xFF242B5C),
                                              fontSize: 12.50,
                                              fontFamily: 'Raleway',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                              letterSpacing: 0.38,
                                            ),
                                          ),
                                          const SizedBox(height: 4.17),
                                          SizedBox(
                                            width: 184,
                                            child: Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Just giving ',
                                                    style: TextStyle(
                                                      color: Color(0xFF53577A),
                                                      fontSize: 10.42,
                                                      fontFamily: 'Raleway',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0.19,
                                                      letterSpacing: 0.31,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: '5',
                                                    style: TextStyle(
                                                      color: Color(0xFF242B5C),
                                                      fontSize: 10.42,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight.w700,
                                                      height: 0.19,
                                                      letterSpacing: 0.31,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' ',
                                                    style: TextStyle(
                                                      color: Color(0xFF242B5C),
                                                      fontSize: 10.42,
                                                      fontFamily: 'Raleway',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0.19,
                                                      letterSpacing: 0.31,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: 'Star',
                                                    style: TextStyle(
                                                      color: Color(0xFF242B5C),
                                                      fontSize: 10.42,
                                                      fontFamily: 'Raleway',
                                                      fontWeight: FontWeight.w700,
                                                      height: 0.19,
                                                      letterSpacing: 0.31,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' review on your listing ',
                                                    style: TextStyle(
                                                      color: Color(0xFF53577A),
                                                      fontSize: 10.42,
                                                      fontFamily: 'Raleway',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0.19,
                                                      letterSpacing: 0.31,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: 'Fairview Apartment',
                                                    style: TextStyle(
                                                      color: Color(0xFF242B5C),
                                                      fontSize: 10.42,
                                                      fontFamily: 'Raleway',
                                                      fontWeight: FontWeight.w700,
                                                      height: 0.19,
                                                      letterSpacing: 0.31,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4.17),
                                          Text(
                                            '40 mins ago',
                                            style: TextStyle(
                                              color: Color(0xFFA1A4C1),
                                              fontSize: 8.34,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w400,
                                              height: 0.25,
                                              letterSpacing: -0.17,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 5,
                                      height: 9,
                                      decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 335,
                child: Container(
                  width: 326,
                  height: 114,
                  padding: const EdgeInsets.all(10.42),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF5F4F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.25),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 111,
                        height: 93,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/111x93"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 5.56, color: Colors.white),
                            borderRadius: BorderRadius.circular(18.55),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.42),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 92,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 9,
                                    child: Container(
                                      width: 184,
                                      height: 83,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Geraldo',
                                            style: TextStyle(
                                              color: Color(0xFF242B5C),
                                              fontSize: 12.50,
                                              fontFamily: 'Raleway',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                              letterSpacing: 0.38,
                                            ),
                                          ),
                                          const SizedBox(height: 4.17),
                                          SizedBox(
                                            width: 184,
                                            child: Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Just giving ',
                                                    style: TextStyle(
                                                      color: Color(0xFF53577A),
                                                      fontSize: 10.42,
                                                      fontFamily: 'Raleway',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0.19,
                                                      letterSpacing: 0.31,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: '5',
                                                    style: TextStyle(
                                                      color: Color(0xFF242B5C),
                                                      fontSize: 10.42,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight.w700,
                                                      height: 0.19,
                                                      letterSpacing: 0.31,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' ',
                                                    style: TextStyle(
                                                      color: Color(0xFF242B5C),
                                                      fontSize: 10.42,
                                                      fontFamily: 'Raleway',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0.19,
                                                      letterSpacing: 0.31,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: 'Star',
                                                    style: TextStyle(
                                                      color: Color(0xFF242B5C),
                                                      fontSize: 10.42,
                                                      fontFamily: 'Raleway',
                                                      fontWeight: FontWeight.w700,
                                                      height: 0.19,
                                                      letterSpacing: 0.31,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' review on your listing ',
                                                    style: TextStyle(
                                                      color: Color(0xFF53577A),
                                                      fontSize: 10.42,
                                                      fontFamily: 'Raleway',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0.19,
                                                      letterSpacing: 0.31,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: 'Fairview Apartment',
                                                    style: TextStyle(
                                                      color: Color(0xFF242B5C),
                                                      fontSize: 10.42,
                                                      fontFamily: 'Raleway',
                                                      fontWeight: FontWeight.w700,
                                                      height: 0.19,
                                                      letterSpacing: 0.31,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4.17),
                                          Text(
                                            '40 mins ago',
                                            style: TextStyle(
                                              color: Color(0xFFA1A4C1),
                                              fontSize: 8.34,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w400,
                                              height: 0.25,
                                              letterSpacing: -0.17,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 5,
                                      height: 9,
                                      decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 203,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF5F4F7),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/50x50"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(150),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 9,
                            child: Container(
                              width: 247,
                              height: 80,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shehayar Mirza ',
                                    style: TextStyle(
                                      color: Color(0xFF242B5C),
                                      fontSize: 12,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                      letterSpacing: 0.36,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  SizedBox(
                                    width: 247,
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Just messaged you. Check the message in ',
                                            style: TextStyle(
                                              color: Color(0xFF53577A),
                                              fontSize: 10,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w500,
                                              height: 0.20,
                                              letterSpacing: 0.30,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'message',
                                            style: TextStyle(
                                              color: Color(0xFF242B5C),
                                              fontSize: 10,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w700,
                                              height: 0.20,
                                              letterSpacing: 0.30,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' ',
                                            style: TextStyle(
                                              color: Color(0xFF53577A),
                                              fontSize: 10,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w700,
                                              height: 0.20,
                                              letterSpacing: 0.30,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'tab.',
                                            style: TextStyle(
                                              color: Color(0xFF53577A),
                                              fontSize: 10,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w500,
                                              height: 0.20,
                                              letterSpacing: 0.30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '10 mins ago',
                                    style: TextStyle(
                                      color: Color(0xFFA1A4C1),
                                      fontSize: 8,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      height: 0.27,
                                      letterSpacing: -0.16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 5,
                              height: 9,
                              decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 130,
                child: Container(
                  width: 327,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF5F4F7),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 32,
                              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'OTP',
                                    style: TextStyle(
                                      color: Color(0xFFA1A5C1),
                                      fontSize: 10,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 7),
                            Container(
                              height: 32,
                              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'General',
                                    style: TextStyle(
                                      color: Color(0xFF0F0F0F),
                                      fontSize: 10,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 740,
                child: Container(
                  width: 375,
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 24,
                    right: 24,
                    bottom: 24,
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x0F000000),
                        blurRadius: 40,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 32,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 82,
                              height: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: ShapeDecoration(
                                color: Color(0xFFF5F5FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 24,
                                          height: 24,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 24,
                                                height: 24,
                                                child: Stack(children: [

                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Home',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFFEBD11),
                                      fontSize: 12,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      height: 0.12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              width: 66,
                              height: double.infinity,
                              padding: const EdgeInsets.all(4),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 24,
                                          height: 24,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 24,
                                                height: 24,
                                                child: Stack(children: [

                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              width: 66,
                              height: double.infinity,
                              padding: const EdgeInsets.all(4),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 24,
                                          height: 24,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 24,
                                                height: 24,
                                                child: Stack(children: [

                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Container(
                                height: double.infinity,
                                padding: const EdgeInsets.all(4),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 24,
                                            height: 24,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 24,
                                                  height: 24,
                                                  child: Stack(children: [

                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 45,
                child: Container(
                  width: 327,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFEDEDED)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                      ]
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 65),
                      Text(
                        'Notifcations',
                        style: TextStyle(
                          color: Color(0xFF0F0F0F),
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                        ),
                      ),
                      const SizedBox(width: 65),
                      Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(8),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFEDEDED)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 24,
                                          height: 24,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 24,
                                                height: 24,
                                                child: Stack(children: [

                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFFEBD11),
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}