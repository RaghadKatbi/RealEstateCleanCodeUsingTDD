class EndPoint {
  static String baseUrl = "https://proengaqar.com/api/";
  static String allCities="all_cities";
  static String signIn = "auth/login";
  static String signUp = "auth/register";
  static String contactUs = "store_contact";
  static String addMyEstate="storeTempEstate";
  static String getMyEstate="getMyEstate";
  static String getMyFavEstate="getFav";
  static String getByCityType = "get_by_city_type/شقة/حلب/ايجار";
  static String getByCity(String nameCity){
    return "get_by_city/$nameCity";
  }
  static String setFav(int id){
    return "setFav/$id";
  }
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "error";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
}