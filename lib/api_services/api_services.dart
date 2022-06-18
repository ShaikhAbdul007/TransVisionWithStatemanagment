class ApiServices {
  static String consigneeLoginUrl(dynamic username) {
    final String consigneeProfileApis =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/consigneedata?username=$username";

    final String consigneeProfileApi =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/consigneedata?username=$username";

    return consigneeProfileApis;
  }

  static String loginUrl(dynamic username, dynamic password) {
    final String loginApis =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/login?username=$username&password=$password";

    final String loginApi =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/login?username=$username&password=$password";

    return loginApis;
  }

  static String icdFromUrls =
      "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/icdfrom/";

  static String icdFromUrl =
      "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/icdfrom/";

  static String icdToUrl(dynamic value) {
    final String icdTos =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/icdto?icd=$value";

    final String icdTo =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/icdto?icd=$value";

    return icdTos;
  }

  static String polUrl =
      "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/pol/";

  static String polUrls =
      "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/pol/";

  static String destinationUrl(dynamic value) {
    final String destinationUrl =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/pod?port=$value";

    final String destinationUrls =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/pod?port=$value";

    return destinationUrls;
  }

  static String typeUrl(dynamic value) {
    final String types =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/contType?contSize=$value";

    final String type =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/contType?contSize=$value";

    return types;
  }

  static String billSummaryUrl(dynamic username) {
    final String billSummarys =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/BillSummaryOnLoad?partycode=$username";

    final String billSummary =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/BillSummaryOnLoad?partycode=$username";

    return billSummarys;
  }

  static String billSummaryDateUrl(dynamic username,
      dynamic billSummaryFromDate, dynamic billSummaryToDate) {
    final String billSummaryDate =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/BillSummarywithdate?partycode=$username&fromdate=$billSummaryFromDate&todate=$billSummaryToDate";

    final String billSummaryDates =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/BillSummarywithdate?partycode=$username&fromdate=$billSummaryFromDate&todate=$billSummaryToDate";
    return billSummaryDate;
  }

  static String doSlipUrl(dynamic username) {
    final String doSlip =
        "http://portal.transvisionshipping.com:9999/TSVAPI/sqlinterface.svc/DoslipDataBind?partycode=$username";

    final String doSlips =
        " http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/DoslipDataBind?partycode=$username";

    return doSlip;
  }

  static String vesselUrl(dynamic username) {
    final String vessel =
        "http://portal.transvisionshipping.com:9999/TSVAPI/sqlinterface.svc/vesselname?partycode=$username";

    final String vessels =
        " http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/vesselname?partycode=$username";

    return vessels;
  }

  static String voyageUrl(dynamic username, dynamic value) {
    final String voyages =
        " http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/voyagename?partycode=$username&vesselname=$value";

    final String voyage =
        " http://portal.transvisionshipping.com:9999/TSVAPI/sqlinterface.svc/voyagename?partycode=$username&vesselname=$value";

    return voyages;
  }

  static String loadingListUrl(
      dynamic username, dynamic vesselName, dynamic voyageName) {
    final String loadingList =
        "http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/LoadingList?vesselname=$vesselName&voyagename=$voyageName&partycode=$username";
    return loadingList;
  }

  static String reportUrl(dynamic username) {
    final String reports =
        "http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/BookingReportonload?partycode=$username";

    final String report =
        "http://portal.transvisionshipping.com:9999/TSVAPI/sqlinterface.svc/BookingReportonload?partycode=$username";

    return reports;
  }

  static String reportRefreshUrl(
      dynamic username, dynamic reportFromDate, dynamic reportToDate) {
    final String reports =
        "http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/BookingReportonrefresh?partycode=$username&from=$reportFromDate&to=$reportToDate";

    final String report =
        "http://portal.transvisionshipping.com:9999/TSVAPI/sqlinterface.svc/BookingReportonrefresh?partycode=$username&from=$reportFromDate&to=$reportToDate";

    return reports;
  }

  static String bookingApi =
      "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/insertonlinebooking";
  static String bookingApis =
      "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/insertonlinebooking";
}
