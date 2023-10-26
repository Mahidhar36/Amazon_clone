import 'package:amazon_clone/common_widgets/loader.dart';
import 'package:amazon_clone/constants/globalVaiables.dart';

import 'package:amazon_clone/features/product_detials/screens/product_details_screen.dart';
import 'package:amazon_clone/features/services/home_services.dart';

import 'package:flutter/material.dart';

import '../../../models/product.dart';

class CategoryProducts extends StatefulWidget {
  static const String routeName = "category-products";
  final String category;
  const CategoryProducts({super.key, required this.category});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  List<Product>? productlist;
  final HomeServices homeServices = HomeServices();
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    productlist = await homeServices.fetchCategoryProducts(
        category: widget.category, context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(51),
          child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: GlobalVariables.appBarGradient),
              ),
              title: Text(
                widget.category,
                style: TextStyle(color: Colors.black),
              ))),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.topLeft,
          child: Text(
            'keep shoping for ${widget.category}',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        productlist == null
            ? const Loader()
            : SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.4,
                            mainAxisSpacing: 10),
                    itemCount: productlist!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final product = productlist![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              ProductDetailScreen.routeName,
                              arguments: product);
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 110,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 0.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.network(
                                    product.images[0],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(
                                left: 0,
                                top: 5,
                                right: 15,
                              ),
                              child: Text(
                                product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              )
      ]),
    );
  }
}
