import 'dart:convert';

import 'package:http/http.dart' as http;

class ViaCepService {
  Future<Map<String, dynamic>> getAddress(String zipCode) async {
    try {
      final url =
          'https://viacep.com.br/ws/${zipCode.replaceAll('-', '')}/json/';
      http.Response response;
      response = await http.get(url);
      Map<String, dynamic> map = {};
      if (!response.body.contains('erro')) {
        map = json.decode(response.body);
      }
      return map;
    } catch (e) {
      Map<String, dynamic> map = {};
      return map;
    }
  }
}
