import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_search_flutter/apiservice.dart';
import 'package:tugas_search_flutter/model.dart';
// import 'package:tugas_search_flutter/model.dart';
// import 'package:tugas_search_flutt

//class search delegate yang nanti dipanggil
class DataSearch extends SearchDelegate<String> {
  final Function(String) onSearch;

  DataSearch(this.onSearch);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    onSearch(query);
    final apiService = ApiService();
    return Scaffold(
      body: FutureBuilder<List<PostModel>>(
          future: apiService.searchData(query),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              //simpan dlu data ke dalam model post response
              List<PostModel> postResponse = snapshot.data;
              return ListView.builder(
                  itemCount: postResponse.length,
                  itemBuilder: (context, index) {
                    PostModel postModel = postResponse[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text('${postModel.nama.toString()}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${postModel.nim.toString()}"),
                              Text("${postModel.prodi.toString()}"),
                              Text("${postModel.alamat.toString()}"),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              );
            }
            return Center(child: Text('No data available'));
          }
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search Mahasiswa..'),
    );
    // Menampilkan saran pencarian saat pengguna mengetik
  }
}
