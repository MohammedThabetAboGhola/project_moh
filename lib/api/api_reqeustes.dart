import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_settings.dart';

class ApiRequests {
  Future <String> getData() async {
    var response = await http.get(Uri.parse(ApiSettings.API_URL));
    // print(res.body);

    // print('mohammmed : $response');

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      return "sueccs";
    }

    return 'error';
  }

  Future getUsers() async {
    // var response = await http.get(Uri.parse(ApiSettings.USER));
    // print(response.body);

    // if (response.statusCode == 200) {
    //   var jsonResponse = jsonDecode(response.body);
    //   var jsonArray = jsonResponse['data'] as List;
    //   return jsonArray.map((e) => Student.fromJson(e)).toList();
    // }
    // return [];
  }
}
