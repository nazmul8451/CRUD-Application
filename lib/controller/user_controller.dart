import 'dart:convert';

import 'package:crud/Utils/urls.dart';
import 'package:crud/model/user_model.dart';
import 'package:http/http.dart';

import '../model/user_details_model.dart';

class UserController{
  Future<List<UserModel>> getUser()async{
    final response = await get(Uri.parse(UserApi.allUser));

    if(response.statusCode == 200){
      print('✅ Success: Data fetched');

      final List list = jsonDecode(response.body);

      return list.map((element)=> UserModel.fromJson(element)).toList();
    }else{
      throw Exception('Get user list failed');
    }
  }

 static Future<UserDetailsModel> getUserDetails(String id) async{
    final response = await get(Uri.parse('${UserApi.getUserDetails}/$id'));

    if(response.statusCode == 200){
      print('Status code: ${response.statusCode}');

      final decodedData = jsonDecode(response.body);

      return UserDetailsModel.fromJson(decodedData);

    }else{
      print('Error : ${response.statusCode}');
      throw Exception('Error : ${response.statusCode}');
    }

  }
}