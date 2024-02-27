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
  HomeBloc() : super(HomeInitialState(filteredList: itemList)) {
    on<GetFilteredList>(_getFilteredList);
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

  FutureOr<void> _categorySelection(
      OnCategorySelectionEvent event, Emitter<HomeState> emit) async {
    _categoryList[event.index].isSelected =
        !_categoryList[event.index].isSelected;
    emit(CategoryItemSelected(categoryList: _categoryList));
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 2));

    _filteredList = itemList
        .where((element) => categoryList.any((category) =>
            category.isSelected &&
            category.groceryCategory == element.groceryCategory))
        .toList();

    if (_filteredList.isEmpty) {
      _filteredList = itemList;
    }
    emit(FilteredItemSuccessfulSelected(filteredList: _filteredList));
  }

  FutureOr<void> _priceSelection(
      OnPriceRangeSelectionEvent event, Emitter<HomeState> emit) async {
    List<ItemModel> rangeList = _filteredList;

    rangeList = rangeList.where((element) {
      if (_priceList[event.index].maxPrice == null) {
        return element.prices >= _priceList[event.index].minPrice;
      } else {
        return element.prices >= _priceList[event.index].minPrice &&
            element.prices <= _priceList[event.index].maxPrice!;
      }
    }).toList();

    if (event.index == 0) {
      _filteredList = itemList;
    }
    emit(PriceItemSelected(priceList: _priceList));
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(FilteredItemSuccessfulSelected(filteredList: rangeList));
  }

  FutureOr<void> _likeButtonPressed(
      OnClickFavoriteIconEvent event, Emitter<HomeState> emit) {
    _filteredList[event.index].isFavorite =
        !_filteredList[event.index].isFavorite;
    emit(FilteredItemSuccessfulSelected(filteredList: _filteredList));
  }
}
