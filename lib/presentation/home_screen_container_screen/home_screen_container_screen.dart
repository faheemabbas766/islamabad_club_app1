import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/widgets/confirm_box.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
class HomeScreenContainerScreen extends StatefulWidget {
  @override
  _HomeScreenContainerScreenState createState() =>
      _HomeScreenContainerScreenState();
}

class _HomeScreenContainerScreenState extends State<HomeScreenContainerScreen> {
  _HomeScreenContainerScreenState();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
  Future<bool> _confirmExit(BuildContext context) async {
    bool exitConfirmed = false;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Exit Confirmation"),
          content: Text("Are you sure you want to exit?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                while(Navigator.of(context).canPop())
                Navigator.of(context).pop(true);
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    ).then((value) {
      exitConfirmed = value ?? false; // If user cancels the dialog, exitConfirmed will be false
    });

    return exitConfirmed;
  }

  @override
  Widget build(BuildContext context) {
    Variables.AppButtonSelected = 0;
    notificationShow(context);
    
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: WillPopScope(
              onWillPop: () async {
                return await _confirmExit(context);
              },
            child: HomeScreenPage()
        ), // Directly return the desired page widget
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}
