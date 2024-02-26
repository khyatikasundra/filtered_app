import 'package:filter_app/model/category_model.dart';
import 'package:filter_app/model/item_model.dart';
import 'package:filter_app/model/price_model.dart';
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
  int? _isPriceSelectedIndex = -1;
  List<ItemModel> _filteredModelList = itemList;
  @override
  void initState() {
    _homeBloc = context.read<HomeBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filtering"), actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border_rounded),
        ),
      ]),
      body: _blocBuilder(),
    );
  }

  BlocBuilder<HomeBloc, HomeState> _blocBuilder() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is CategoryItemSuccessfulSelected) {
          _filteredModelList = state.filteredList;
        }
        if (state is PriceRangeSuccessfulSelected) {
          _filteredModelList = state.filteredList;
        }
        return SafeArea(
            child: CustomScrollView(
          slivers: [_categoryList(), _priceList(state), _filteredList()],
        ));
      },
    );
  }

  Widget _categoryList() => SliverToBoxAdapter(
          child: SizedBox(
        height: 80,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) => CategoryItemCard(
                  index: index,
                  onPress: () {
                    _homeBloc.add(OnCategorySelectionEvent(index: index));
                  },
                )),
      ));

  Widget _priceList(HomeState state) => SliverToBoxAdapter(
          child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: priceRangeList.length,
          itemBuilder: (context, index) => PriceListCard(
            isSelected: _isPriceSelectedIndex == index,
            onPress: () {
              _isPriceSelectedIndex =
                  _isPriceSelectedIndex == index ? null : index;

              _homeBloc.add(OnPriceRangeSelectionEvent(index: index));
            },
            index: index,
          ),
        ),
      ));

  SliverList _filteredList() => SliverList.builder(
      itemCount: _filteredModelList.length,
      itemBuilder: (context, index) => FilteredListCard(
            index: index,
            filteredList: _filteredModelList,
          ));
}
