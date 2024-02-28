class PriceModel {
  final String priceRangeString;
  final int minPrice;
  final int? maxPrice;
  PriceModel({
    required this.priceRangeString,
    required this.minPrice,
    this.maxPrice,
  });
}

List<PriceModel> priceRangeList = [
  PriceModel(priceRangeString: "All", minPrice: 0, maxPrice: null),
  PriceModel(priceRangeString: "0-200", minPrice: 0, maxPrice: 200),
  PriceModel(priceRangeString: "200-500", minPrice: 200, maxPrice: 500),
  PriceModel(priceRangeString: "500-1000", minPrice: 500, maxPrice: 1000),
  PriceModel(priceRangeString: "1000-2000", minPrice: 1000, maxPrice: 2000),
  PriceModel(priceRangeString: "over 2000", minPrice: 2000, maxPrice: null),
];
