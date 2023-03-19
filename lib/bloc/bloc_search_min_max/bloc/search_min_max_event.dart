part of 'search_min_max_bloc.dart';

abstract class SearchMinMaxEvent extends Equatable {
  const SearchMinMaxEvent();

  @override
  List<Object> get props => [];

 
}

 class GetProductbyMinMax extends SearchMinMaxEvent{

  final String tag ;
  final int minPrice ;
  final int maxPrice ;
 const  GetProductbyMinMax({required this.minPrice, required this.maxPrice, required this.tag,});
 }