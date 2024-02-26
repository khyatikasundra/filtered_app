import 'package:equatable/equatable.dart';
import 'package:filter_app/model/category_model.dart';
import 'package:filter_app/model/item_model.dart';

class HomeState extends Equatable {
  final List<ItemModel> filteredList;
  const HomeState({required this.filteredList});

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {
  const HomeInitialState({required super.filteredList});
}

class CategoryItemSuccessfulSelected extends HomeState {
  final List<CategoryModel> categoryList;
  const CategoryItemSuccessfulSelected(
      {required super.filteredList, required this.categoryList});
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class PriceRangeSuccessfulSelected extends HomeState {
  const PriceRangeSuccessfulSelected({required super.filteredList});
   @override
  List<Object?> get props => [identityHashCode(this)];
}
