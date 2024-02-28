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
  List<PriceModel> _priceList = [];
  int _selectedPriceIndex = 0;
  HomeBloc() : super(HomeInitialState()) {
    on<GetInitialDataEvent>(_getInitialData);
    on<GetFilteredListEvent>(_getFilteredList);
    on<CategorySelectionEvent>(_categorySelection);
    on<PriceSelectionEvent>(_priceSelection);
    on<ItemLikeUnlikeEvent>(_itemLikeUnlike);
  }
  FutureOr<void> _getInitialData(
      GetInitialDataEvent event, Emitter<HomeState> emit) {
    _filteredList = itemList;
    _categoryList = categoryList;
    _priceList = priceRangeList;
    emit(OnGetInitialDataSuccessful(
        filteredList: _filteredList,
        categoryList: _categoryList,
        priceList: _priceList));
  }

  List<ItemModel> _getFilterItems(List<Category> selectedCategories,
      PriceModel range, List<ItemModel> allItems) {
    return allItems
        .where((e) =>
            (range.maxPrice == null
                ? e.prices >= range.minPrice
                : (e.prices >= range.minPrice &&
                    e.prices <= range.maxPrice!)) &&
            (selectedCategories.isEmpty ||
                selectedCategories.contains(e.category)))
        .toList();
  }

  FutureOr<void> _getFilteredList(
      GetFilteredListEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    List<Category> selectedCategories = _categoryList
        .where((element) => element.isSelected)
        .map((e) => e.category)
        .toList();
    PriceModel range = _priceList[_selectedPriceIndex];
    
    _filteredList = _getFilterItems(selectedCategories, range, itemList);

    emit(OnGetFilteredItemList(filteredList: _filteredList));
  }

  FutureOr<void> _categorySelection(
      CategorySelectionEvent event, Emitter<HomeState> emit) {
    _categoryList[event.index].isSelected =
        !_categoryList[event.index].isSelected;
    emit(OnCategorySelectionState(categoryList: _categoryList));
  }

  FutureOr<void> _priceSelection(
      PriceSelectionEvent event, Emitter<HomeState> emit) {
    _selectedPriceIndex = event.index;
    emit(OnPriceSelectionState(priceListSelectedIndex: _selectedPriceIndex));
  }

  FutureOr<void> _itemLikeUnlike(
      ItemLikeUnlikeEvent event, Emitter<HomeState> emit) {
    _filteredList[event.index].isFavorite =
        !_filteredList[event.index].isFavorite;

    emit(OnGetFilteredItemList(filteredList: _filteredList));
  }
}
