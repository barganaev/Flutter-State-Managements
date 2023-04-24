import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_provider_app/services/data_provider.dart';

class ProviderScreen extends StatefulWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<StoreProvider>(context, listen: false).getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: Consumer<StoreProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final products = value.products;
          return ListView.builder(
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      '${index+1}', 
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: ListTile(
                      leading: Image.asset('assets/exp68.png', height: 40,),
                      title: Text('${products[index].title}'),
                      subtitle: Text('${products[index].description}'),
                      trailing: Text('${products[index].rating?.rate}⭐️'),
                    ),
                  ),
                ),
              ],
            );
          }
        );
        },
      ),
    );
  }
}