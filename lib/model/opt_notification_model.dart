class OPTNotificationModel {
  String? status;
  String? message;
  List<Data>? data;

  OPTNotificationModel({this.status, this.message, this.data});

  OPTNotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? nOTUSRSN;
  String? nOTTEXT;
  String? nOTCREATEDAT;

  Data({this.nOTUSRSN, this.nOTTEXT, this.nOTCREATEDAT});

  Data.fromJson(Map<String, dynamic> json) {
    nOTUSRSN = json['NOT_USR_SN'];
    nOTTEXT = json['NOT_TEXT'];
    nOTCREATEDAT = json['NOT_CREATED_AT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NOT_USR_SN'] = this.nOTUSRSN;
    data['NOT_TEXT'] = this.nOTTEXT;
    data['NOT_CREATED_AT'] = this.nOTCREATEDAT;
    return data;
  }
}
