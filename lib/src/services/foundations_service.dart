import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:covid_19/src/models/foundation.dart';

class FoundationsService {
  Future<List<Foundation>> fetchFoundations() async {
    List<Foundation> foundations;

    try {
      final http.Response response = await http.get(
        'http://35.196.67.153:3100/inicio',
      );
      final Iterable<dynamic> list = json.decode(response.body)['data'];
      foundations = list.map((e) => Foundation.fromJson(e)).toList();
    } on SocketException {
      throw const SocketException('SocketException: Voló todo');
    } catch (e) {
      throw Exception(e);
    }

    return foundations;
  }
}
