import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/database/hive_service.dart';
import 'package:hero_store_app/core/helpers/flutter_secure_stoarge.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(ProductDetailsInitial());

  SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  List<Product> favoriteList = [];
  bool productIsFavorite(Product favorite) {
    return favoriteList.any((elment) => elment.id == favorite.id);
  }

  void addProductInfavorite(Product model) async {
    if (productIsFavorite(model)) {
      await HiveServices.deleteProductFromFavorite(model.id ?? 0);
      favoriteList.removeWhere((element) => element.id == model.id);
      emit(RemoveProductToFavoritesSuccess(favorite: favoriteList));
    } else {
      favoriteList.add(model);
      await HiveServices.addproductToFavorite(product: model);
      emit(AddProductToFavoritesSuccess());
    }
  }

  void getFavorite() async {
    List<Product> savedList = await HiveServices.getProductFromFavorite();
    favoriteList = savedList;
    emit(FavoritesLoaded(favorite: favoriteList));
  }

  Future<void> deleteItem(Product model) async {
    await HiveServices.deleteProductFromFavorite(model.id ?? 0);
    favoriteList.removeWhere((elment) => elment.id == model.id);
    emit(RemoveProductToFavoritesSuccess(favorite: favoriteList));
  }

  Future<void> clearAllProduct() async {
    await HiveServices.clearAllFavorite();
    favoriteList.clear();
    emit(ClearFavorites(favorite: favoriteList));
  }

// class FavoritesCubit extends Cubit<FavoritesState> {
  // FavoritesCubit() : super(ProductDetailsInitial());

  // SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  // List<FavoriteModel> favoriteList = [];
  // bool productIsFavorite(FavoriteModel favorite) {
  //   return favoriteList.any((elment) => elment.id == favorite.id);
  // }

  // void addProductInfavorite(FavoriteModel model) async {
  //   if (productIsFavorite(model)) {
  //     await HiveServices.deleteItem(model.id.toString());
  //     favoriteList.removeWhere((element) => element.id == model.id);
  //     emit(RemoveProductToFavoritesSuccess(favorite: favoriteList));
  //   } else {
  //     favoriteList.add(model);
  //     await HiveServices.addItem(product: model);
  //     emit(AddProductToFavoritesSuccess());
  //   }
  // }

  // void getFavorite() async {
  //   List<FavoriteModel> savedList = await HiveServices.getItem();
  //   favoriteList = savedList;
  //   emit(FavoritesLoaded(favorite: favoriteList));
  // }

  // Future<void> deleteItem(FavoriteModel model) async {
  //   await HiveServices.deleteItem(model.id.toString());
  //   favoriteList.removeWhere((elment) => elment.id == model.id);
  //   emit(RemoveProductToFavoritesSuccess(favorite: favoriteList));
  // }

  // Future<void> clearAllProduct() async {
  //   await HiveServices.clearAllItem();
  //   favoriteList.clear();
  //   emit(ClearFavorites(favorite: favoriteList));
  // }

  // void addFavorite({required Product product}) async {
  //   if (isProductInFavorites(product: product)) {
  //     favorites.removeWhere((element) => element.id == product.id);
  //     secureStorageHelper.setFavorites(favorites);

  //     emit(RemoveProductToFavoritesSuccess());
  //   } else {
  //     favorites.add(product);
  //     secureStorageHelper.setFavorites(favorites);
  //     emit(AddProductToFavoritesSuccess());
  //   }
  // }

  // bool isProductInFavorites({required Product product}) {
  //   if (favorites.where((element) => element.id == product.id).isNotEmpty) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // void getFavorites() async {
  //   List<Product> savedFavorites = await secureStorageHelper.getFavorites();
  //   favorites = savedFavorites;
  //   emit(FavoritesLoaded());
  // }

  // void removeFavorite({required Product product}) async {
  //   favorites.remove(product);
  //   secureStorageHelper.setFavorites(favorites);
  //   emit(RemoveProductToFavoritesSuccess());
  // }

  // void clearFavorites() async {
  //   favorites.clear();
  //   secureStorageHelper.setFavorites(favorites);
  //   emit(ClearFavorites());
  // }
}
