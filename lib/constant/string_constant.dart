class AppString {
  static AppString instance = AppString._init();

  AppString._init();

  /* auth String */
  static String baseUrl = "https://jsonplaceholder.typicode.com";
  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static var posts = '/posts';

  static String textAppName = "Post List";

}
