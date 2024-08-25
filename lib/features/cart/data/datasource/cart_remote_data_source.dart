import 'package:e_shop/core/services/http_service.dart';
import 'package:e_shop/features/cart/data/models/cart_model.dart';
import 'package:e_shop/features/cart/data/models/cart_product_model.dart';
import 'package:e_shop/features/cart/domain/usecase/update_product_quantity_in_cart_params_cart_use_case.dart';
import 'package:e_shop/features/products/data/models/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class CartRemoteDataSource {
  Future<CartModel?> getCart();

  Future<bool> deleteCart();

  Future<CartModel> updateProductQuantityInCart({
    required UpdateProductQuantityInCartParams
        updateProductQuantityInCartParams,
  });

  Future<bool> saveProductToCart({
    required ProductModel product,
  });
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final HttpService httpService;

  CartRemoteDataSourceImpl({
    required this.httpService,
  });

  @override
  Future<CartModel?> getCart() async {
    final box = await Hive.openBox<CartModel>("cart");
    return box.get("cart");
  }

  @override
  Future<bool> deleteCart() async {
    final box = await Hive.openBox<CartModel>("cart");
    await box.delete("cart");
    return true;
  }

  @override
  Future<CartModel> updateProductQuantityInCart({
    required UpdateProductQuantityInCartParams
        updateProductQuantityInCartParams,
  }) async {
    final product = updateProductQuantityInCartParams.product;
    final change = updateProductQuantityInCartParams.change;
    final box = await Hive.openBox<CartModel>("cart");
    CartModel cart = box.get("cart") ??
        CartModel(
          id: 1, // Assign a suitable ID
          products: [product.copyWith(quantity: change)],
          total: product.price * change,
          discountedTotal:
              (product.price * (1 - (product.discountPercentage / 100))) *
                  change,
          userId: 1, // Assign a suitable user ID
          totalProducts: 1,
          totalQuantity: change,
        );

    // Check if the product is already in the cart
    int productIndex = cart.products.indexWhere((p) => p.id == product.id);

    if (productIndex != -1) {
      // Product exists in cart
      CartProductModel existingProduct = cart.products[productIndex];

      // Calculate the new quantity
      int newQuantity = existingProduct.quantity + change;

      if (newQuantity <= 0) {
        // Remove the product if quantity is zero or less
        cart.products.removeAt(productIndex);
      } else {
        // Update existing product details
        CartProductModel updatedProduct = existingProduct.copyWith(
          quantity: newQuantity,
          total: existingProduct.price * newQuantity,
          discountedTotal: (existingProduct.price *
                  (1 - (existingProduct.discountPercentage / 100))) *
              newQuantity,
        );
        cart.products[productIndex] = updatedProduct;
      }
    } else if (change > 0) {
      // Add new product if it doesn't exist and quantity is positive
      cart.products.add(product.copyWith(
        quantity: change,
        total: product.price * change,
        discountedTotal:
            (product.price * (1 - (product.discountPercentage / 100))) * change,
      ));
    }

    // Update cart totals
    cart.total = cart.products.fold(0, (sum, item) => sum + item.total);
    cart.discountedTotal =
        cart.products.fold(0, (sum, item) => sum + item.discountedTotal);
    cart.totalProducts = cart.products.length;
    cart.totalQuantity =
        cart.products.fold(0, (sum, item) => sum + item.quantity);

    // Save the updated cart back to the Hive box
    await box.put("cart", cart);

    return cart;
  }

  @override
  Future<bool> saveProductToCart({required ProductModel product}) async {
    final box = await Hive.openBox<CartModel>("cart");
    CartModel? cart = box.get("cart");

    if (cart == null) {
      cart = CartModel(
        id: 1,
        products: [product.productModelToCartProductModel()],
        total: product.price,
        discountedTotal:
            product.price * (1 - (product.discountPercentage ?? 0.0) / 100),
        userId: 1,
        totalProducts: 1,
        totalQuantity: 1,
      );
    } else {
      int productIndex = cart.products.indexWhere((p) => p.id == product.id);

      if (productIndex != -1) {
        CartProductModel existingProduct = cart.products[productIndex];
        existingProduct.quantity += 1;
        existingProduct.total =
            existingProduct.price * existingProduct.quantity;
        existingProduct.discountedTotal = existingProduct.total *
            (1 - (existingProduct.discountPercentage / 100));

        cart.products[productIndex] = existingProduct;
      } else {
        cart.products.add(product.productModelToCartProductModel());
      }

      cart.total = cart.products.fold(0, (sum, item) => sum + item.total);
      cart.discountedTotal =
          cart.products.fold(0, (sum, item) => sum + item.discountedTotal);
      cart.totalProducts = cart.products.length;
      cart.totalQuantity =
          cart.products.fold(0, (sum, item) => sum + item.quantity);
    }

    await box.put("cart", cart);
    return true;
  }
}
