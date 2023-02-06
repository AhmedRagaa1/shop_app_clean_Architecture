import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/features/home_data/domain/entites/add_favorite.dart';
import 'package:shop_app/features/home_data/domain/entites/banner.dart';
import 'package:shop_app/features/home_data/domain/entites/search.dart';
import 'package:shop_app/features/home_data/domain/usescase/add_or_remove_favorite_use_case.dart';
import 'package:shop_app/features/home_data/domain/usescase/banner_home.dart';
import 'package:shop_app/features/home_data/domain/usescase/categories_home.dart';
import 'package:shop_app/features/home_data/domain/usescase/product_home.dart';
import 'package:shop_app/features/home_data/domain/usescase/search_use_case.dart';
import '../../domain/entites/add_cart.dart';
import '../../domain/entites/categories.dart';
import '../../domain/entites/product.dart';
import '../../domain/entites/product_details.dart';
import '../../domain/usescase/add_or_remove_cart_use_case.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../favorite/presentation/screens/favorite_screen.dart';
import '../../domain/usescase/categories_details_use_case.dart';
import '../../domain/usescase/product_detail_use_case.dart';
import '../screens/home_screen.dart';
import '../../../Setting/presentation/screens/setting_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this.bannerUseCase,
    this.categoriesUseCase,
    this.productUseCase,
    this.addOrRemoveFavoriteUseCase,
    this.addOrRemoveCartUseCase,
    this.searchUseCase,
    this.productDetailsUseCase,
    this.categoriesDetailsUseCase,
  ) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screen = [
    const HomeScreen(),
    const FavoriteScreen(),
     CartScreen(openDialog: false,),
    const SettingScreen(),
  ];

  void changeBottom(int index)
  {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }


  Map<int , bool> favorite = {};
  Map<int , bool> cart = {};


  BannerUseCase bannerUseCase;
  List<BannerData> bannerCubit = [];

  FutureOr<void> gerBannerData() async {
    emit(BannerLoadingState());
    final result = await bannerUseCase(const NoParameters());

    result.fold((l) => emit(BannerErrorState(l.message)), (r) {
      bannerCubit = r;
      print(r.runtimeType);
      emit(BannerSuccessState(r));
    });
  }

  CategoriesUseCase categoriesUseCase;
  List<Categories> categoriesCubit = [];

  FutureOr<void> getCategoriesData() async {
    emit(CategoriesLoadingState());

    final result = await categoriesUseCase(const NoParameters());

    result.fold((l) {
      emit(CategoriesErrorState(l.message));
    }, (r) {
      print('956562522');
      categoriesCubit = r;
      emit(CategoriesSuccessState(r));
    });
  }

  ProductUseCase productUseCase;
  List<Product> productCubit = [];

  FutureOr<void> getProductData() async {
    emit(ProductLoadingState());

    final result = await productUseCase(const NoParameters());

    result.fold((l) {
      emit(ProductErrorState(l.message));
    }, (r) {
      print('aaaaaa5555a55aa55aa55aa5a');
      productCubit = r;
      r.forEach((element)
      {
        favorite.addAll(
            {
              element.id :  element.inFavorites,
            });

        print(favorite.toString());
      });
      r.forEach((element)
      {
        cart.addAll(
            {
              element.id :  element.inCart,
            });

        print(cart.toString());
      });
      emit(ProductSuccessState(r));
    });
  }

  AddOrRemoveFavoriteUseCase addOrRemoveFavoriteUseCase;

  FutureOr<void> addItemToFavorite({
    required int id,

  }) async {
    emit(AddFavoriteLoadingState());
    favorite[id] =  !favorite[id]!;

    emit(ChangeFavoriteIconColorSuccessState());

    final result =
        await addOrRemoveFavoriteUseCase(AddOrRemoveFavoriteParameters(id: id));
    result.fold((l)
    {
      emit(AddFavoriteErrorState(l.message));
      favorite[id] =  !favorite[id]!;
    }, (r) {
      print('aaaaaa5555a55aa55aa55aa5a');
      print(r);
      print(r.price);
      emit(AddFavoriteSuccessState(r));
    });
  }

  AddOrRemoveCartUseCase addOrRemoveCartUseCase;

  FutureOr<void> addItemToCart({
    required int id,
  }) async {
    emit(AddCartLoadingState());
    cart[id] =  !cart[id]!;

    emit(ChangeCartIconColorSuccessState());

    final result =
        await addOrRemoveCartUseCase(AddOrRemoveCartParameters(id: id));
    result.fold((l) {
      emit(AddCartErrorState(l.message));
      cart[id] =  !cart[id]!;
    }, (r) {
      print('aaaaaa5555a55aa55aa55aa5a');
      print(r);
      print(r.price);
      getProductData();
      emit(AddCartSuccessState(r));
    });
  }

  SearchUseCase searchUseCase;
  List<Search> search = [];

  FutureOr<void> searchAboutItem({required String text}) async {
    emit(SearchLoadingState());
    final result = await searchUseCase(SearchParameters(text: text));
    result.fold((l) {
      emit(SearchErrorState(l.message));
    }, (r) {
      print('aaaaaa5555a55aa55aa55aa5a');
      search = r;
      print(r);
      print(r[0].price);
      r.forEach((element)
      {
        favorite.addAll(
            {
              element.id :  element.inFavorites,
            });

        print(favorite.toString());
      });
      r.forEach((element)
      {
        cart.addAll(
            {
              element.id :  element.inCart,
            });

        print(cart.toString());
      });
      emit(SearchSuccessState(r));
    });
  }

  ProductDetailsUseCase productDetailsUseCase;
  ProductDetails productDetails = const ProductDetails(
      id: 1,
      price: 1,
      oldPrice: 1,
      discount: 1,
      name: '',
      description: '',
      inFavorites: false,
      inCart: false,
      images: [],
  );

  FutureOr<void> getProductDetails({
    required int productId,
  }) async {
    emit(ProductDetailsLoadingState());
    final result = await productDetailsUseCase(
        ProductDetailsParameters(productId: productId));

    result.fold((l) {
      emit(ProductDetailsErrorState(l.message));
    }, (r) {
      print('aaaaaa5555a55aa55aa55aa5a');
      productDetails = r;
      print(r);
      print(r.price);
      emit(ProductDetailsSuccessState(r));
    });
  }

  CategoriesDetailsUseCase categoriesDetailsUseCase;
  List<Product> categoriesDetails = [];

  FutureOr<void> getCategoriesDetails({
    required int categoriesId,
  }) async {
    emit(CategoriesDetailsLoadingState());
    final result = await categoriesDetailsUseCase(
        CategoriesDetailsParameters(categoriesId: categoriesId));

    result.fold((l)
    {
      emit(CategoriesDetailsErrorState(l.message));
    }, (r)
    {
      print('aaaaaa5555a55aa55aa55aa5a');
      categoriesDetails = r;
      print(r);
      r.forEach((element)
      {
        favorite.addAll(
            {
              element.id :  element.inFavorites,
            });

        print(favorite.toString());
      });
      r.forEach((element)
      {
        cart.addAll(
            {
              element.id :  element.inCart,
            });

        print(cart.toString());
      });
      print(r[0].price);
      emit(CategoriesDetailsSuccessState(r));
    });
  }
}
