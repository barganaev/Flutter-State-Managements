import 'dart:convert';

import 'package:http/http.dart';
import 'package:store_mobx_app/connections/api.dart';
import 'package:store_mobx_app/models/product_model.dart';
import 'package:store_mobx_app/repositories/interfaces/istore_repository.dart';

class StoreRepository implements IStoreRepository {
  
  final Client client;
  final timeout = const Duration(seconds: 60);

  StoreRepository(this.client);

  @override
  Future<List<ProductModel>> getAll() async {
    final response = await client.get(
      Api().getAllProducts,
    ).timeout(timeout);

    if(response.statusCode == 200) {
      final list = <ProductModel>[];
      final json = jsonDecode(response.body);
      json.forEach((v) {
        list.add(ProductModel.fromJson(v));
      });
      return list;
    } else {
      throw Exception("Unable to get products");
    }
  }

}