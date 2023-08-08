import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:jurusan_polnep/jurusan.dart';

String api = 'https://tugashafiz.my.id/api/apijurusan';

class HttpHelper {
  Future<List> getJurusan() async {
    final String getApi = api;
    Response result = await get(Uri.parse(getApi));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final jurusanMap = jsonResponse['data'];
      List jurusan = jurusanMap.map((i) => Jurusan.fromJson(i)).toList();
      return jurusan;
    } else {
      return [];
    }
  }
}
