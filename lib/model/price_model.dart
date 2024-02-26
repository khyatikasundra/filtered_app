class PriceRangeModel {
  String? priceRange;
  PriceRangeModel({required this.priceRange});
}

List<PriceRangeModel> priceRangeList = [
  PriceRangeModel(priceRange: "0-200"),
  PriceRangeModel(priceRange: "200-500"),
  PriceRangeModel(priceRange: "500-1000"),
  PriceRangeModel(priceRange: "1000-2000"),
  PriceRangeModel(priceRange: "over 2000"),
];
