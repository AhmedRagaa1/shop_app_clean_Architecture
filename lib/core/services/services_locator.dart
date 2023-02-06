import 'package:get_it/get_it.dart';
import 'package:shop_app/features/Setting/data/datasource/setting_data_source.dart';
import 'package:shop_app/features/Setting/domain/baserepository/setting_base_repository.dart';
import 'package:shop_app/features/authentication/data/datasource/auth.dart';
import 'package:shop_app/features/authentication/data/repository/auth_repository.dart';
import 'package:shop_app/features/authentication/domain/base_repository/auth.dart';
import 'package:shop_app/features/authentication/domain/usecase/sign_up.dart';
import 'package:shop_app/features/authentication/presentation/controller/login_cubit.dart';
import 'package:shop_app/features/authentication/presentation/controller/register_cubit.dart';
import 'package:shop_app/features/cart/data/datasource/cart_data_source.dart';
import 'package:shop_app/features/cart/data/repository/get_cart_repository.dart';
import 'package:shop_app/features/cart/domain/baserepository/cart_base_repository.dart';
import 'package:shop_app/features/cart/domain/usescase/update_cart.dart';
import 'package:shop_app/features/favorite/data/repository/favorite_repository.dart';
import 'package:shop_app/features/favorite/presentation/controller/favorite_cubit.dart';
import 'package:shop_app/features/google_map/data/datasource/google_map.dart';
import 'package:shop_app/features/google_map/data/repository/google_map%20_repository.dart';
import 'package:shop_app/features/google_map/domain/baserepository/google_maps.dart';
import 'package:shop_app/features/google_map/domain/usescase/place_details_google_maps.dart';
import 'package:shop_app/features/google_map/presentation/conroller/google_maps_cubit.dart';
import 'package:shop_app/features/home_data/data/datasource/home_remote_data_source.dart';
import 'package:shop_app/features/home_data/data/repository/home_repository.dart';
import 'package:shop_app/features/home_data/domain/baserepository/base_repository.dart';
import 'package:shop_app/features/home_data/domain/usescase/add_or_remove_favorite_use_case.dart';
import 'package:shop_app/features/home_data/domain/usescase/categories_home.dart';
import 'package:shop_app/features/home_data/domain/usescase/product_home.dart';
import '../../features/Setting/data/repository/setting_repository.dart';
import '../../features/Setting/domain/usescase/add_complaint_use_case.dart';
import '../../features/Setting/domain/usescase/cansel_order_use_case.dart';
import '../../features/Setting/domain/usescase/log_out_use_case.dart';
import '../../features/Setting/domain/usescase/notification_use_case.dart';
import '../../features/Setting/domain/usescase/profile_use_case.dart';
import '../../features/Setting/presentation/controller/setting_cubit.dart';
import '../../features/authentication/domain/usecase/sign_in.dart';
import '../../features/Setting/domain/usescase/get_order_use_case.dart';
import '../../features/cart/domain/usescase/add_order.dart';
import '../../features/cart/domain/usescase/get_cart_use_case.dart';
import '../../features/cart/presentation/controller/cart_cubit.dart';
import '../../features/favorite/data/datasource/favorite_data_source.dart';
import '../../features/favorite/domain/baserepository/favorite_base_repository.dart';
import '../../features/favorite/domain/usescase/get_favorite_use_case.dart';
import '../../features/google_map/domain/usescase/search_google_maps_use_case.dart';
import '../../features/home_data/domain/usescase/add_or_remove_cart_use_case.dart';
import '../../features/home_data/domain/usescase/banner_home.dart';
import '../../features/home_data/domain/usescase/categories_details_use_case.dart';
import '../../features/home_data/domain/usescase/product_detail_use_case.dart';
import '../../features/home_data/domain/usescase/search_use_case.dart';
import '../../features/home_data/presentation/controller/home_cubit.dart';

final sl=GetIt.instance;
class ServicesLocator
{
  void init()
  {
    //////// Cubit
    sl.registerFactory(() => CartCubit(sl(),sl(),sl(),sl()));
    sl.registerFactory(() => RegisterCubit(sl()));
    sl.registerFactory(() => LoginCubit(sl()));
    sl.registerFactory(() => HomeCubit(sl(),sl(), sl(),sl(),sl(),sl(),sl(),sl()));
    sl.registerFactory(() => SettingCubit(sl(),sl(),sl(),sl(),sl(),sl()));
    sl.registerFactory(() => FavoriteCubit(sl(),sl()));
    sl.registerFactory(() => GoogleMapsCubit(sl(),sl()));

  /////// Use Cases Auth Module
    sl.registerLazySingleton(() => SignInUseCase(sl()));
    sl.registerLazySingleton(() => SignUpUseCase(sl()));
    sl.registerLazySingleton(() => ProductUseCase(sl()));
    sl.registerLazySingleton(() => CategoriesUseCase(sl()));
    sl.registerLazySingleton(() => AddOrRemoveFavoriteUseCase(sl()));
    sl.registerLazySingleton(() => AddOrRemoveCartUseCase(sl()));
    sl.registerLazySingleton(() => BannerUseCase(sl()));
    sl.registerLazySingleton(() => ProfileUseCase(sl()));
    sl.registerLazySingleton(() => NotificationUseCase(sl()));
    sl.registerLazySingleton(() => GetCartUseCase(sl()));
    sl.registerLazySingleton(() => GetFavoriteUseCase(sl()));
    sl.registerLazySingleton(() => GetOrderUseCase(sl()));
    sl.registerLazySingleton(() => AddOrderUseCase(sl()));
    sl.registerLazySingleton(() => LogoutUseCase(sl()));
    sl.registerLazySingleton(() => SearchUseCase(sl()));
    sl.registerLazySingleton(() => ProductDetailsUseCase(sl()));
    sl.registerLazySingleton(() => CategoriesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => CanselOrderUseCase(sl()));
    sl.registerLazySingleton(() => AddComplaintUseCase(sl()));
    sl.registerLazySingleton(() => UpdateCartUseCase(sl()));
    sl.registerLazySingleton(() => SearchMapsUseCase(sl()));
    sl.registerLazySingleton(() => PlaceDetailsUseCase(sl()));

    ////// Repository
    sl.registerLazySingleton<AuthBaseRepository>(() => AuthRepository(sl()));
    sl.registerLazySingleton<HomeBaseRepository>(() => HomeRepository(sl()));
    sl.registerLazySingleton<SettingBaseRepository>(() => SettingRepository(sl()));
    sl.registerLazySingleton<CartBaseRepository>(() => CartRepository(sl()));
    sl.registerLazySingleton<FavoriteBaseRepository>(() => FavoriteRepository(sl()));
    sl.registerLazySingleton<GoogleMapsBaseRepository>(() => GoogleMapsRepository(sl()));


    //////////// Data Source
    sl.registerLazySingleton<AuthBaseRemoteDataSource>(() => AuthRemoteDataSource());
    sl.registerLazySingleton<BaseHomeRemoteDataSource>(() => HomeRemoteDatSource());
    sl.registerLazySingleton<SettingBaseRemoteDataSource>(() => SettingRemoteDataSource());
    sl.registerLazySingleton<CartBaseRemoteDataSource>(() => CartRemoteDataSource());
    sl.registerLazySingleton<FavoriteBaseRemoteDataSource>(() => FavoriteRemoteDataSource());
    sl.registerLazySingleton<GoogleMapBaseRemoteDataSource>(() => GoogleMapRemoteDataSource());

  }
}