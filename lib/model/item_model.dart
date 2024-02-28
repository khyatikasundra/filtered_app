import 'package:filter_app/model/category_model.dart';

class ItemModel {
  final String itemName;
  final int prices;
  final Category category;
  bool isFavorite;
  ItemModel(
      {required this.itemName,
      required this.prices,
      required this.category,
      this.isFavorite = false});
}

List<ItemModel> itemList = [
  ItemModel(itemName: "Corn Flakes", prices: 40, category: Category.cereals),
  ItemModel(itemName: "Basil", prices: 10, category: Category.herdsAndSpices),
  ItemModel(itemName: "Bananas", prices: 2000, category: Category.fruit),
  ItemModel(itemName: "Cheerios", prices: 50, category: Category.cereals),
  ItemModel(itemName: "Lucky Charms", prices: 60, category: Category.cereals),
  ItemModel(itemName: "Milk", prices: 50, category: Category.dairy),
  ItemModel(itemName: "Cheese", prices: 100, category: Category.dairy),
  ItemModel(itemName: "Yogurt", prices: 80, category: Category.dairy),
  ItemModel(itemName: "Butter", prices: 120, category: Category.dairy),
  ItemModel(itemName: "Cream", prices: 70, category: Category.dairy),
  ItemModel(itemName: "Apples", prices: 200, category: Category.fruit),
  ItemModel(itemName: "Avocados", prices: 200, category: Category.fruit),
  ItemModel(itemName: "Grapefruit", prices: 200, category: Category.fruit),
  ItemModel(itemName: "Rice Krispies", prices: 45, category: Category.cereals),
  ItemModel(itemName: "Oranges", prices: 200, category: Category.fruit),
  ItemModel(itemName: "Peaches", prices: 3000, category: Category.fruit),
  ItemModel(
      itemName: "Cinnamon", prices: 900, category: Category.herdsAndSpices),
  ItemModel(itemName: "Ginger", prices: 600, category: Category.herdsAndSpices),
  ItemModel(itemName: "Frosted Flakes", prices: 55, category: Category.cereals),
  ItemModel(itemName: "Oregano", prices: 12, category: Category.herdsAndSpices),
  ItemModel(
      itemName: "Paprika", prices: 1500, category: Category.herdsAndSpices),
  ItemModel(itemName: "Asparagus", prices: 200, category: Category.vegetable),
  ItemModel(itemName: "Kiwi", prices: 200, category: Category.fruit),
  ItemModel(itemName: "Broccoli", prices: 200, category: Category.vegetable),
  ItemModel(
      itemName: "Cauliflower", prices: 3500, category: Category.vegetable),
  ItemModel(itemName: "Corn", prices: 200, category: Category.vegetable),
  ItemModel(itemName: "Cucumbers", prices: 200, category: Category.vegetable),
  ItemModel(itemName: "Melons", prices: 200, category: Category.fruit),
  ItemModel(itemName: "Eggplant", prices: 550, category: Category.vegetable),
];
