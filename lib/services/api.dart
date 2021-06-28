import 'package:dio/dio.dart';

class Api {
  static final String _baseUrl = 'tourist-iade.herokuapp.com';
  // static final String _baseUrl = '10.0.2.2';
  static final String _prefixes = '/api';
  static final int _port = 3000;
  static bool _ssh = false;
  static bool _portEnabled = false;

  static String _getUri(String url) {
    String uri = '';
    if (_ssh)
      uri += 'https://';
    else
      uri += 'http://';

    uri += _baseUrl;

    if (_portEnabled) uri += ':' + _port.toString();

    uri += _prefixes;

    uri += url;

    return uri;
  }

  static Future<dynamic> get(url) async {
    String uri = _getUri(url);
    var res = await Dio().get(uri);
    return res.data;
  }

  static Future<Map<String, dynamic>> post(url, body) async {
    String uri = _getUri(url);
    var res = await Dio().post(uri, data: body);
    return res.data;
  }

  static Future<Map<String, dynamic>> put(url, body) async {
    String uri = _getUri(url);
    var res = await Dio().put(uri, data: body);
    return res.data;
  }

  static String getUrlStatic(url) {
    // return 'http://$_baseUrl:$_port$url';
    String uri = '';
    if (_ssh)
      uri += 'https://';
    else
      uri += 'http://';

    uri += _baseUrl;

    if (_portEnabled) uri += ':' + _port.toString();

    uri += url;

    return uri;
  }
}
