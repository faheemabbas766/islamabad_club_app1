class GeneralNotificationModel {
  String? status;
  String? message;
  List<Data>? data;

  GeneralNotificationModel({this.status, this.message, this.data});

  GeneralNotificationModel.fromJson(Map<String, dynamic> json) {
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
  String? nOTGSN;
  String? nOTGTITLE;
  String? nOTGSHORTTEXT;
  String? nOTGTITLEIMAGE;
  String? nOTGCREATEDAT;

  Data(
      {this.nOTGSN,
        this.nOTGTITLE,
        this.nOTGSHORTTEXT,
        this.nOTGTITLEIMAGE,
        this.nOTGCREATEDAT});

  Data.fromJson(Map<String, dynamic> json) {
    nOTGSN = json['NOTG_SN'];
    nOTGTITLE = json['NOTG_TITLE'];
    nOTGSHORTTEXT = json['NOTG_SHORT_TEXT'];
    nOTGTITLEIMAGE = json['NOTG_TITLE_IMAGE'];
    nOTGCREATEDAT = json['NOTG_CREATED_AT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NOTG_SN'] = this.nOTGSN;
    data['NOTG_TITLE'] = this.nOTGTITLE;
    data['NOTG_SHORT_TEXT'] = this.nOTGSHORTTEXT;
    data['NOTG_TITLE_IMAGE'] = this.nOTGTITLEIMAGE;
    data['NOTG_CREATED_AT'] = this.nOTGCREATEDAT;
    return data;
  }
}
