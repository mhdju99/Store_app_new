
// import 'package:flutter/material.dart';
// import 'package:store_app/models/product/product.dart';
// import 'package:store_app/view/widgets/rating.dart';

// class ItemDetail extends StatelessWidget {
//   products data;
//   ItemDetail({
//     super.key,
//     required this.data,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // endDrawer: const Drawer(),
//       appBar: AppBar(
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "ecomercal",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(
//               "wall",
//               style:
//                   TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
//             )
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           children: [
//             SizedBox(
//                 width: double.infinity,
//                 height: 340,
//                 child: Image.network(
//                   data.image!,
//                 )),
//             const SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: Text(
//                 data.category!,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: Text(
//                 data.description!,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 12),
//               child: Text(
//                 '${data.price.toString()}\$',
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.orange),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Color: "),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: Colors.grey,
//                       border: Border.all(color: Colors.orange),
//                       borderRadius: BorderRadius.circular(100)),
//                   width: 30,
//                   height: 30,
//                 ),
//                 const Text("  gry"),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(100)),
//                   width: 30,
//                   height: 30,
//                 ),
//                 const Text("  black"),
//               ],
//             ),
//             const Padding(
//               padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("size: ",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black)),
//                   SizedBox(
//                     width: 30,
//                   ),
//                   Text("20   30   40   50   60 ",
//                       style: TextStyle(fontSize: 18, color: Colors.grey)),
//                 ],
//               ),
//             ),
//             Center(child: ratings(rate_num: data.rating!.rate)),
//             const SizedBox(
//               height: 40,
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 80),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.black,
//                   boxShadow: const [
//                     BoxShadow(
//                         color: Colors.orange,
//                         spreadRadius: 1,
//                         blurRadius: 9,
//                         blurStyle: BlurStyle.solid)
//                   ],
//                   border: Border.all(color: Colors.orange)),
//               child: MaterialButton(
//                 // padding:
//                 //     const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                 onPressed: () {},

//                 child: const Text("Add to card",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white)),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
