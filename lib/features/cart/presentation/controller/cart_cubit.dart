import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/features/cart/domain/entites/cart.dart';
import 'package:shop_app/features/cart/domain/usescase/update_cart.dart';
import 'package:shop_app/features/home_data/domain/usescase/add_or_remove_cart_use_case.dart';
import 'package:shop_app/features/home_data/presentation/controller/home_cubit.dart';
import '../../domain/entites/add_order.dart';
import '../../domain/entites/update_cart.dart';
import '../../domain/usescase/add_order.dart';
import '../../domain/usescase/get_cart_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(
      this.getCartUseCase, this.addOrderUseCase, this.addOrRemoveCartUseCase,this.updateCartUseCase)
      : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  int quantity = 1;

  void increaseQuantity() {
    if (quantity < 5) {
      quantity++;
    }
    emit(QuantityPlusState(quantity));
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
    emit(QuantityMinusState(quantity));
  }


  int val = 1;
  changeRadioButtonValue(value) {
    val = value;
    emit(
      ChangeRadioValSuccessState(),
    );
  }

  GetCartUseCase getCartUseCase;
  Cart cart = const Cart(subTotal: 1, total: 1, cartItems: []);

  FutureOr<void> getCartData() async {
    emit(GetCartLoadingState());
    final result = await getCartUseCase(const NoParameters());

    result.fold((l) {
      emit(GetCartErrorState(l.message));
    }, (r) {
      print('aaaaaa5555a55aa55aa885656574488848448488455aa5a');
      print(r);
      cart = r;
      print(r.subTotal);
      emit(GetCartSuccessState(r));
    });
  }

  AddOrderUseCase addOrderUseCase;

  FutureOr<void> addOrder() async {
    emit(AddOrderLoadingState());
    final result = await addOrderUseCase(const NoParameters());
    result.fold((l) {
      emit(AddOrderErrorState(l.message));
    }, (r) {
      print('aaaaaa5555a55aa55aa885656574488848448488455aa5a');
      print(r);
      print(r.points);
      emit(AddOrderSuccessState(r));
    });
  }

  AddOrRemoveCartUseCase addOrRemoveCartUseCase;

  FutureOr<void> removeItemFromCart({
    required int id,
  }) async {
    emit(RemoveItemLoadingState());

    final result =
        await addOrRemoveCartUseCase(AddOrRemoveCartParameters(id: id));
    result.fold((l) {
      emit(RemoveItemErrorState(l.message));
      print('Error //////////////////////848448488455aa5a');

      print(l);
    }, (r) {
      print('aaaaaa5555a55aa55aa885656574488848448488455aa5a');
      print(r);
      getCartData();
      emit(RemoveItemSuccessState());
    });
  }

  UpdateCartUseCase updateCartUseCase;
  UpdateCart updateCart = UpdateCart(quantity: 1);
  FutureOr<void> updateItemInCart({
    required int productId,
    required int quantity,
  }) async {
    final result = await updateCartUseCase(
        UpdateCartParameters(productId: productId, quantity: quantity));

    result.fold((l)
    {
      print(l.message);
      emit(UpdateCartErrorState(l.message));
    }, (r)
    {
      print(r);
      updateCart = r;
      print('update cart Successfully');
      print(updateCart.quantity);
      getCartData();
      emit(UpdateCartSuccessState(r));
    });
  }
}
