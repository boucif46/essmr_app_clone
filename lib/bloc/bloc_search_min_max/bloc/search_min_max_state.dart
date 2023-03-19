part of 'search_min_max_bloc.dart';

abstract class SearchMinMaxState extends Equatable {
  const SearchMinMaxState();
  
  @override
  List<Object> get props => [];
}

class SearchMinMaxInitial extends SearchMinMaxState {}
class SearchMinMaxLoading extends SearchMinMaxState {}


class SearchMinMaxLoaded extends SearchMinMaxState {

  final List<Product> products ;

const SearchMinMaxLoaded({required this.products});

}
class SearchMinMaxLoadingFailure extends SearchMinMaxState {
  final String errorMessage;
  const SearchMinMaxLoadingFailure(this.errorMessage);
}
