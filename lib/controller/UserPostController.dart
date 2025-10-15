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
      print('✅ Success: Data fetched');
      final decodedPost = jsonDecode(response.body) as List;
      _post = decodedPost.map((element)=> PostModel.fromJson(element)).toList();
      /*
      এখন আমাদের দরকার: এই Map গুলাকে Dart object এ convert করা

আমাদের Model class হলো PostModel, যার ভেতরে factory PostModel.fromJson() method আছে।

অর্থাৎ,
যখন আমরা লিখি:

PostModel.fromJson(e)


তখন e মানে একেকটা Map, আর সেটা থেকে একটা PostModel object তৈরি হয়।

🔹 তাহলে .map() এর কাজ কী?

decodedPost.map() মানে হলো →
List টার প্রতিটা element e এর জন্য একটা কাজ করো।

এই কাজটা হচ্ছে PostModel.fromJson(e) —
মানে প্রতিটা map কে model object এ রূপান্তর করো।

এরপর .toList() দিলে
এগুলো একসাথে একটা নতুন List<PostModel> এ পরিণত হয়।

🔹 অর্থাৎ সংক্ষেপে:
_post = decodedPost.map((e) => PostModel.fromJson(e)).toList();


এর কাজ হলো:
JSON এর list of map → Dart এর list of PostModel এ convert করা
       */
      notifyListeners();

    }else{
      print('Error');
      throw Exception('Failed to load post');
    }

  }
}