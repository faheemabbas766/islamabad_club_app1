import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:islamabad_club_app/presentation/home_screen_container_screen/home_screen_container_screen.dart';
import 'package:islamabad_club_app/presentation/profile_page/profile_page.dart';

class HomeController extends GetxController {
  var currentNavIndex = 0.obs;
}

class BottomBar extends StatefulWidget {
  const BottomBar();

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var naBody = [
      HomeScreenContainerScreen(),
      Container(
        color: Colors.amber,
      ),
      Container(
        color: Colors.green,
      ),
      ProfilePage(),
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(
                () => Expanded(
              child: naBody.elementAt(controller.currentNavIndex.value),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: GNav(
            backgroundColor: Colors.white,
            color: const Color(0xff878787),
            activeColor: const Color(0xffFEBD11),
            gap: 4,
            padding: const EdgeInsets.all(10),
            tabBackgroundColor: const Color(0xffF5F5FF),
            onTabChange: (value) {
              controller.currentNavIndex.value = value;
            },
            tabs:[
              GButton(
                icon: Icons.home,
                iconSize: 28,
                textSize: 12,
                text: "Home",
              ),
              GButton(
                iconSize: 28,
                textSize: 12,
                icon: Icons.explore,
                text: "Explore",
              ),
              GButton(
                iconSize: 28,
                textSize: 12,
                icon: Icons.bookmark,
                text: "Book",
              ),
              GButton(
                iconSize: 28,
                textSize: 12,
                icon: Icons.person,
                text: "Profile",
              ),
            ]),
      ),
    );
  }
}
