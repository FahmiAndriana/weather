import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_lagi/models/cuacaModel.dart';
import 'package:latihan_lagi/models/wilayahModel.dart';
import 'package:http/http.dart' as http;

class cuacaController extends GetxController {
  List<Wilayah> allWilayah = [];

  Future<List<Wilayah>?> getAllWilayah() async {
    Uri url =
        Uri.parse("https://ibnux.github.io/BMKG-importer/cuaca/wilayah.json");
    var res = await http.get(url);
    List data = (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    if (data.isEmpty) {
      return [];
    } else {
      allWilayah = data.map((e) => Wilayah.fromJson(e)).toList();
      return allWilayah;
    }
  }

  Future<List<cuacaModel>> getAllJuz(int? id) async {
    List<cuacaModel> allCuaca = [];
    Uri url = Uri.parse("https://api.quran.gading.dev/juz/$id");
    var res = await http.get(url);
    Map<String, dynamic> data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    cuacaModel cuaca = cuacaModel.fromJson(data);
    allCuaca.add(cuaca);
    return allCuaca;
  }
}
