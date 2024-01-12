import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tugas_search_flutter/apiservice.dart';
import 'package:tugas_search_flutter/response.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_search_flutter/ui/search.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final apiService = ApiService();
  List listPost = [];

  //agak ga yakin sama ini
  Future<PostResponse?> getPosts() async {
    try {
      // IP address yang dipake sesuaikan sama ip address di laptop
      // buka cmd ketikkan ipconfig
      final response = await http
          .get(Uri.parse('http://172.20.10.4/flutterapi/crudflutter/db.php'));
      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          listPost = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getPosts();
    print(listPost);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            //manggil class dari search delegate nya
            onPressed: () {
              showSearch(context: context,  delegate: DataSearch((query) {
                print(query);
              }));
              debugPrint('Test cari');
              // apiService.searchData(query);

              // Tambahkan logika pencarian di sini
            }, icon: const Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
          itemCount: listPost.length,
          itemBuilder: ((context, index) {
            return Card(
              child: ListTile(
                title: Text(listPost[index]['nama']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(listPost[index]['nim']),
                    Text(listPost[index]['prodi']),
                    Text(listPost[index]['alamat']),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
