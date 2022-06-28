class PolApi {
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
}
