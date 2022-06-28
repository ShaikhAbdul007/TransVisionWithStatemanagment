class LoadingListApi {
  static String voyageUrl(dynamic username, dynamic value) {
    final String voyage =
        "http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/voyagename?partycode=$username&vesselname=$value";

    final String voyages =
        "http://portal.transvisionshipping.com:9999/TSVAPI/sqlinterface.svc/voyagename?partycode=$username&vesselname=$value";

    return voyages;
  }

  static String vesselUrl(dynamic username) {
    final String vessels =
        "http://portal.transvisionshipping.com:9999/TSVAPI/sqlinterface.svc/vesselname?partycode=$username";

    final String vessel =
        "http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/vesselname?partycode=$username";

    return vessels;
  }

  static String loadingListUrl(
      dynamic username, dynamic vesselName, dynamic voyageName) {
    final String loadingList =
        "http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/LoadingList?vesselname=$vesselName&voyagename=$voyageName&partycode=$username";

    final String loadingLists =
        "http://portal.transvisionshipping.com:9999/TSVAPI/sqlinterface.svc/LoadingList?vesselname=$vesselName&voyagename=$voyageName&partycode=$username";

    return loadingLists;
  }
}
