abstract class BaseService {
  String mediaBaseUrl = "https://islamabadclub.finalsolutions.com.pk/";
  Future<dynamic> getResponse(String url);
  Future<dynamic> postRequest(String url, dynamic body);
}