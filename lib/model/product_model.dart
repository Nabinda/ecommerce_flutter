class ProductModel {
  final String id;
  final String productName;
  final String productShortDescription;
  final String productLongDescription;
  final String sellerName;
  final String sellerContact;
  final String category;
  final int quantity;
  final double productPrice;
  final double discPrice;
  final double discPercentage;
  final List<String> services;
  final List<Map<String, String>> reviews;
  ProductModel(
      {required this.id,
      required this.productName,
      required this.productShortDescription,
      required this.productLongDescription,
      required this.sellerName,
      required this.sellerContact,
      required this.category,
      required this.quantity,
      required this.productPrice,
      required this.discPrice,
      required this.discPercentage,
      required this.services,
      required this.reviews});
}
