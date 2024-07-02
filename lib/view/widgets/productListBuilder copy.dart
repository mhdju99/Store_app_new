// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/all_product/all_product.dart';
import 'package:store_app/models/product/product.dart';
import 'package:store_app/models/test_product/datum.dart';
import 'package:store_app/models/test_product/test_product.dart';
import 'package:store_app/view/widgets/productListView.dart';

class ProductListBuilder2 extends StatefulWidget {
  // String cato;
   var future;
   ProductListBuilder2({
    Key? key,
    required this.future,
  }) : super(key: key);
 

  @override
  State<ProductListBuilder2> createState() => _ProductListBuilderState();
}

class _ProductListBuilderState extends State<ProductListBuilder2> {
  List<products> productList = [];
  bool isLoading = true;
 

  @override
  void initState() {
    super.initState();

  }

  // Future<void> getNews() async {
  //   articalList = await NewsServic(dio: Dio()).getNews();
  //   setState(() {});
  //   isLoading = false;
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<products>?>(
      future: widget.future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ProductLIstView(
        
            productList: snapshot.data ?? [],
          );
        } else if (snapshot.hasError) {
          return const Text("data");
        } else {
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}


// isLoading
//         ? const SliverToBoxAdapter(
//             child: Center(child: CircularProgressIndicator()))
//         : news_list_view(
//             articalList: articalList,
//           );