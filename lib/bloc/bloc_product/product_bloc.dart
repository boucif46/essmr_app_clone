
import 'package:essamar/bloc/bloc_product/product_event.dart';
import 'package:essamar/bloc/bloc_product/product_state.dart';
import 'package:essamar/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product_model.dart';
import '../../services/shared_prefrences_service.dart';

class ProductsBloc extends Bloc<ProductEvent, ProductState> {
  ProductsBloc() : super(const ProductState()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetProductEvent) {
        if (state.hasReachedMax) return;
        try {
          if (state.status == ProductStatus.loading) {
            final products = await ApiServices.getProducts();
            List<Product> favouriteProduct  = await MySharedPreferencesManager.getFavoriteProducts();
            print('here iam in bloc');
                   for (var product in products) {
                          for (var element in favouriteProduct) {
                            if(product.id == element.id){
                              product.isFavourite =true ;
                            }
                          }
                        }
            return products.isEmpty
                ? emit(state.copyWith(
                    status: ProductStatus.success, hasReachedMax: true))
                : emit(state.copyWith(
                    status: ProductStatus.success,
                    Product: products,
                    hasReachedMax: false));
          } else {
            final product = await ApiServices.getProducts(state.product.length);
            List<Product> favouriteProduct  = await MySharedPreferencesManager.getFavoriteProducts();
            print('here iam in bloc');
                   for (var product in product) {
                          for (var element in favouriteProduct) {
                            if(product.id == element.id){
                              product.isFavourite =true ;
                            }
                          }
                        }
            product.isEmpty
                ? emit(state.copyWith(hasReachedMax: true))
                : emit(state.copyWith(
                    status: ProductStatus.success,
                    Product: List.of(state.product)..addAll(product),
                    hasReachedMax: false));
          }
        } catch (e) {
          emit(state.copyWith(
              status: ProductStatus.error, errorMessage: "failed to fetch posts"));
        }
      }
    });
  }
}