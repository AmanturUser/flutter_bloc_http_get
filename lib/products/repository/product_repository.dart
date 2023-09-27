import 'dart:convert';
import 'package:flutter_bloc_http_get/products/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository{
  String productUrl='https://fakestoreapi.com/products';
  Future<List<ProductModel>?> getProduct() async{
    final response = await http.get(Uri.parse(productUrl));
    print(response.statusCode);
    if(response.statusCode==200){
      print(response.body);
      List<ProductModel> products=[];
      final jsonData=jsonDecode(response.body);
      for(var product in jsonData){
        products.add(ProductModel.fromJson(product));

      }
      return products;
    }else{
      print('error');
      print(response.statusCode);
      throw Exception(response.reasonPhrase);
    }

  }
}
