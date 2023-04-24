import 'package:flutter/material.dart';

class ItemDetailScreen extends StatefulWidget {
  var items;
  ItemDetailScreen({super.key, required this.items});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
          horizontal: MediaQuery.of(context).size.width * 0.05
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 30
              ),
              child: Card(
                // color: Color(0xFFD3D3D3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                      '${widget.items.image!}',
                    ),
                      )
                    ),
                  ),
                ),
              ),
            ),
            Text(
              '${widget.items.title!}',
              style: TextStyle(
                fontSize: 21
              ),
            ),
            Text('${widget.items.description!}'),
          ]
        ),
      ),
    );
  }
}