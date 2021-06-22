import 'dart:convert';

import 'package:dio/dio.dart';

class Api {
  static final String _baseUrl = '10.0.2.2';
  static final String _prefixes = '/api';
  static final int _port = 3000;

  static Future<Map<String, dynamic>> get(url) async {
    var res = await Dio().get('http://$_baseUrl:$_port$_prefixes$url');
    print(res);

    return res.data;
    // HttpClient client = HttpClient();
    // var req = await client.get(_baseUrl, _port, _prefixes + url);
    // HttpClientResponse res = await req.close();
    // Map<String, dynamic> r;
    // res.transform(utf8.decoder).listen((data) {
    //   r = json.decode(data);
    // });
    // return r;
  }

  static String getUrlStatic(url) {
    return 'http://$_baseUrl:$_port$url';
  }
}
