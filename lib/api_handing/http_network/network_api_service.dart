import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tranvision_customer_app/api_handing/http_network/base_api_service.dart';
import 'package:tranvision_customer_app/app_exception/exception.dart';

class NetworkApiServices implements BaseApiService {
  @override
  Future fetchGetApiResponse(String url) async {
    dynamic jsonResponse;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 15));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return jsonResponse;
  }

  @override
  Future fetchGetPostApiResponse(String url, dynamic data) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 15));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());

      default:
        throw FetchDataException(
            "Errro Occurred While Commnuicating with server" +
                "With Status code" +
                response.statusCode.toString());
    }
  }
}
