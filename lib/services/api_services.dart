import 'dart:convert';
import 'package:essamar/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

   static Future<List<Product>> getProducts([int startIndex = 0, int limit = 10]) async {
    
    final response = await http.get(Uri.parse('$baseUrl/getproduct?startIndex=$startIndex&limit=$limit'));
    print("start index is "+startIndex.toString());
    if (response.statusCode == 200) {
  
      final jsonData = json.decode(response.body)["product"];
   
      List<Product> products = [];
      for (var item in jsonData) {
       
        try {
           products.add(Product.fromJson(item));
        } catch (e) {
          print(e);
          throw Exception(e);
        }
       
      }
      
      return products;
    } else {
      print('product not ');
      throw Exception('Failed to load products');
    }
  }


  static Future<List<Product>> getProductsbyMinMax(String tag,int min,int max) async {
    print("min $min max $max tag $tag");
    final response = await http.get(Uri.parse('$baseUrl/search?tags=$tag,boite&min_price=$min&max_price=$max'));
       
    if (response.statusCode == 200) {
  
      final jsonData = json.decode(response.body)["product"];
   
      List<Product> products = [];
      for (var item in jsonData) {
       
        try {
           products.add(Product.fromJson(item));
        } catch (e) {
          print(e);
          throw Exception(e);
        }
       
      }
      
      return products;
    } else {
      print('product not ');
      throw Exception('Failed to load products');
    }
  }
}
