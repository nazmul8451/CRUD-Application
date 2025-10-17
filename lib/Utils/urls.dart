class Urls{
  static const String baseUrl = 'http://35.73.30.144:2008/api/v1';
  static const String readProduct = '$baseUrl/ReadProduct';
  static  String deleteProduct(String id) => '$baseUrl/DeleteProduct/$id';
  static  String updateProduct(String id) => '$baseUrl/UpdateProduct/$id';
  static const String createProduct = '$baseUrl/CreateProduct';
}

class UserApi{
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String allUser= '$baseUrl/users';
  static const String  getUserDetails = '$allUser';
}