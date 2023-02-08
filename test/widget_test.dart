import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_lagi/models/wilayahModel.dart';
import 'package:http/http.dart' as http;

void main() {
  List<Wilayah> allWilayah = [];

  Future<List<Wilayah>?> getAllWilayah() async {
    Uri url =
        Uri.parse("hhttps://ibnux.github.io/BMKG-importer/cuaca/wilayah.json");
    var res = await http.get(url);
    List data = (jsonDecode(res.body) as Map<String, dynamic>)["data"];
    print(data);
    if (data.isEmpty) {
      return [];
    } else {
      allWilayah = data.map((e) => Wilayah.fromJson(e)).toList();
      return allWilayah;
    }
  }
}
