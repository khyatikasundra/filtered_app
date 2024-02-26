class PriceRangeModel {
  String? priceRange;
  int? minPrice;
  int? maxPrice;
  PriceRangeModel({this.priceRange, this.minPrice, this.maxPrice});
}

List<PriceRangeModel> priceRangeList = [
  PriceRangeModel(priceRange: "All", minPrice: 0, maxPrice: null),
  PriceRangeModel(priceRange: "200-500", minPrice: 200, maxPrice: 500),
  PriceRangeModel(priceRange: "500-1000", minPrice: 500, maxPrice: 1000),
  PriceRangeModel(priceRange: "1000-2000", minPrice: 1000, maxPrice: 2000),
  PriceRangeModel(priceRange: "over 2000", minPrice: null, maxPrice: 2000),
];
