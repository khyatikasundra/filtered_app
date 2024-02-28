enum Category { fruit, vegetable, dairy, cereals, herdsAndSpices }

class CategoryModel {
  final String itemName;
  final Category category;
  bool isSelected;
  CategoryModel({
    required this.category,
    required this.itemName,
    this.isSelected = false,
  });
}

List<CategoryModel> categoryList = [
  CategoryModel(itemName: "Fruit", category: Category.fruit),
  CategoryModel(itemName: "Vegetable", category: Category.vegetable),
  CategoryModel(itemName: "Dairy", category: Category.dairy),
  CategoryModel(itemName: "Cereals", category: Category.cereals),
  CategoryModel(
      itemName: "Herbs and Spices", category: Category.herdsAndSpices),
];
