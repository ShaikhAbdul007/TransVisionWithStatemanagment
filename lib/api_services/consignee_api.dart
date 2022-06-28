class ConsigneeApi {
  static String consigneeLoginUrl(dynamic username) {
    final String consigneeProfileApi =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/consigneedata?username=$username";

    final String consigneeProfileApis =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/consigneedata?username=$username";

    return consigneeProfileApis;
  }
}
