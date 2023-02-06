import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/features/favorite/domain/entites/product_item_favorite.dart';
import 'package:shop_app/features/favorite/domain/usescase/get_favorite_use_case.dart';
import 'package:shop_app/features/home_data/domain/usescase/add_or_remove_favorite_use_case.dart';

import '../../domain/entites/favorite.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState>
{
  FavoriteCubit(this.getFavoriteUseCase ,this.addOrRemoveFavoriteUseCase ) : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);

  GetFavoriteUseCase getFavoriteUseCase;
  List<Favorite> favorite = [];
  FutureOr<void> getFavorite() async
  {
    emit(GetFavoriteLoadingState());
    final result = await getFavoriteUseCase(const NoParameters());

    result.fold((l) {
      emit(GetFavoriteErrorState(l.message));
    }, (r) {
      print('aaaaaa5555a55aa55aa885656574488848448488455aa5a');
      print(r);
      favorite = r;
      emit(GetFavoriteSuccessState(r));
    });
  }



  AddOrRemoveFavoriteUseCase addOrRemoveFavoriteUseCase;
  FutureOr<void> removeItemFromFavorite({
    required int id,
  }) async
  {
    emit(RemoveFavoriteLoadingState());
    final result =
    await addOrRemoveFavoriteUseCase(AddOrRemoveFavoriteParameters(id: id));
    result.fold((l) {
      emit(RemoveFavoriteErrorState(l.message));
    }, (r) {
      print('aaaaaa5555a55aa55aa55aa5a');
      print(r);
      getFavorite();
      print(r.price);
      emit(RemoveFavoriteSuccessState());
    });
  }


}
