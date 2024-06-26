import 'package:http/http.dart' as http;
import 'package:test_program/model/listmodel.dart';

class ListApi {
  final String baseUrl = "https://coinoneglobal.in/teresa_trial/webtemplate.asmx/FnGetTemplateCategoryList?PrmCmpId=1&PrmBrId=2";

  Future<List<Data>> listfile() async {
    var client = http.Client();
    try {
      var apiUrl = Uri.parse(baseUrl);
      var response = await client.get(apiUrl);

      if (response.statusCode == 200) {
        return dataFromJson(response.body);
      } else {
        // Handle other status codes appropriately
        return [];
      }
    } catch (e) {
      // Log the error or handle it as necessary
      print("Error: $e");
      return [];
    } finally {
      client.close();
    }
  }
}
