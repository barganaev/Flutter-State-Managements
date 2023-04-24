import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_simple_app/models/store_model.dart';
import 'package:store_simple_app/services/store_service.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  late Future<List<ProductModel>> futureProd;
  ProductService serv = ProductService();

  @override
  void initState() {
    super.initState();
    futureProd = serv.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Default"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: futureProd,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('hasData');
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
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
                          title: Text('${snapshot.data?[index].title}'),
                          subtitle: Text('${snapshot.data?[index].description}'),
                          trailing: Text('${snapshot.data?[index].rating?.rate}⭐️'),
                        ),
                      ),
                    ),
                  ],
                );
              }
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const Center(
              child: CircularProgressIndicator()
            );
          }
        }
      ),
    );
  }
}
