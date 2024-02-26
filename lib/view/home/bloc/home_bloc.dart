import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:filter_app/model/category_model.dart';
import 'package:filter_app/model/item_model.dart';
import 'package:filter_app/model/price_model.dart';
import 'package:filter_app/view/home/bloc/home_event.dart';
import 'package:filter_app/view/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<ItemModel> _filteredList = itemList;
  HomeBloc() : super(HomeInitialState(filteredList: itemList)) {
    on<OnCategorySelectionEvent>(_categorySelection);
    on<OnPriceRangeSelectionEvent>(_priceSelection);
  }

  FutureOr<void> _categorySelection(
      OnCategorySelectionEvent event, Emitter<HomeState> emit) {
    categoryList[event.index].isSelected =
        !categoryList[event.index].isSelected;

    _filteredList = itemList
        .where((element) => categoryList.any((category) =>
            category.isSelected &&
            category.groceryCategory == element.groceryCategory))
        .toList();

    emit(CategoryItemSuccessfulSelected(
        filteredList: _filteredList, categoryList: categoryList));
  }

  FutureOr<void> _priceSelection(
      OnPriceRangeSelectionEvent event, Emitter<HomeState> emit) {
    _filteredList = _filteredList
        .where((element) => priceRangeList.any((priceRange) {
              if (priceRangeList[event.index].maxPrice == null &&
                  priceRangeList[event.index].minPrice! <= element.prices) {
                return true;
              } else if (priceRangeList[event.index].minPrice == null &&
                  priceRangeList[event.index].maxPrice! <= element.prices) {
                return true;
              } else if (priceRangeList[event.index].minPrice! <=
                      element.prices &&
                  priceRangeList[event.index].maxPrice! >= element.prices) {
                return true;
              }
              return false;
            }))
        .toList();
    emit(PriceRangeSuccessfulSelected(filteredList: _filteredList));
  }
}
