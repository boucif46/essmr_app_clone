import 'package:essamar/models/product_model.dart';
import 'package:essamar/services/shared_prefrences_service.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  late Future<List<Product>> _futureFavoriteProducts;

  @override
  void initState() {
    super.initState();
   
    
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorite Products'),
      ),
      body: FutureBuilder<List<Product>>(
        future: MySharedPreferencesManager.getFavoriteProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final favoriteProducts = snapshot.data!;
            if (favoriteProducts.isEmpty) {
              return const Center(
                child: Text('You have no favorite products.'),
              );
            }
            return ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoriteProducts[index];
                return ListTile(
                  leading: Image.network("http://127.0.0.1:8000" + product.imageUrl),
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await MySharedPreferencesManager.removeFavoriteProduct(product.id);
                      setState(() {
                        _futureFavoriteProducts = MySharedPreferencesManager.getFavoriteProducts();
                      });
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred while loading your favorite products.${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
