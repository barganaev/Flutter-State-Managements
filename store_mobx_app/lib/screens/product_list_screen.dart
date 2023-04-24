import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart';
import 'package:store_mobx_app/models/product_model.dart';
import 'package:store_mobx_app/repositories/store_repository.dart';
import 'package:store_mobx_app/screens/cart_screen.dart';
import 'package:store_mobx_app/stores/cart_store.dart';
import 'package:store_mobx_app/widgets/product_card.dart';

final cartStore = CartStore();
class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  late Future<List<ProductModel>> _request;
  final _repository = StoreRepository(Client());

  @override
  void initState() {
    _request = _fetchProducts();
    super.initState();
  }

  Future<List<ProductModel>> _fetchProducts() async {
    return await _repository.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Products", 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [
            const Icon(Icons.shopping_cart_outlined),
            Observer(
              builder: (_) {
                return Visibility(
                  visible: cartStore.productList.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("${cartStore.productList.length}"),
                  ),
                );
              },
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => _goToCartPage(),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _request,
        builder: (context, snapshot) {
          if(snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            final products = snapshot.data!;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(
                    product: products[index],
                    onPressed: () => cartStore.addProductToCart(products[index]),
                  ),
                );
              },
            );
          } else if(snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.secondary,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  _goToCartPage() {
    final route = MaterialPageRoute(
      builder: (context) => const CartPage(),
    );
    Navigator.push(context, route);
  }
}