class LoginApi {
  static String loginUrl(dynamic username, dynamic password) {
    final String loginApis =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/login?username=$username&password=$password";

    final String loginApi =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/login?username=$username&password=$password";

    return loginApis;
  }
}
