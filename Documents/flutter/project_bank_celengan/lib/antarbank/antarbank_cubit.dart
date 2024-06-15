import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_login_api/antarbank/antarbank_view.dart';

Future<List<Bank>> fetchBanks() async {
  Dio dio = Dio();


  final response = await dio.get(
    'http://localhost:8081/transaction/list-bank'
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.data);
    final List<dynamic> banksJson = data['Data'];

    return banksJson.map((json) => Bank.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load banks');
  }
}
