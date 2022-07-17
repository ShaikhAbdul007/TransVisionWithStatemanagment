import 'package:tranvision_customer_app/api_handing/response/response_status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.message, this.data);

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed() : status = Status.completed;

  ApiResponse.error() : status = Status.error;

  @override
  String toString() {
    return "Status: $status\n Message: $message\n Data: $data";
  }
}
