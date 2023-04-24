import 'dart:convert';

import 'package:store_simple_app/models/store_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<ProductModel>> getAll() async {
    const url = 'https://fakestoreapi.com/products/';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final products = json.map((e) {
        return ProductModel(
          id: e['id'],
          title: e['title'],
          price: e['price'] == null ? null : e['price'].toDouble(),
          description: e['description'],
          category: e['category'],
          image: e['image'],
          rating: Ratingg(
            rate: e['rating']['rate'] == null ? null : e['rating']['rate'].toDouble(),
            count: e['rating']['count'],
          ),
        );
      }).toList();
      return products;
    }
    throw Exception('Something went wrong in dataProvider file');
  }
}