/// status : "Success"
/// message : "Online Payment"
/// data : {"MOBILE_NUM":"4694694","FIRSTNAME":"AAMER","LASTNAME":"NABI NUR","EMAIL":"test123@gmail.com","CITY":"test","MAILING_ADDRESS":"test","CURRENT_YEAR":"2023","LAST_MONTH":"July","TOTALBILL":44558,"CONVENIENCE":1306,"TOTALPAYABLE":45864,"COUNTRY":[{"id":"1","title":"PAKISTAN"},{"id":"2","title":"USA"},{"id":"3","title":"CANADA"},{"id":"4","title":"CHINA"}]}

class OnlineBillPayment {
  OnlineBillPayment({
      this.status, 
      this.message, 
      this.data,});

  OnlineBillPayment.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  Data? data;
OnlineBillPayment copyWith({  String? status,
  String? message,
  Data? data,
}) => OnlineBillPayment(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// MOBILE_NUM : "4694694"
/// FIRSTNAME : "AAMER"
/// LASTNAME : "NABI NUR"
/// EMAIL : "test123@gmail.com"
/// CITY : "test"
/// MAILING_ADDRESS : "test"
/// CURRENT_YEAR : "2023"
/// LAST_MONTH : "July"
/// TOTALBILL : 44558
/// CONVENIENCE : 1306
/// TOTALPAYABLE : 45864
/// COUNTRY : [{"id":"1","title":"PAKISTAN"},{"id":"2","title":"USA"},{"id":"3","title":"CANADA"},{"id":"4","title":"CHINA"}]

class Data {
  Data({
      this.mobilenum, 
      this.firstname, 
      this.lastname, 
      this.email, 
      this.city, 
      this.mailingaddress, 
      this.currentyear, 
      this.lastmonth, 
      this.totalbill, 
      this.convenience, 
      this.totalpayable, 
      this.country,});

  Data.fromJson(dynamic json) {
    mobilenum = json['MOBILE_NUM'];
    firstname = json['FIRSTNAME'];
    lastname = json['LASTNAME'];
    email = json['EMAIL'];
    city = json['CITY'];
    mailingaddress = json['MAILING_ADDRESS'];
    currentyear = json['CURRENT_YEAR'];
    lastmonth = json['LAST_MONTH'];
    totalbill = json['TOTALBILL'];
    convenience = json['CONVENIENCE'];
    totalpayable = json['TOTALPAYABLE'];
    if (json['COUNTRY'] != null) {
      country = [];
      json['COUNTRY'].forEach((v) {
        country?.add(Country.fromJson(v));
      });
    }
  }
  String? mobilenum;
  String? firstname;
  String? lastname;
  String? email;
  String? city;
  String? mailingaddress;
  String? currentyear;
  String? lastmonth;
  num? totalbill;
  num? convenience;
  num? totalpayable;
  List<Country>? country;
Data copyWith({  String? mobilenum,
  String? firstname,
  String? lastname,
  String? email,
  String? city,
  String? mailingaddress,
  String? currentyear,
  String? lastmonth,
  num? totalbill,
  num? convenience,
  num? totalpayable,
  List<Country>? country,
}) => Data(  mobilenum: mobilenum ?? this.mobilenum,
  firstname: firstname ?? this.firstname,
  lastname: lastname ?? this.lastname,
  email: email ?? this.email,
  city: city ?? this.city,
  mailingaddress: mailingaddress ?? this.mailingaddress,
  currentyear: currentyear ?? this.currentyear,
  lastmonth: lastmonth ?? this.lastmonth,
  totalbill: totalbill ?? this.totalbill,
  convenience: convenience ?? this.convenience,
  totalpayable: totalpayable ?? this.totalpayable,
  country: country ?? this.country,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MOBILE_NUM'] = mobilenum;
    map['FIRSTNAME'] = firstname;
    map['LASTNAME'] = lastname;
    map['EMAIL'] = email;
    map['CITY'] = city;
    map['MAILING_ADDRESS'] = mailingaddress;
    map['CURRENT_YEAR'] = currentyear;
    map['LAST_MONTH'] = lastmonth;
    map['TOTALBILL'] = totalbill;
    map['CONVENIENCE'] = convenience;
    map['TOTALPAYABLE'] = totalpayable;
    if (country != null) {
      map['COUNTRY'] = country?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// title : "PAKISTAN"

class Country {
  Country({
      this.id, 
      this.title,});

  Country.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
  }
  String? id;
  String? title;
Country copyWith({  String? id,
  String? title,
}) => Country(  id: id ?? this.id,
  title: title ?? this.title,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    return map;
  }

}