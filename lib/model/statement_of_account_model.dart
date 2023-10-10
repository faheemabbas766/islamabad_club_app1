/// status : "Success"
/// message : "Statement of Accounts"
/// data : [{"Month":"7-2023","Dr":"29046.00","Cr":"0.00","Bal":"15512.00"},{"Month":"8-2023","Dr":"16440.00","Cr":"0.00","Bal":"44558.00"}]

class StatementOfAccountModel {
  StatementOfAccountModel({
      this.status, 
      this.message, 
      this.data,});

  StatementOfAccountModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? status;
  String? message;
  List<Data>? data;
StatementOfAccountModel copyWith({  String? status,
  String? message,
  List<Data>? data,
}) => StatementOfAccountModel(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Month : "7-2023"
/// Dr : "29046.00"
/// Cr : "0.00"
/// Bal : "15512.00"

class Data {
  Data({
      this.month, 
      this.dr, 
      this.cr, 
      this.bal,});

  Data.fromJson(dynamic json) {
    month = json['Month'];
    dr = json['Dr'];
    cr = json['Cr'];
    bal = json['Bal'];
  }
  String? month;
  String? dr;
  String? cr;
  String? bal;
Data copyWith({  String? month,
  String? dr,
  String? cr,
  String? bal,
}) => Data(  month: month ?? this.month,
  dr: dr ?? this.dr,
  cr: cr ?? this.cr,
  bal: bal ?? this.bal,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Month'] = month;
    map['Dr'] = dr;
    map['Cr'] = cr;
    map['Bal'] = bal;
    return map;
  }

}