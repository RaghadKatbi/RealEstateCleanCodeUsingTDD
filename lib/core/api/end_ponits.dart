class EndPoint {
  static String baseUrl = "https://proengaqar.com/api/";
  static String allCities="all_cities";
  static String signIn = "auth/login";
  static String signUp = "auth/register";
  static String contactUs = "store_contact";
  static String addMyEstate="storeTempEstate";
  static String getMyEstate="getMyEstate";
  static String getMyFavEstate="getFav";
  static String agent="show_agents";
  static String searchForAgent="Advancedsearch";
  static String getByCity(String nameCity){
    return "get_by_city/$nameCity";
  }
  static String getEstate(int id)
  {
    return "show_property/$id";
  }
  static String getAllRegion(int idCity){
    return "get_region/$idCity";
  }
  static String getAllNeighborhood(int idRegion){
    return "getneighborhood/$idRegion";
  }
  static String getByCityType(String type,String purpose,String city){
    return "get_by_city_type/$type/$city/$purpose";
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