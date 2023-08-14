import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen(this.product, {super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FakeStore API'),
      ),
      body: Column(children: [
        Expanded(
            flex: 2, child: Image.network(widget.product.image!, height: 350)),
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(widget.product.title!,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(widget.product.description!,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          child: Text(
            widget.product.price.toString(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.end,
          ),
        ),
      ]),
    );
  }
}
