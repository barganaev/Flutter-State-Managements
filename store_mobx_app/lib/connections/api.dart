class Api {
  static const String _baseUrl = "https://fakestoreapi.com";
  static const String _productsEndpoint = "$_baseUrl/products";

  Uri get getAllProducts => Uri.parse(_productsEndpoint);
}