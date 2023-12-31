import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class Autogenerated {
  String imsyak = "00.00";
  String shubuh = "00.00";
  String dzuhur = "00.00";
  String terbit = "00.00";
  String magrib = "00.00";
  String isya = "00.00";
  String ashr = "00.00";

  Autogenerated();

  String urlBase =
      "https://raw.githubusercontent.com/lakuapik/jadwalsholatorg/master/adzan/";
  String namakota = "Kota";

  void getJadwal() async {
    String url = "$urlBase$namakota/2022/12.json";
    Response result = await get(Uri.parse(url));
    if (result.statusCode == HttpStatus.ok) {
      final jsonres = jsonDecode(result.body);
      print(jsonres);
      imsyak = jsonres[0]['imsyak'];
      shubuh = jsonres[0]['shubuh'];
      dzuhur = jsonres[0]['dzuhur'];
      terbit = jsonres[0]['terbit'];
      magrib = jsonres[0]['magrib'];
      isya = jsonres[0]['isya'];
      ashr = jsonres[0]['ashr'];
    }
  }

  final String urlSearchBase =
      'https://raw.githubusercontent.com/lakuapik/jadwalsholatorg/master/kota.json';

  Future<List> getUpcoming() async {
    Response result = await get(Uri.parse(urlSearchBase));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      return jsonResponse;
    } else {
      return [];
    }
  }
}
