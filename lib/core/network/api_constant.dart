class ApiConstant
{
  static const String baseUrl = 'https://student.valuxapps.com/api/';

  static const String signIn = 'login';

  static const String signUp = 'register';

  static const String banner = 'home';

  static const String product = 'home';

  static const String categories = 'categories';

  static const String getDataProfile = 'profile';

  static const String getNotifications = 'notifications';

  static const String addFavorite = 'favorites';

  static const String getFavorite = 'favorites';

  static const String addCart = 'carts';

  static const String getCart = 'carts';

  static const String addOrder = 'orders';

  static const String getOrder = 'orders';

  static const String logOut = 'logout';

  static const String search = 'products/search';

  static const String addComplaint = 'complaints';




  static  String getProductDetails(int productId) => 'products/$productId';

  static  String getCategoriesDetails(int categoriesId) => 'categories/$categoriesId';

  static  String updateCart(int productId) => 'carts/$productId';


  static  String canselOrder(int orderId) => 'orders/$orderId/cancel';


  static  String searchInGoogleMaps = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';


  static  String placeDetailsInGoogleMaps = 'https://maps.googleapis.com/maps/api/place/details/json';

  static const String apiKeyGoogleMaps = 'jjdfasfdfjdjndjdfasjdfjdfjfsdkjl';



}