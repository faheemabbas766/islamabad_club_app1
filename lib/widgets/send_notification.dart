import 'dart:convert';
import 'package:http/http.dart' as http;
Future<void> sendNotification(String fcmtoken, String Message, String title, {String? msg}) async {
  String serverKey = '';
  // if (fcmtoken != null) {
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'key=$serverKey',
  };

  final payload = {
    "data": {
      "title": title,
      "userid": 1,
      "msg": msg,
      "body": Message,
    },
    'to': fcmtoken,
  };

  final response = await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
    headers: headers,
    body: jsonEncode(payload),
  );

  if (response.statusCode == 200) {
    print('Notification sent successfully.');
  } else {
    print('Failed to send notification: ${response.statusCode}');
  }
}