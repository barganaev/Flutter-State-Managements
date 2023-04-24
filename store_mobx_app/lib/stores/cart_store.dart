import 'package:mobx/mobx.dart';
import 'package:store_mobx_app/models/product_model.dart';
part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore; 

abstract class _CartStore with Store {

  @observable
  var productList = ObservableList<ProductModel>();

  @action
  addProductToCart(ProductModel product) {
    productList.add(product);
  }

  @action
  clearCart() {
    productList.clear();
  }
} 