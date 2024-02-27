import 'package:filter_app/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryItemCard extends StatelessWidget {
  final int index;
  final CategoryModel category;
  final VoidCallback? onPress;
  const CategoryItemCard(
      {required this.category, this.index = 0, this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        color: category.isSelected ? Colors.grey : Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              category.itemName.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
