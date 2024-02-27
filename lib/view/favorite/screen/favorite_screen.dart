import 'package:filter_app/model/item_model.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<ItemModel> selectedList =
      itemList.where((element) => element.isFavorite).toList();
  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Items"),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: selectedList.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(selectedList[index].itemName),
                  ))),
    );
  }
}
