import 'dart:convert';

import 'package:essamar/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferencesManager {
  static const String _favoriteProductsKey = 'favorite_products';

  static Future<SharedPreferences> get _preferences async =>
      await SharedPreferences.getInstance();

  static Future<List<Product>> getFavoriteProducts() async {
    final prefs = await _preferences;
    final favoriteProductsJson = prefs.getString(_favoriteProductsKey);
    if (favoriteProductsJson != null) {
      final favoriteProductsList = json.decode(favoriteProductsJson) as List;
      return favoriteProductsList
          .map((productJson) => Product.fromJson(productJson))
          .toList();
    }
    return [];
  }

static Future<void> addFavoriteProduct(Product product) async {
  final prefs = await _preferences;
  final favoriteProductsJson = prefs.getString(_favoriteProductsKey);
  List<Product> favoriteProducts = [];
  if (favoriteProductsJson != null) {
    final favoriteProductsList = json.decode(favoriteProductsJson) as List;
    favoriteProducts = favoriteProductsList
        .map((productJson) => Product.fromJson(productJson))
        .toList();
  }

  if (favoriteProducts.any((p) => p.id == product.id)) {
    print('already exist ');
    return;
  }

  favoriteProducts.add(product);

  final updatedFavoriteProductsJson =
      json.encode(favoriteProducts.map((product) => product.toJson()).toList());
  await prefs.setString(_favoriteProductsKey, updatedFavoriteProductsJson);
}



static Future<void> removeFavoriteProduct(int productId) async {
  final prefs = await _preferences;
  final favoriteProductsJson = prefs.getString(_favoriteProductsKey);
  List<Product> favoriteProducts = [];
  if (favoriteProductsJson != null) {
    final favoriteProductsList = json.decode(favoriteProductsJson) as List;
    favoriteProducts = favoriteProductsList
        .map((productJson) => Product.fromJson(productJson))
        .toList();
  }

  favoriteProducts.removeWhere((product) => product.id == productId);

  final updatedFavoriteProductsJson =
      json.encode(favoriteProducts.map((product) => product.toJson()).toList());
  await prefs.setString(_favoriteProductsKey, updatedFavoriteProductsJson);
}


static Future<bool> isFavoriteProduct(int productId) async {
  final prefs = await _preferences;
  final favoriteProductsJson = prefs.getString(_favoriteProductsKey);
  if (favoriteProductsJson != null) {
    final favoriteProductsList = json.decode(favoriteProductsJson) as List;
    final favoriteProducts = favoriteProductsList
        .map((productJson) => Product.fromJson(productJson))
        .toList();
    return favoriteProducts.any((product) => product.id == productId);
  } else {
    return false;
  }
}

}
