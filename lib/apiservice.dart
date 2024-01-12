import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_search_flutter/model.dart';

class ApiService {
  List<PostModel> listPost = [];
  Future<List<PostModel>> searchData (String? query) async {
    // IP address yang dipake sesuaikan sama ip address di laptop
    // buka cmd ketikkan ipconfig
    final response = await http.get(Uri.parse('http://172.20.10.4/flutterapi/crudflutter/view_data_like.php/?nama=${query}'));
    debugPrint('Search result : ${response.body}');
    try {
      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body);
        //data yang muncul saat di search dibungkus dalam suatu array/list =>contoh [[data]]
        return listPost = ((data as List)[0] as List).map((i) => PostModel.fromJson(i)).toList();
      }
    } catch (e) {
      print(e);
    }
    return listPost;
  }
}