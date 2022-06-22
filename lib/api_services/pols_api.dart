class PolApi {
  static String polUrls =
      "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/pol/";

  static String polUrl =
      "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/pol/";

  static String destinationUrl(dynamic value) {
    final String destinationUrls =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/pod?port=$value";

    final String destinationUrl =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/pod?port=$value";

    return destinationUrls;
  }
}
