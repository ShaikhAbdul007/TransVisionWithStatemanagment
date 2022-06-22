class IcdApi {
  static String icdFromUrl =
      "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/icdfrom/";

  static String icdFromUrls =
      "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/icdfrom/";

  static String icdToUrl(dynamic value) {
    final String icdTo =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/icdto?icd=$value";

    final String icdTos =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/icdto?icd=$value";

    return icdTos;
  }
}
