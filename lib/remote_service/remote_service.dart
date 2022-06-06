
import 'package:http/http.dart' as http;


class RemoteService {
  static var client = http.Client();
  // static Future<List<SummaryOnLoad>> fetchSummaryOnLoad() async {
  //   var response = await client.get(Uri.parse(
  //       "http://192.168.1.143:9999/TSVAPI/SqlInterface.svc/BillSummaryOnLoad?partycode=P1210"));
  //   List data = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     return summaryOnLoadFromJson("data");
  //   } else {
  //     throw "Api Failed";
  //   }


 
  }

