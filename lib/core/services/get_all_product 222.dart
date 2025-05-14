// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:dio/dio.dart';
// import 'package:store_app/core/class/api.dart';
// import 'package:store_app/models/test_product/datum.dart';

// class GetAllProduct2 {
//   final Dio dio;
//   GetAllProduct2({
//     required this.dio,
//   });
//   Future<List<Datum>?> get() async {
//     Response? response =
//         await Api().get(endpoint: "http://192.168.43.191:8080/api/v1/product");
//     List<Datum> allProductList = [];

//     if (response != null) {
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Map<String, dynamic> data = response.data;
//         print("ppppppppppppp");
//         print(data);

//         for (var name in data["data"]) {
//           allProductList.add(Datum.fromJson(name));
//         }
//         print("ddddddddddddddddddddddddddddddddd");
//         print(allProductList);
//         return allProductList;
//       } else {
//         return allProductList;
//       }
//     } else {
//       return allProductList;
//     }
//   }
// }
