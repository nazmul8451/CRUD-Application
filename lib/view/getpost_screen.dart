import 'dart:convert';

import 'package:crud/controller/getpost_without_Controller.dart';
import 'package:crud/model/user_post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class GetpostScreen extends StatefulWidget {
  const GetpostScreen({super.key});

  @override
  State<GetpostScreen> createState() => _GetpostScreenState();
}

class _GetpostScreenState extends State<GetpostScreen> {

  List<PostModel> _post = [];
  bool isLoading = false;



  // onno class theke api access nite hole age ekta object create kore nite hobe
  ApiController apiController = ApiController();


  Future <void> loadData () async {
  if(mounted){
    setState(() {
      isLoading = true;
    });
  }
    try {
      final posts = await apiController.fetchPost();
      setState(() {
        _post = posts;
        isLoading = false;
      });
    }catch(e){
      print('Error : $e');
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get Post Using Get method',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:isLoading ? Center(child: CircularProgressIndicator(),): ListView.builder(
        itemCount: _post.length,
        itemBuilder: (context,index) {
          var post = _post [index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(
                post.title,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(post.body),
            ),
          );
        },
      ),
    );
  }
}
