import 'package:http/http.dart' as http;
import 'package:test_program/model/listmodel.dart';
import 'package:test_program/model/submodel.dart';

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
    
        return [];
      }
    } catch (e) {
      print("Error: $e");
      return [];
    } finally {
      client.close();
    }
    
  }
  Future<List<Sub>>subcategory(String id) async{
    var client=http.Client();
    try{
      var apiurl=Uri.parse("https://coinoneglobal.in/teresa_trial/webtemplate.asmx/FnGetTemplateSubCategoryList?PrmCmpId=1&PrmBrId=2&PrmCategoryId=${id}");
      var response = await client.get(apiurl);

      if(response.statusCode == 200){
        return subFromJson(response.body);
      }
      else {
        return [];
      }
    }
    catch(e){
      print("Error");
      return [];
    }
  }
}
