// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/CategoryproductListBuilder.dart';



class catogeryproduct extends StatelessWidget {
  String category;
   catogeryproduct({
    Key? key,
    required this.category,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category),titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            CategoryProductListBuilder(cato: category)
          ],
        ),
      ),
    );
  }
}
