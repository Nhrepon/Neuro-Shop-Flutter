class ApiList{
  static const String _baseUrl = "https://ecom-rs8e.onrender.com/api";
  static const String signUpUrl = "$_baseUrl/auth/signup";
  static const String loginUrl = "$_baseUrl/auth/login";
  static const String verifyOtpUrl = "$_baseUrl/auth/verify-otp";
  static const String sliderUrl = "$_baseUrl/slides";
  static const String productUrl = "$_baseUrl/auth/signup";
  static const String categoryUrl = "$_baseUrl/categories";
  static const String productListUrl = "$_baseUrl/products";
  static String productDetailsUrl(String productId) => "$_baseUrl/products/id/$productId";
  static const String addToCartUrl = "$_baseUrl/cart";
  static const String cartListUrl = "$_baseUrl/cart";
  static String removeCartUrl(String id) => "$_baseUrl/cart/$id";

}