class Family {
  String? status;
  String? message;
  Data? data;

  Family({this.status, this.message, this.data});

  Family.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<FamilyInfo>? familyInfo;

  Data({this.familyInfo});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['family_info'] != null) {
      familyInfo = <FamilyInfo>[];
      json['family_info'].forEach((v) {
        familyInfo!.add(new FamilyInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.familyInfo != null) {
      data['family_info'] = this.familyInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FamilyInfo {
  String? mACHINENO;
  String? mEMBERID;
  String? mEMBERNO;
  String? nAME;
  String? rELATIONSHIP;
  String? dATEOFBIRTH;
  String? mARITIALSTATUS;
  String? vALIDITYSYSACTIVE;

  FamilyInfo(
      {this.mACHINENO,
        this.mEMBERID,
        this.mEMBERNO,
        this.nAME,
        this.rELATIONSHIP,
        this.dATEOFBIRTH,
        this.mARITIALSTATUS,
        this.vALIDITYSYSACTIVE});

  FamilyInfo.fromJson(Map<String, dynamic> json) {
    mACHINENO = json['MACHINE_NO'];
    mEMBERID = json['MEMBER_ID'];
    mEMBERNO = json['MEMBER_NO'];
    nAME = json['NAME'];
    rELATIONSHIP = json['RELATIONSHIP'];
    dATEOFBIRTH = json['DATE_OF_BIRTH'];
    mARITIALSTATUS = json['MARITIAL_STATUS'];
    vALIDITYSYSACTIVE = json['VALIDITY_SYSACTIVE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MACHINE_NO'] = this.mACHINENO;
    data['MEMBER_ID'] = this.mEMBERID;
    data['MEMBER_NO'] = this.mEMBERNO;
    data['NAME'] = this.nAME;
    data['RELATIONSHIP'] = this.rELATIONSHIP;
    data['DATE_OF_BIRTH'] = this.dATEOFBIRTH;
    data['MARITIAL_STATUS'] = this.mARITIALSTATUS;
    data['VALIDITY_SYSACTIVE'] = this.vALIDITYSYSACTIVE;
    return data;
  }
}
