import 'package:filter_app/model/item_model.dart';
import 'package:flutter/material.dart';

class FilteredListCard extends StatelessWidget {
  final int index;
  final List<ItemModel> filteredList;
  const FilteredListCard(
      {required this.index, required this.filteredList, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ListTile(
        title: Text(
          filteredList[index].itemName,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text("Rs.${filteredList[index].prices.toString()}"),
        trailing: const Icon(Icons.favorite),
      ),
    );
  }
}
