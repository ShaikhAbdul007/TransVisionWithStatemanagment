abstract class BaseApiService {
  Future<dynamic> fetchGetApiResponse(String url);

  Future<dynamic> fetchGetPostApiResponse(String url, dynamic data);
}
