import 'dart:convert';

import 'package:crud/model/user_post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class UserPostController extends ChangeNotifier{

  List <PostModel> _post = [];

 List<PostModel> get post =>_post;

  Future<void> fetchPost()async{
    final response = await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if(response.statusCode == 200){
      print('Success');
      final decodedPost = jsonDecode(response.body) as List;
      _post = decodedPost.map((e)=> PostModel.fromJson(e)).toList();
      notifyListeners();

    }else{
      print('Error');
      throw Exception('Failed to load post');
    }

  }
}