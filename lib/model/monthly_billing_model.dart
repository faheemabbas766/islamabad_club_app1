class MonthlyBillingModel {
  String? status;
  String? message;
  Data? data;

  MonthlyBillingModel({this.status, this.message, this.data});

  MonthlyBillingModel.fromJson(Map<String, dynamic> json) {
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
  List<Payable>? payable;
  List<Subscription>? subscription;
  List<Catering>? catering;

  Data({this.payable, this.subscription, this.catering});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['payable'] != null) {
      payable = <Payable>[];
      json['payable'].forEach((v) {
        payable!.add(new Payable.fromJson(v));
      });
    }
    if (json['subscription'] != null) {
      subscription = <Subscription>[];
      json['subscription'].forEach((v) {
        subscription!.add(new Subscription.fromJson(v));
      });
    }
    if (json['catering'] != null) {
      catering = <Catering>[];
      json['catering'].forEach((v) {
        catering!.add(new Catering.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payable != null) {
      data['payable'] = this.payable!.map((v) => v.toJson()).toList();
    }
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.map((v) => v.toJson()).toList();
    }
    if (this.catering != null) {
      data['catering'] = this.catering!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payable {
  String? mEMBERID;
  String? mEMBERNO;
  String? mON;
  String? yEAR;
  String? mPAY;
  String? bal;
  String? pAYMENTS;
  String? aDJDR;
  String? aDJCR;
  String? lATEFEE;
  String? sTATUS;
  String? tOTALBILL;
  String? sUBSCRIPTION;
  String? tdues;

  Payable(
      {this.mEMBERID,
        this.mEMBERNO,
        this.mON,
        this.yEAR,
        this.mPAY,
        this.bal,
        this.pAYMENTS,
        this.aDJDR,
        this.aDJCR,
        this.lATEFEE,
        this.sTATUS,
        this.tOTALBILL,
        this.sUBSCRIPTION,
        this.tdues});

  Payable.fromJson(Map<String, dynamic> json) {
    mEMBERID = json['MEMBER_ID'];
    mEMBERNO = json['MEMBER_NO'];
    mON = json['MON'];
    yEAR = json['YEAR'];
    mPAY = json['MPAY'];
    bal = json['Bal'];
    pAYMENTS = json['PAYMENTS'];
    aDJDR = json['ADJDR'];
    aDJCR = json['ADJCR'];
    lATEFEE = json['LATEFEE'];
    sTATUS = json['STATUS'];
    tOTALBILL = json['TOTALBILL'];
    sUBSCRIPTION = json['SUBSCRIPTION'];
    tdues = json['tdues'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MEMBER_ID'] = this.mEMBERID;
    data['MEMBER_NO'] = this.mEMBERNO;
    data['MON'] = this.mON;
    data['YEAR'] = this.yEAR;
    data['MPAY'] = this.mPAY;
    data['Bal'] = this.bal;
    data['PAYMENTS'] = this.pAYMENTS;
    data['ADJDR'] = this.aDJDR;
    data['ADJCR'] = this.aDJCR;
    data['LATEFEE'] = this.lATEFEE;
    data['STATUS'] = this.sTATUS;
    data['TOTALBILL'] = this.tOTALBILL;
    data['SUBSCRIPTION'] = this.sUBSCRIPTION;
    data['tdues'] = this.tdues;
    return data;
  }
}

class Subscription {
  String? hEADNAME;
  String? cHARGES;

  Subscription({this.hEADNAME, this.cHARGES});

  Subscription.fromJson(Map<String, dynamic> json) {
    hEADNAME = json['HEADNAME'];
    cHARGES = json['CHARGES'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HEADNAME'] = this.hEADNAME;
    data['CHARGES'] = this.cHARGES;
    return data;
  }
}

class Catering {
  String? bILLNO;
  String? bILLDATE;
  String? tOTALBILL;

  Catering({this.bILLNO, this.bILLDATE, this.tOTALBILL});

  Catering.fromJson(Map<String, dynamic> json) {
    bILLNO = json['BILL_NO'];
    bILLDATE = json['BILL_DATE'];
    tOTALBILL = json['TOTAL_BILL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BILL_NO'] = this.bILLNO;
    data['BILL_DATE'] = this.bILLDATE;
    data['TOTAL_BILL'] = this.tOTALBILL;
    return data;
  }
}