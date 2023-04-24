import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_bloc_app/models/store_model.dart';

enum RequestNames {
  store_products
}

class ApiProvider {
  Future<dynamic> requestPost(RequestNames requestName) async {
    var responseJson;
    switch (requestName) {
      case RequestNames.store_products:
        try {
          final response = await http.get(Uri.parse('https://fakestoreapi.com/products/'));
          responseJson = _response(response, requestName);
        } catch (e) {
          Exception(e);
        }
        return responseJson;
      default:
        return Exception();
    }
  }

  dynamic _response(http.Response response, RequestNames requestname) {
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
      if (requestname == RequestNames.store_products) {
        final json = jsonDecode(response.body) as List;
        final prods = json.map((data) {
            Map<String, dynamic> e = data.e();
            return StoreModel(
            id: e['id'],
            title: e['title'],
            price: e['price'] == null ? null : e['price'].toDouble(),
            description: e['description'],
            category: e['category'],
            image: e['image'],
            rating: Rating(
              rate: e['rating']['rate'] == null ? null : e['rating']['rate'].toDouble(),
              count: e['rating']['count'],
            ),
          );
        }).toList();
        // StoreModel _storeModel = storeModelFromJson(response);
        List<StoreModel> _storeModel = storeModelFromJson(response.body);
        return _storeModel;
      }
    }
  }
}