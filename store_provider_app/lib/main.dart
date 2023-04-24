import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_provider_app/screens/provider_screen.dart';
import 'package:store_provider_app/services/data_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider<StoreProvider>(create: (_) => StoreProvider(),)
        ChangeNotifierProvider(create: (_) => StoreProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProviderScreen()
      ),
    );
  }
}
