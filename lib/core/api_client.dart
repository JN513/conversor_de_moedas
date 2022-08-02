import 'package:finance_utilities/utils/constants.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<double> getCurrentCotation(String from, String to) async{
  final response = await http.get(Uri.parse(url+"?f=$from&to=$to"));

  if (response.statusCode == 200) {
    return jsonDecode(response.body)["valor"];
  } else {
    throw Exception('Falha ao buscar cotação');
  }
}
