import 'package:flutter/material.dart';
import 'package:laju_flutter/models/product_entry.dart';
import 'package:laju_flutter/widgets/left_drawer.dart';
import 'package:laju_flutter/screens/product_detail.dart';
import 'package:laju_flutter/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyProductListPage extends StatefulWidget {
  const MyProductListPage({super.key});

  @override
  State<MyProductListPage> createState() => _MyProductListPageState();
}

class _MyProductListPageState extends State<MyProductListPage> {
  Future<List<ProductEntry>> fetchMyProducts(CookieRequest request) async {
    // Ambil semua produk dari endpoint /json/
    final response = await request.get('http://localhost:8000/json/my-products/');

    List<ProductEntry> allProducts = [];
    for (var d in response) {
      if (d != null) {
        allProducts.add(ProductEntry.fromJson(d));
      }
    }

    // Filter berdasarkan user login
    final userId = request.jsonData["id"]; // ID user yang sedang login

    List<ProductEntry> myProducts = allProducts
        .where((p) => p.userId == userId)
        .toList();

    return myProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchMyProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data.isEmpty) {
            return const Center(
              child: Text(
                'You have no products yet.',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (_, index) => ProductEntryCard(
              product: snapshot.data[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      product: snapshot.data[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
