import 'package:equatable/equatable.dart';
import 'package:filter_app/model/category_model.dart';
import 'package:filter_app/model/item_model.dart';
import 'package:filter_app/model/price_model.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class FilteredInitialListPassSuccessful extends HomeState {
  final List<ItemModel> filteredList;
  final List<CategoryModel> categoryList;
  final List<PriceRangeModel> priceList;
  FilteredInitialListPassSuccessful(
      {required this.filteredList,
      required this.categoryList,
      required this.priceList});
  @override
  List<Object?> get props =>
      [filteredList, categoryList, priceList, identityHashCode(this)];
}

class LoadingState extends HomeState {}

class FilteredItemSuccessfulSelected extends HomeState {
  final List<ItemModel> filteredList;

  FilteredItemSuccessfulSelected({required this.filteredList});
  @override
  List<Object?> get props => [filteredList, identityHashCode(this)];
}

class CategoryItemSelected extends HomeState {
  final List<CategoryModel> categoryList;

  CategoryItemSelected({required this.categoryList});
  @override
  List<Object?> get props => [categoryList, identityHashCode(this)];
}
