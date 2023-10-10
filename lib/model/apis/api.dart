import 'package:flutter/material.dart';

class API {
  static String? devid;
  static bool postlocation = false;

  static showLoading(String text, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.2,
                child: SizedBox(
                ),
              ),
              Center(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: const CircularProgressIndicator(),
                      ),
                      DefaultTextStyle(
                        style: TextStyle(fontSize: 20),
                        child: Text(text),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
