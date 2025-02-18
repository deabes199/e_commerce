part of 'add_carts_cubit.dart';

@immutable
sealed class AddCartsState {}

final class AddCartsInitial extends AddCartsState {}

final class AddProductToCartSuccess extends AddCartsState {}

final class RemoveProductFromCartSuccess extends AddCartsState {
  final List<Product> products;

  RemoveProductFromCartSuccess({required this.products});
}

final class GetCartSuccess extends AddCartsState {
  final List<Product> products;
  GetCartSuccess(this.products);
}

final class ClearCartSuccess extends AddCartsState {
  final List<Product> products;

  ClearCartSuccess({required this.products});
}
