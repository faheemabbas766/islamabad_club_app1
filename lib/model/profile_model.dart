class Profile {
  String? status;
  String? message;
  Data? data;

  Profile({this.status, this.message, this.data});

  Profile.fromJson(Map<String, dynamic> json) {
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
  Meminfo? meminfo;

  Data({this.meminfo});

  Data.fromJson(Map<String, dynamic> json) {
    meminfo =
    json['meminfo'] != null ? new Meminfo.fromJson(json['meminfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meminfo != null) {
      data['meminfo'] = this.meminfo!.toJson();
    }
    return data;
  }
}

class Meminfo {
  String? mEMBERID;
  String? mEMBERNO;
  String? mEMBERNAME;
  String? oCCUPATION;
  String? nICNO;
  String? eMPLOYERNAME;
  String? pOSITION;
  String? dATEOFMEMBERSHIP;
  String? sTATUS;
  String? dATEOFBIRTH;
  String? mARITALSTATUS;
  String? aCADEMICQUALIFICATIONS;
  String? mAILINGADDRESS;
  String? cITY;
  String? rESPHONENO;
  String? oFFADD;
  String? oFFPHONENO;
  String? mOBILENO;
  String? fAX;
  String? eMAIL;
  String? pERMANENTADDRESS;
  String? fACILITYSTOP;
  String? aUTOSMSNO;
  String? uSRREF;

  Meminfo(
      {this.mEMBERID,
        this.mEMBERNO,
        this.mEMBERNAME,
        this.oCCUPATION,
        this.nICNO,
        this.eMPLOYERNAME,
        this.pOSITION,
        this.dATEOFMEMBERSHIP,
        this.sTATUS,
        this.dATEOFBIRTH,
        this.mARITALSTATUS,
        this.aCADEMICQUALIFICATIONS,
        this.mAILINGADDRESS,
        this.cITY,
        this.rESPHONENO,
        this.oFFADD,
        this.oFFPHONENO,
        this.mOBILENO,
        this.fAX,
        this.eMAIL,
        this.pERMANENTADDRESS,
        this.fACILITYSTOP,
        this.aUTOSMSNO,
        this.uSRREF});

  Meminfo.fromJson(Map<String, dynamic> json) {
    mEMBERID = json['MEMBER_ID'];
    mEMBERNO = json['MEMBER_NO'];
    mEMBERNAME = json['MEMBER_NAME'];
    oCCUPATION = json['OCCUPATION'];
    nICNO = json['NIC_NO'];
    eMPLOYERNAME = json['EMPLOYER_NAME'];
    pOSITION = json['POSITION'];
    dATEOFMEMBERSHIP = json['DATE_OF_MEMBERSHIP'];
    sTATUS = json['STATUS'];
    dATEOFBIRTH = json['DATE_OF_BIRTH'];
    mARITALSTATUS = json['MARITAL_STATUS'];
    aCADEMICQUALIFICATIONS = json['ACADEMIC_QUALIFICATIONS'];
    mAILINGADDRESS = json['MAILING_ADDRESS'];
    cITY = json['CITY'];
    rESPHONENO = json['RES_PHONE_NO'];
    oFFADD = json['OFF_ADD'];
    oFFPHONENO = json['OFF_PHONENO'];
    mOBILENO = json['MOBILE_NO'];
    fAX = json['FAX'];
    eMAIL = json['EMAIL'];
    pERMANENTADDRESS = json['PERMANENT_ADDRESS'];
    fACILITYSTOP = json['FACILITY_STOP'];
    aUTOSMSNO = json['AUTO_SMS_NO'];
    uSRREF = json['USR_REF'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MEMBER_ID'] = this.mEMBERID;
    data['MEMBER_NO'] = this.mEMBERNO;
    data['MEMBER_NAME'] = this.mEMBERNAME;
    data['OCCUPATION'] = this.oCCUPATION;
    data['NIC_NO'] = this.nICNO;
    data['EMPLOYER_NAME'] = this.eMPLOYERNAME;
    data['POSITION'] = this.pOSITION;
    data['DATE_OF_MEMBERSHIP'] = this.dATEOFMEMBERSHIP;
    data['STATUS'] = this.sTATUS;
    data['DATE_OF_BIRTH'] = this.dATEOFBIRTH;
    data['MARITAL_STATUS'] = this.mARITALSTATUS;
    data['ACADEMIC_QUALIFICATIONS'] = this.aCADEMICQUALIFICATIONS;
    data['MAILING_ADDRESS'] = this.mAILINGADDRESS;
    data['CITY'] = this.cITY;
    data['RES_PHONE_NO'] = this.rESPHONENO;
    data['OFF_ADD'] = this.oFFADD;
    data['OFF_PHONENO'] = this.oFFPHONENO;
    data['MOBILE_NO'] = this.mOBILENO;
    data['FAX'] = this.fAX;
    data['EMAIL'] = this.eMAIL;
    data['PERMANENT_ADDRESS'] = this.pERMANENTADDRESS;
    data['FACILITY_STOP'] = this.fACILITYSTOP;
    data['AUTO_SMS_NO'] = this.aUTOSMSNO;
    data['USR_REF'] = this.uSRREF;
    return data;
  }
}