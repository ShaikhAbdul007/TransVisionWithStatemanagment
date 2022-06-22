class LoginApi {
  static String loginUrl(dynamic username, dynamic password) {
    final String loginApi =
        "http://portal.transvisionshipping.com:9999/TSVAPI/SqlInterface.svc/login?username=$username&password=$password";

    final String loginApis =
        "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/login?username=$username&password=$password";

    return loginApis;
  }
}
