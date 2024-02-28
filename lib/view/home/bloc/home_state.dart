import 'package:equatable/equatable.dart';
import 'package:filter_app/model/category_model.dart';
import 'package:filter_app/model/item_model.dart';
import 'package:filter_app/model/price_model.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class OnGetInitialDataSuccessful extends HomeState {
  final List<ItemModel> filteredList;
  final List<CategoryModel> categoryList;
  final List<PriceModel> priceList;
  OnGetInitialDataSuccessful(
      {required this.filteredList,
      required this.categoryList,
      required this.priceList});
  @override
  List<Object?> get props => [filteredList, categoryList, priceList];
}

class HomeLoadingState extends HomeState {}

class OnGetFilteredItemList extends HomeState {
  final List<ItemModel> filteredList;

  OnGetFilteredItemList({required this.filteredList});
  @override
  List<Object?> get props => [filteredList];
}

class OnCategorySelectionState extends HomeState {
  final List<CategoryModel> categoryList;

  OnCategorySelectionState({required this.categoryList});
  @override
  List<Object?> get props => [categoryList];
}

class OnPriceSelectionState extends HomeState {
  final int priceListSelectedIndex;
  OnPriceSelectionState({required this.priceListSelectedIndex});
  @override
  List<Object?> get props => [priceListSelectedIndex];
}
