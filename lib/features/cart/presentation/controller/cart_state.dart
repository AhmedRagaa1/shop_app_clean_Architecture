part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class GetCartLoadingState extends CartState {}

class GetCartSuccessState extends CartState {
  final Cart cart;

  GetCartSuccessState(this.cart);
}

class GetCartErrorState extends CartState {
  final String error;

  GetCartErrorState(this.error);
}

class AddOrderLoadingState extends CartState {}

class AddOrderSuccessState extends CartState {
  final AddOrder addOrder;

  AddOrderSuccessState(this.addOrder);
}

class AddOrderErrorState extends CartState {
  final String error;

  AddOrderErrorState(this.error);
}

class RemoveItemLoadingState extends CartState {}

class RemoveItemSuccessState extends CartState {}

class RemoveItemErrorState extends CartState {
  final String error;

  RemoveItemErrorState(this.error);
}

class QuantityPlusState extends CartState {
  final int quantity;

  QuantityPlusState(this.quantity);
}

class QuantityMinusState extends CartState {
  final int quantity;

  QuantityMinusState(this.quantity);
}

class UpdateCartSuccessState extends CartState
{
  final UpdateCart updateCart;

  UpdateCartSuccessState(this.updateCart);

}

class UpdateCartErrorState extends CartState
{
  final String error;

  UpdateCartErrorState(this.error);

}

class ChangeRadioValSuccessState extends CartState{}
