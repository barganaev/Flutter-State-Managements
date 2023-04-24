import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_mobx_app/screens/product_list_screen.dart';
import 'package:store_mobx_app/values/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: darkColorScheme,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const ProductListPage(),
    );
  }
}