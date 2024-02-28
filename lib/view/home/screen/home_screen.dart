import 'package:filter_app/model/category_model.dart';
import 'package:filter_app/model/item_model.dart';
import 'package:filter_app/model/price_model.dart';
import 'package:filter_app/string/string_asset.dart';
import 'package:filter_app/view/favorite/screen/favorite_screen.dart';
import 'package:filter_app/view/home/bloc/home_bloc.dart';
import 'package:filter_app/view/home/bloc/home_event.dart';
import 'package:filter_app/view/home/bloc/home_state.dart';
import 'package:filter_app/view/home/widget/category_item_card.dart';
import 'package:filter_app/view/home/widget/filtered_list_card.dart';
import 'package:filter_app/view/home/widget/price_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _homeBloc;
  int _priceListSelectedIndex = 0;
  List<ItemModel> _filteredModelList = [];
  List<CategoryModel> _categoryList = [];
  List<PriceModel> _priceList = [];
  @override
  void initState() {
    _homeBloc = context.read<HomeBloc>();
    _homeBloc.add(GetInitialDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _blocBuilder(),
    );
  }

  BlocBuilder<HomeBloc, HomeState> _blocBuilder() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        _stateEmitted(state);
        return SafeArea(
            child: CustomScrollView(
          slivers: [
            _categoryListBuilder(),
            _priceListBuilder(state),
            _filterListBuilder(state)
          ],
        ));
      },
    );
  }

  void _stateEmitted(HomeState state) {
    if (state is OnGetInitialDataSuccessful) {
      _filteredModelList = state.filteredList;
      _categoryList = state.categoryList;
      _priceList = state.priceList;
    }
    if (state is OnGetFilteredItemList) {
      _filteredModelList = state.filteredList;
    }

    if (state is OnCategorySelectionState) {
      _categoryList = state.categoryList;
      _homeBloc.add(GetFilteredListEvent());
    }
    if (state is OnPriceSelectionState) {
      _priceListSelectedIndex = state.priceListSelectedIndex;
      _homeBloc.add(GetFilteredListEvent());
    }
  }

  AppBar _appBar() {
    return AppBar(title: Text(StringAsset.appBarTitleFiltering), actions: [
      IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FavoriteScreen()));
        },
        icon: const Icon(Icons.favorite_border_rounded),
      ),
    ]);
  }

  Widget _categoryListBuilder() => SliverToBoxAdapter(
          child: SizedBox(
        height: 80,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categoryList.length,
            itemBuilder: (context, index) =>
                __categoryItemBuilder(categoryList[index], index)),
      ));

  CategoryItemCard __categoryItemBuilder(CategoryModel category, int index) {
    return CategoryItemCard(
      index: index,
      onPress: () {
        _homeBloc.add(CategorySelectionEvent(index: index));
      },
      category: category,
    );
  }

  Widget _priceListBuilder(HomeState state) => SliverToBoxAdapter(
          child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _priceList.length,
          itemBuilder: (context, index) =>
              _priceItemBuilder(_priceList[index], index),
        ),
      ));

  Widget _filterListBuilder(HomeState state) {
    return state is HomeLoadingState
        ? const SliverToBoxAdapter(
            child: Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              ),
            ),
          )
        : _filteredList();
  }

  PriceListCard _priceItemBuilder(PriceModel prices, int index) {
    return PriceListCard(
      isSelected: _priceListSelectedIndex == index,
      onPress: () {
        _homeBloc.add(PriceSelectionEvent(index: index));
      },
      index: index,
      price: prices,
    );
  }

  Widget _filteredList() => SliverList.builder(
      itemCount: _filteredModelList.length,
      itemBuilder: (context, index) =>
          _filteredItemBuilder(_filteredModelList[index], index));

  FilteredListCard _filteredItemBuilder(ItemModel filteredItem, int index) {
    return FilteredListCard(
      index: index,
      filteredList: filteredItem,
      likeButtonPressed: () => _homeBloc.add(ItemLikeUnlikeEvent(index: index)),
    );
  }
}
