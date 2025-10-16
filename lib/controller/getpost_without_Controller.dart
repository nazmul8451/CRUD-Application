import 'dart:convert';

import 'package:http/http.dart';

import '../model/user_post_model.dart';

class ApiController{
  List<PostModel> _post = [];
  List<PostModel> get post => _post;
  bool isLoading = false;

  Future<List<PostModel>> fetchPost()async{

      Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      final response = await get(url);

      if(response.statusCode == 200)
      {
        print('Your request is success. Status Code: ${response.statusCode}');
        final List<dynamic> jsonData = jsonDecode(response.body);
        print(jsonData);
        return jsonData.map((e) => PostModel.fromJson(e)).toList();
      }else{
        throw Exception('Your request is failed. Status Code: ${response.statusCode}');
      }
    }

}