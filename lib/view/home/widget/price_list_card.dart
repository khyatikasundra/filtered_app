import 'package:filter_app/model/price_model.dart';
import 'package:flutter/material.dart';

class PriceListCard extends StatelessWidget {
  final int index;
  final VoidCallback? onPress;
  final bool isSelected;
  const PriceListCard(
      {this.index = 0, this.onPress, this.isSelected = false, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        color: isSelected ? Colors.grey : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            priceRangeList[index].priceRange.toString(),
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
