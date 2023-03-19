import 'package:equatable/equatable.dart';


import 'package:essamar/models/product_model.dart';

enum ProductStatus { loading, success, error }

class ProductState extends Equatable {
  final ProductStatus status;
  final List<Product> product;
  final bool hasReachedMax;
  final String errorMessage;

  const ProductState(
      {this.status = ProductStatus.loading,
      this.hasReachedMax = false,
      this.product = const [],
      this.errorMessage = ""});

  ProductState copyWith({
    ProductStatus? status,
    List<Product>? Product,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return ProductState(
      status: status ?? this.status,
      product: Product ?? this.product,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, product, hasReachedMax, errorMessage];
}

