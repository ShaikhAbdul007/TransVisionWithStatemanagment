class TypeApi {
  static String typeUrl(dynamic value) {
    final String types =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/contType?contSize=$value";

    final String type =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/contType?contSize=$value";

    return types;
  }
}
