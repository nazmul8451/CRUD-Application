import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:crud/Utils/urls.dart';
import 'package:crud/model/prodcut_model.dart';
import 'package:http/http.dart';

class ProductController extends ChangeNotifier {
  List<Data> products = [];

  Future<void> getData() async {
    final response = await get(Uri.parse(Urls.readProduct));

    print(response.statusCode);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      ProductModel productModel = ProductModel.fromJson(data);
      products = productModel.data ?? [];
      notifyListeners();
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<void> deleteData(String id) async {
    final response = await get(Uri.parse(Urls.deleteProduct(id)));

    print(response.statusCode);
    if (response.statusCode == 200) {
      products.removeWhere((element) => element.sId == id);
      print('Deleted product');
      notifyListeners();
    } else {
      throw Exception('Failed to delete product');
    }
  }

  Future<void> createProduct(
    String productName,
    String productImage,
    int Qty,
    int UnitPrice,
    int TotalPrice,
  ) async {
    final Map<String, dynamic> requestBody = {
      "ProductName": productName,
      "ProductCode": DateTime.now().microsecondsSinceEpoch,
      "Img": productImage,
      "Qty": Qty,
      "UnitPrice": UnitPrice,
      "TotalPrice": TotalPrice,
    };

    final response = await post(
      Uri.parse(Urls.createProduct),
      body: jsonEncode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Product added Successfully');
     await getData();
    } else {
      print('❌ Failed to add product: ${response.statusCode}');
      throw Exception('Failed to add product');
    }
  }

  Future<void> updateProduct(
      String id,
      String productName,
      String img,
      int qty,
      int unitPrice,
      int totalPrice,)async{
    Map<String,dynamic> requestBody = {
      "ProductName": productName,
      "ProductCode": DateTime.now().microsecondsSinceEpoch,
      "Img": img,
      "Qty": qty,
      "UnitPrice": unitPrice,
      "TotalPrice": totalPrice,
    };
    try{
      final response = await post(Uri.parse(Urls.updateProduct(id)),
        headers: {'Content-Type':'application/json',},
        body: jsonEncode(requestBody),
      );
      if(response.statusCode == 200){
        print('Product update Successfully');

        getData();
        notifyListeners();
      }else{
        print('Failed to Update Product');
      }
    }catch(e){
      print('Error: $e');
    }
  }

}
