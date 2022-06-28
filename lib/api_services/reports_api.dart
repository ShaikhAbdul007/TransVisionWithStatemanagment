class ReportApis {
  static String reportUrl(dynamic username) {
    final String report =
        "http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/BookingReportonload?partycode=$username";

    final String reports =
        "http://portal.transvisionshipping.com:9999/TSVAPI/sqlinterface.svc/BookingReportonload?partycode=$username";

    return reports;
  }

  static String reportRefreshUrl(
      dynamic username, dynamic reportFromDate, dynamic reportToDate) {
    final String report =
        "http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/BookingReportonrefresh?partycode=$username&from=$reportFromDate&to=$reportToDate";

    final String reports =
        "http://portal.transvisionshipping.com:9999/TSVAPI/sqlinterface.svc/BookingReportonrefresh?partycode=$username&from=$reportFromDate&to=$reportToDate";
    return reports;
  }
}
