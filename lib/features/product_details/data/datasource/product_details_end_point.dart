abstract class ProductDetailsEndPoint {
  static getProductDetailsAPI({
    required int id,
  }) =>
      'products/$id';
}
