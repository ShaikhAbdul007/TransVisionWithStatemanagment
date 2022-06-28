class IcdApi {
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
}
