import 'package:filter_app/model/category_model.dart';

class ItemModel {
  String itemName;
  int prices;
  GroceryCategory groceryCategory;
  ItemModel({
    required this.itemName,
    required this.prices,
    required this.groceryCategory,
  });
}

List<ItemModel> itemList = [
  ItemModel(
      itemName: "Corn Flakes",
      prices: 40,
      groceryCategory: GroceryCategory.cereals),
  ItemModel(
      itemName: "Basil",
      prices: 10,
      groceryCategory: GroceryCategory.herdsAndSpices),
  ItemModel(
      itemName: "Cheerios",
      prices: 50,
      groceryCategory: GroceryCategory.cereals),
  ItemModel(
      itemName: "Lucky Charms",
      prices: 60,
      groceryCategory: GroceryCategory.cereals),
  ItemModel(
      itemName: "Milk", prices: 50, groceryCategory: GroceryCategory.dairy),
  ItemModel(
      itemName: "Cheese", prices: 100, groceryCategory: GroceryCategory.dairy),
  ItemModel(
      itemName: "Yogurt", prices: 80, groceryCategory: GroceryCategory.dairy),
  ItemModel(
      itemName: "Butter", prices: 120, groceryCategory: GroceryCategory.dairy),
  ItemModel(
      itemName: "Cream", prices: 70, groceryCategory: GroceryCategory.dairy),
  ItemModel(
      itemName: "Apples", prices: 200, groceryCategory: GroceryCategory.fruit),
  ItemModel(
      itemName: "Avocados",
      prices: 200,
      groceryCategory: GroceryCategory.fruit),
  ItemModel(
      itemName: "Bananas", prices: 200, groceryCategory: GroceryCategory.fruit),
  ItemModel(
      itemName: "Grapefruit",
      prices: 200,
      groceryCategory: GroceryCategory.fruit),
  ItemModel(
      itemName: "Rice Krispies",
      prices: 45,
      groceryCategory: GroceryCategory.cereals),
  ItemModel(
      itemName: "Oranges", prices: 200, groceryCategory: GroceryCategory.fruit),
  ItemModel(
      itemName: "Peaches", prices: 200, groceryCategory: GroceryCategory.fruit),
  ItemModel(
      itemName: "Cinnamon",
      prices: 15,
      groceryCategory: GroceryCategory.herdsAndSpices),
  ItemModel(
      itemName: "Ginger",
      prices: 20,
      groceryCategory: GroceryCategory.herdsAndSpices),
  ItemModel(
      itemName: "Frosted Flakes",
      prices: 55,
      groceryCategory: GroceryCategory.cereals),
  ItemModel(
      itemName: "Oregano",
      prices: 12,
      groceryCategory: GroceryCategory.herdsAndSpices),
  ItemModel(
      itemName: "Paprika",
      prices: 18,
      groceryCategory: GroceryCategory.herdsAndSpices),
  ItemModel(
      itemName: "Asparagus",
      prices: 200,
      groceryCategory: GroceryCategory.vegetable),
  ItemModel(
      itemName: "Kiwi", prices: 200, groceryCategory: GroceryCategory.fruit),
  ItemModel(
      itemName: "Broccoli",
      prices: 200,
      groceryCategory: GroceryCategory.vegetable),
  ItemModel(
      itemName: "Cauliflower",
      prices: 200,
      groceryCategory: GroceryCategory.vegetable),
  ItemModel(
      itemName: "Corn",
      prices: 200,
      groceryCategory: GroceryCategory.vegetable),
  ItemModel(
      itemName: "Cucumbers",
      prices: 200,
      groceryCategory: GroceryCategory.vegetable),
  ItemModel(
      itemName: "Melons", prices: 200, groceryCategory: GroceryCategory.fruit),
  ItemModel(
      itemName: "Eggplant",
      prices: 200,
      groceryCategory: GroceryCategory.vegetable),
];
