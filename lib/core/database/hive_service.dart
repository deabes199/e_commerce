import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hive/hive.dart';

class HiveServices {
  static const String favBox = 'favorite';
  static late Box<Product> favoriteBox;
  static const String cart = 'cart';
  static late Box<Product> cartBox;

  static Future<void> init() async {
    favoriteBox = await Hive.openBox<Product>(favBox);
    cartBox = await Hive.openBox<Product>(cart);
  }

  static addproductToFavorite({required Product product}) async {
    await favoriteBox.put(product.id, product);
  }

  static Future<List<Product>> getProductFromFavorite() async {
    return favoriteBox.values.toList();
  }

  static Future<void> deleteProductFromFavorite(int id) async {
    await favoriteBox.delete(id);
  }

  static Future<void> clearAllFavorite() async {
    await favoriteBox.clear();
  }

  static addProductToCart({required Product product}) async {
    await cartBox.put(product.id, product);
  }

  static Future<List<Product>> getProductFromCart() async {
    return cartBox.values.toList();
  }

  static Future<void> deleteProductFromCart(int id) async {
    await cartBox.delete(id);
  }

  static Future<void> clearAllFromCart() async {
    await cartBox.clear();
  }
}
