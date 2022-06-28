class ShipperApi {
  static String shipperLoginUrl(dynamic username) {
    final String shipperProfileApi =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/shipperuserdata?username=$username";

    final String shipperProfileApis =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/shipperuserdata?username=$username";

    return shipperProfileApis;
  }
}
