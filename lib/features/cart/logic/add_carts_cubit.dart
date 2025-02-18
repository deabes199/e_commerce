import 'package:bloc/bloc.dart';
import 'package:hero_store_app/core/database/hive_service.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'add_carts_state.dart';

class AddCartsCubit extends Cubit<AddCartsState> {
  AddCartsCubit() : super(AddCartsInitial());

  List<Product> cartList = [];
  bool productInCart(Product product) {
    return cartList.any((elment) => elment.id == product.id);
  }

  void addProdcutToCart({required Product product}) async {
    if (productInCart(product)) {
      await HiveServices.deleteProductFromCart(product.id ?? 0);
      cartList.removeWhere((element) => element.id == product.id);
      emit(RemoveProductFromCartSuccess(products: cartList));
    } else {
      cartList.add(product);
      await HiveServices.addProductToCart(product: product);
      emit(AddProductToCartSuccess());
    }
  }

  void getCartList() async {
    List<Product> savedList = await HiveServices.getProductFromCart();
    cartList = savedList;
    emit(GetCartSuccess(cartList));
  }

  Future<void> removeProductFromCart(Product product) async {
    await HiveServices.deleteProductFromCart(product.id ?? 0);
    cartList.removeWhere((element) => element.id == product.id);
    emit(RemoveProductFromCartSuccess(products: cartList));
  }

  Future<void> clearAllProductFromCart() async {
    await HiveServices.clearAllFromCart();
    cartList.clear();
    emit(ClearCartSuccess(products: cartList));
  }
}
