class BillOfLaddingApi {
  static String billOfLaddingOnLoad(dynamic username) {
    final String onLoads =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/blformonlload?partycode=$username";

    final String onLoad =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/blformonlload?partycode=$username";
    return onLoads;
  }

  static String billOfLaddingOnRefresh(
      dynamic username, dynamic dropdownValue, dynamic billController) {
    final String onrefreshs =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/blformRefresh?partycode=$username&drpsearch=$dropdownValue&txtsearch=$billController";

    final String onrefresh =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/blformRefresh?partycode=$username&drpsearch=$dropdownValue&txtsearch=$billController";
    return onrefreshs;
  }
}
