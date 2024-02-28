import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:filter_app/model/category_model.dart';
import 'package:filter_app/model/item_model.dart';
import 'package:filter_app/model/price_model.dart';
import 'package:filter_app/view/home/bloc/home_event.dart';
import 'package:filter_app/view/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<ItemModel> _filteredList = [];
  List<CategoryModel> _categoryList = [];
  List<PriceRangeModel> _priceList = [];
  int index = 0;
  HomeBloc() : super(HomeInitialState()) {
    on<GetFilteredList>(_getFilteredList);
    on<FilteredListEmittingEvent>(_passingFilteredList);
    on<OnCategorySelectionEvent>(_categorySelection);
    on<OnPriceRangeSelectionEvent>(_priceSelection);
    on<OnClickFavoriteIconEvent>(_likeButtonPressed);
  }
  FutureOr<void> _getFilteredList(
      GetFilteredList event, Emitter<HomeState> emit) {
    _filteredList = itemList;
    _categoryList = categoryList;
    _priceList = priceRangeList;
    emit(FilteredInitialListPassSuccessful(
        filteredList: _filteredList,
        categoryList: _categoryList,
        priceList: _priceList));
  }

  List<ItemModel> _getFilterItems(List<GroceryCategory> selectedCategories,
      PriceRangeModel range, List<ItemModel> allItems) {
    return allItems
        .where((e) =>
            (range.maxPrice == null
                ? e.prices >= range.minPrice
                : (e.prices >= range.minPrice &&
                    e.prices <= range.maxPrice!)) &&
            (selectedCategories.isEmpty ||
                selectedCategories.contains(e.groceryCategory)))
        .toList();
  }

  FutureOr<void> _passingFilteredList(
      FilteredListEmittingEvent event, Emitter<HomeState> emit) async {
    List<GroceryCategory> selectedCategories = _categoryList
        .where((element) => element.isSelected)
        .map((e) => e.groceryCategory)
        .toList();
    PriceRangeModel range = _priceList[index];
    _filteredList = _getFilterItems(selectedCategories, range, itemList);
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(FilteredItemSuccessfulSelected(filteredList: _filteredList));
  }

  FutureOr<void> _categorySelection(
      OnCategorySelectionEvent event, Emitter<HomeState> emit) {
    _categoryList[event.index].isSelected =
        !_categoryList[event.index].isSelected;
    emit(CategoryItemSelected(categoryList: _categoryList));
  }

  FutureOr<void> _priceSelection(
      OnPriceRangeSelectionEvent event, Emitter<HomeState> emit){
    index = event.index;
    emit(HomeInitialState());
  }

  FutureOr<void> _likeButtonPressed(
      OnClickFavoriteIconEvent event, Emitter<HomeState> emit) {
    _filteredList[event.index].isFavorite =
        !_filteredList[event.index].isFavorite;

    emit(FilteredItemSuccessfulSelected(filteredList: _filteredList));
  }
}
