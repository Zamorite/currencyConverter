import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response;
    try {
      response = await http.get(url);
    } catch (e) {
      print('[!] Error: $e');
    }
    
    if (response?.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      return decodedData['quotes'];
    } else {
      print(response.statusCode);
    }
  }
}