import 'package:store_mobx_app/models/product_model.dart';

abstract class IStoreRepository {
  Future<List<ProductModel>> getAll();
}