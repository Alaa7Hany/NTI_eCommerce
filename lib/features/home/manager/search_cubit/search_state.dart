import '../../../../core/data/models/product_model.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<ProductModel> searchResults;
  SearchSuccessState(this.searchResults);
}

class SearchErrorState extends SearchState {
  final String error;
  SearchErrorState(this.error);
}
