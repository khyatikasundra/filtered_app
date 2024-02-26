enum GroceryCategory { fruit, vegetable, dairy, cereals, herdsAndSpices }

class CategoryModel {
  String? itemName;
  bool isSelected;
  GroceryCategory groceryCategory;
  CategoryModel(
      {this.itemName, this.isSelected = false, required this.groceryCategory});
}

List<CategoryModel> categoryList = [
  CategoryModel(itemName: "Fruit", groceryCategory: GroceryCategory.fruit),
  CategoryModel(
      itemName: "Vegetable", groceryCategory: GroceryCategory.vegetable),
  CategoryModel(itemName: "Dairy", groceryCategory: GroceryCategory.dairy),
  CategoryModel(itemName: "Cereals", groceryCategory: GroceryCategory.cereals),
  CategoryModel(
      itemName: "Herbs and Spices",
      groceryCategory: GroceryCategory.herdsAndSpices),
];
