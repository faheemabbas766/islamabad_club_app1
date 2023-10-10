import 'package:flutter/material.dart';

Future<bool> showConfirmationDialog(BuildContext context, String title, String message) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.black, // Set the text color to red
            ),
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(false); // Return false when canceled
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.red, // Set the text color to red
            ),
            child: Text('LogOut'),
            onPressed: () {
              Navigator.of(context).pop(true); // Return true when confirmed
            },
          ),
        ],
      );
    },
  );
}
class Variables{
  static int AppButtonSelected= 0;
}