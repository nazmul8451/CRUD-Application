import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:crud/Utils/urls.dart';
import 'package:crud/model/prodcut_model.dart';
import 'package:http/http.dart';

class ProductController extends ChangeNotifier{
List <Data> products = [];

  Future<void> getData () async{
    final response = await get(Uri.parse(Urls.readProduct));

    print(response.statusCode);

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      ProductModel productModel = ProductModel.fromJson(data);
      products = productModel.data ?? [];
      notifyListeners();
    }else
      {
        throw Exception('Something went wrong');
      }
  }


Future<void> deleteData (String id) async{
  final response = await get(Uri.parse(Urls.deleteProduct(id)));

  print(response.statusCode);
  if(response.statusCode == 200){
    products . removeWhere((element)=>element.sId == id);
    print('Deleted product');
    notifyListeners();
  }else
  {
    throw Exception('Failed to delete product');
  }
}

}