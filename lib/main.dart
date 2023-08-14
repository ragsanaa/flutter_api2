import 'package:flutter/material.dart';
import 'package:flutter_api2/models/product.dart';
import 'package:flutter_api2/screens/product_screen.dart';
import 'package:flutter_api2/services/fakestore_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Product> products = [];
  @override
  void initState() {
    super.initState();
    getProductWithHttp().then((value) {
      setState(() {
        products = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FakeStore API'),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(products[index].title!,
                    style: const TextStyle(fontSize: 20)),
                trailing: Text(products[index].price.toString(),
                    style: const TextStyle(fontSize: 24)),
                leading: Text(products[index].id.toString(),
                    style: const TextStyle(fontSize: 20)),
                contentPadding: const EdgeInsets.all(8),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(products[index]),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
