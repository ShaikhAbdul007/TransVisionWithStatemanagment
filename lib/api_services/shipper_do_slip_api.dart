class DoSlipApi {
  static String doSlipUrl(dynamic username) {
    final String doSlips =
        "http://portal.transvisionshipping.com:9999/TSVAPI/sqlinterface.svc/DoslipDataBind?partycode=$username";

    final String doSlip =
        "http://192.168.1.143:9999/TSVAPI/sqlinterface.svc/DoslipDataBind?partycode=$username";

    return doSlips;
  }
}
