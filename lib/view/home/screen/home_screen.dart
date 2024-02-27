import 'package:filter_app/model/category_model.dart';
import 'package:filter_app/model/item_model.dart';
import 'package:filter_app/model/price_model.dart';
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
  int? _isPriceSelectedIndex = 0;
  List<ItemModel> _filteredModelList = [];
  List<CategoryModel> _categoryList = [];
  List<PriceRangeModel> _priceList = [];
  @override
  void initState() {
    _homeBloc = context.read<HomeBloc>();
    _homeBloc.add(GetFilteredList());
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
        if (state is FilteredInitialListPassSuccessful) {
          _filteredModelList = state.filteredList;
          _categoryList = state.categoryList;
          _priceList = state.priceList;
        }
        if (state is FilteredItemSuccessfulSelected) {
          _filteredModelList = state.filteredList;
        }

        if (state is CategoryItemSelected) {
          _categoryList = state.categoryList;
        }

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

  AppBar _appBar() {
    return AppBar(title: const Text("Filtering"), actions: [
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
        _homeBloc.add(OnCategorySelectionEvent(index: index));
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
    return state is LoadingState
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

  PriceListCard _priceItemBuilder(PriceRangeModel prices, int index) {
    return PriceListCard(
      isSelected: _isPriceSelectedIndex == index,
      onPress: () {
        _isPriceSelectedIndex = index;
        _homeBloc.add(OnPriceRangeSelectionEvent(index: index));
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
      likeButtonPressed: () =>
          _homeBloc.add(OnClickFavoriteIconEvent(index: index)),
    );
  }
}
