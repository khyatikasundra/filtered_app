import 'package:filter_app/model/item_model.dart';
import 'package:flutter/material.dart';

class FilteredListCard extends StatelessWidget {
  final int index;
  final ItemModel filteredList;
  final VoidCallback? likeButtonPressed;
  const FilteredListCard(
      {required this.index,
      required this.filteredList,
      this.likeButtonPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ListTile(
        title: Text(
          filteredList.itemName,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text("Rs.${filteredList.prices.toString()}"),
        trailing: IconButton(
          onPressed: likeButtonPressed,
          icon: filteredList.isFavorite
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
        ),
      ),
    );
  }
}
