import 'package:dio/dio.dart';
import 'package:shop_app/core/network/api_constant.dart';
import 'package:shop_app/core/utils/constant.dart';
import 'package:shop_app/features/home_data/data/model/add_favorite_model.dart';
import 'package:shop_app/features/home_data/data/model/banner_model.dart';
import 'package:shop_app/features/home_data/data/model/categoris_model.dart';
import 'package:shop_app/features/home_data/data/model/product_model.dart';
import 'package:shop_app/features/home_data/data/model/search_model.dart';
import 'package:shop_app/features/home_data/domain/usescase/add_or_remove_favorite_use_case.dart';
import 'package:shop_app/features/home_data/domain/usescase/search_use_case.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/error_message_model.dart';
import '../../domain/usescase/add_or_remove_cart_use_case.dart';
import '../../domain/usescase/categories_details_use_case.dart';
import '../../domain/usescase/product_detail_use_case.dart';
import '../model/add_to_cart.dart';
import '../model/product_details_model.dart';

abstract class BaseHomeRemoteDataSource
{
  Future<List<ProductModel>> getProductData();
  Future<List<BannerModel>> getBannerData();
  Future<List<CategoriesModel>> getCategoriesData();
  Future<AddFavoriteModel> addFavoriteItem(AddOrRemoveFavoriteParameters parameters);
  Future<AddCartModel> addCartItem(AddOrRemoveCartParameters parameters);
  Future<List<SearchModel>> searchAboutItem(SearchParameters parameters);
  Future<ProductDetailsModel> getProductDetails(ProductDetailsParameters parameters);
  Future<List<ProductModel>> getCategoriesDetails(CategoriesDetailsParameters parameters);
}

class HomeRemoteDatSource extends BaseHomeRemoteDataSource
{
  @override
  Future<List<BannerModel>> getBannerData() async
  {
   final response = await Dio(BaseOptions(
     baseUrl: ApiConstant.baseUrl,
     receiveDataWhenStatusError: true,
     headers:
     {
       'Content-Type': 'application/json',
       'lang': 'en',
       "Authorization":token,
     }
   )).get(ApiConstant.banner);
   print(response);

   if(response.data['status'] == true)
   {
     print('***********  banner *************');
     return List<BannerModel>.from((response.data["data"]["banners"]as List).map((e) => BannerModel.fromJson(e)));
   }else
   {
     throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
   }

  }



  @override
  Future<List<CategoriesModel>> getCategoriesData() async
  {
   final response = await Dio(BaseOptions(
       baseUrl: ApiConstant.baseUrl,
       receiveDataWhenStatusError: true,
       headers:
       {
         'Content-Type': 'application/json',
         'lang': 'en',
         "Authorization":token,
       }
   )).get(ApiConstant.categories);
   print(response);


   if(response.data['status'] == true)
   {
     print('***********  Categories *************');
     return List<CategoriesModel>.from((response.data['data']['data'] as List).map((e) => CategoriesModel.fromJson(e)));
   }else
   {
     throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
   }


  }

  @override
  Future<List<ProductModel>> getProductData() async
  {
    final response = await Dio(BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveDataWhenStatusError: true,
        headers:
        {
          'Content-Type': 'application/json',
          'lang': 'en',
          "Authorization":token,
        }
    )).get(ApiConstant.product);
    print(response);



    if(response.data['status'] == true)
    {
      print('***********  product *************');
      return List<ProductModel>.from((response.data["data"]["products"] as List).map((e) => ProductModel.fromJson(e)));
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
    }

  }

  @override
  Future<AddFavoriteModel> addFavoriteItem(AddOrRemoveFavoriteParameters parameters) async
  {
    final response = await Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: ApiConstant.baseUrl,
        headers:
        {
          'Content-Type': 'application/json',
          'lang': 'en',
          "Authorization":token,
        }
    )).post(ApiConstant.addFavorite, data: {
      'product_id': parameters.id,
    } );
    print(response);

    if(response.data['status'])
    {
      print('Add Favorite ********************************');
      return AddFavoriteModel.fromJson(response.data['data']['product']);
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<AddCartModel> addCartItem(AddOrRemoveCartParameters parameters) async
  {
    final response = await Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: ApiConstant.baseUrl,
        headers:
        {
          'Content-Type': 'application/json',
          'lang': 'en',
          "Authorization":token,
        }
    )).post(ApiConstant.addCart, data: {
      'product_id': parameters.id,
    } );
    print(response);

    if(response.data['status'])
    {
      print('Add Cart ********************************');
      return AddCartModel.fromJson(response.data['data']['product']);
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<SearchModel>> searchAboutItem(SearchParameters parameters) async
  {
    final response = await Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: ApiConstant.baseUrl,
        headers:
        {
          'Content-Type': 'application/json',
          'lang': 'en',
          "Authorization":token,
        }
    )).post(ApiConstant.search, data: {
      'text': parameters.text,
    } );
    print(response);

    if(response.data['status'])
    {
      print('Search  ********************************');
      return List<SearchModel>.from((response.data['data']['data'] as List).map((e) => SearchModel.fromJson(e)));
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<ProductDetailsModel> getProductDetails(ProductDetailsParameters parameters) async
  {
   final response = await Dio(BaseOptions(
     receiveDataWhenStatusError: true,
     baseUrl: ApiConstant.baseUrl,
     headers:
     {
       'Content-Type': 'application/json',
       'lang': 'en',
       "Authorization":token,
     }

   )).get(ApiConstant.getProductDetails(parameters.productId));

   if(response.data['status'])
   {
     print('Product Details  ********************************');
     return ProductDetailsModel.fromJson(response.data['data']);
   }else
   {
     throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
   }

  }

  @override
  Future<List<ProductModel>> getCategoriesDetails(CategoriesDetailsParameters parameters)async
  {
    {
      final response = await Dio(BaseOptions(
          receiveDataWhenStatusError: true,
          baseUrl: ApiConstant.baseUrl,
          headers:
          {
            'Content-Type': 'application/json',
            'lang': 'en',
            "Authorization":token,
          }

      )).get(ApiConstant.getCategoriesDetails(parameters.categoriesId));

      if(response.data['status'])
      {
        print('Product Details  ********************************');
        return List<ProductModel>.from((response.data['data']['data']as List).map((e) => ProductModel.fromJson(e)));
      }else
      {
        throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }

    }

  }



}