import 'package:flutter/material.dart';
import 'package:store_mobx_app/models/product_model.dart';

class ProductCard extends StatelessWidget {

  final bool readOnly;
  final VoidCallback? onPressed;
  final ProductModel product;

  const ProductCard({
    Key? key,
    this.readOnly = false,
    this.onPressed, 
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.network(product.image ?? ""),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  product.title ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Visibility(
                  visible: !readOnly,
                  child: IconButton(
                    icon: Icon(Icons.add,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: onPressed, 
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}