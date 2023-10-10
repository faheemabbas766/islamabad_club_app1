class ComplaintResult {
  final String cmId;
  final String cmCat;
  final String ccName;
  final String cmSubCat;
  final String ccsName;
  final String cmIssue;
  final String cciName;
  final String cmMsg;
  final String cmFile;
  final String cmStatus;
  final String cmSysDate;
  final String cmUsrRef;
  final String cmLevel;

  ComplaintResult({
    required this.cmId,
    required this.cmCat,
    required this.ccName,
    required this.cmSubCat,
    required this.ccsName,
    required this.cmIssue,
    required this.cciName,
    required this.cmMsg,
    required this.cmFile,
    required this.cmStatus,
    required this.cmSysDate,
    required this.cmUsrRef,
    required this.cmLevel,
  });

  factory ComplaintResult.fromJson(Map<String, dynamic> json) {
    return ComplaintResult(
      cmId: json['cm_id'],
      cmCat: json['cm_cat'],
      ccName: json['cc_name'],
      cmSubCat: json['cm_sub_cat'],
      ccsName: json['ccs_name'],
      cmIssue: json['cm_issue'],
      cciName: json['cci_name'],
      cmMsg: json['cm_msg'],
      cmFile: json['cm_file'],
      cmStatus: json['cm_status'],
      cmSysDate: json['cm_sysdate'],
      cmUsrRef: json['cm_usr_ref'],
      cmLevel: json['cm_level'],
    );
  }
}

List<ComplaintResult>? responseDataList;