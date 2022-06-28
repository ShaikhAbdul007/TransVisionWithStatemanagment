class BillSummaryApi {
  static String billSummaryUrl(dynamic username) {
    final String billSummarys =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/BillSummaryOnLoad?partycode=$username";

    final String billSummary =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/BillSummaryOnLoad?partycode=$username";

    return billSummarys;
  }

  static String billSummaryDateUrl(dynamic username,
      dynamic billSummaryFromDate, dynamic billSummaryToDate) {
    final String billSummaryDates =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/BillSummarywithdate?partycode=$username&fromdate=$billSummaryFromDate&todate=$billSummaryToDate";

    final String billSummaryDate =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/BillSummarywithdate?partycode=$username&fromdate=$billSummaryFromDate&todate=$billSummaryToDate";
    return billSummaryDates;
  }
}
