import 'package:dio/dio.dart';

class Api {
  static final String _baseUrl = '10.0.2.2';
  static final String _prefixes = '/api';
  static final int _port = 3000;

  static Future<dynamic> get(url) async {
    String uri = 'http://$_baseUrl:$_port$_prefixes$url';
    var res = await Dio().get(uri);
    return res.data;
  }

  static Future<Map<String, dynamic>> post(url, body) async {
    String uri = 'http://$_baseUrl:$_port$_prefixes$url';
    var res = await Dio().post(uri, data: body);
    return res.data;
  }

  static Future<Map<String, dynamic>> put(url, body) async {
    String uri = 'http://$_baseUrl:$_port$_prefixes$url';
    var res = await Dio().put(uri, data: body);
    return res.data;
  }

  static String getUrlStatic(url) {
    return 'http://$_baseUrl:$_port$url';
  }
}
