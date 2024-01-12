import 'package:tugas_search_flutter/model.dart';

class PostResponse{
  List <PostModel> listPost = [];

  PostResponse.fromJson(json){
    for(int i = 0; i < json.length; i++){
      PostModel postModel = PostModel.fromJson(json[i]);
      listPost.add(postModel);
    }
  }
}