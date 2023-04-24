import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:store_mobx_app/screens/product_list_screen.dart';
import 'package:store_mobx_app/widgets/product_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
        elevation: 0,
        title: Text(
          "Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cartStore.productList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductCard(
                        product: cartStore.productList[index],
                        readOnly: true,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: MaterialButton(
                elevation: 0,
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                color: Theme.of(context).colorScheme.primary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "CLEAR CART",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                  ],
                ),
                onPressed: () => _clearCartAndReturn(),
              ),
            ),
          )
        ],
      ),
    );
  }

  _clearCartAndReturn() {
    cartStore.clearCart();
    Navigator.pop(context);
  }
}