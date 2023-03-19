import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:essamar/models/product_model.dart';
import 'package:essamar/services/api_services.dart';

part 'search_min_max_event.dart';
part 'search_min_max_state.dart';

class SearchMinMaxBloc extends Bloc<SearchMinMaxEvent, SearchMinMaxState> {
  SearchMinMaxBloc() : super(SearchMinMaxInitial()) {
    on<SearchMinMaxEvent>((event, emit) async {
      if(event is GetProductbyMinMax){
        emit(SearchMinMaxLoading());
        try {
          List<Product> products = await ApiServices.getProductsbyMinMax(event.tag, event.minPrice, event.maxPrice);
          emit(SearchMinMaxLoaded(products: products));
        } catch (e) {
          emit(SearchMinMaxLoadingFailure("Failed to fetch data "+e.toString()));
        }
      }
    });
  }
}
