import '../../core/sharedpreference.dart';
import '../family_model.dart';
import 'package:fluttertoast/fluttertoast.dart' as ft;

import 'media_service.dart';
class Functions{

  static Family dataFetch = Family();

  static Future<Family> fetchFamilyInfo() async {
    try{
      Map<String, dynamic> requestBody = {'USR_SN':SharedData.preferences.getString('userSN')! };
      dynamic response = await MediaService().postRequest('familyinfo',requestBody);
      if (response['data'] == null) {
        ft.Fluttertoast.showToast(
            msg: response['message'],
            toastLength: ft.Toast.LENGTH_LONG);
        return Family();
      }else{
        return Family.fromJson(response);
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
          msg: "Check Your Internet Connection!",
          toastLength: ft.Toast.LENGTH_LONG);
      return Family();
    }
  }
}