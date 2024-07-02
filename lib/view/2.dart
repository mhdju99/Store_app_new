// import 'package:flutter/material.dart';
// import 'package:icons_plus/icons_plus.dart';
// import 'package:insta_image_viewer/insta_image_viewer.dart';
// import 'package:store_app/models/all_product/all_product.dart';
// import 'package:store_app/models/product/product.dart';
// import 'package:store_app/view/widgets/rating.dart';

// class ItemDetail2 extends StatelessWidget {
//   AllProduct data;
//   ItemDetail2({
//     super.key,
//     required this.data,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           FloatingActionButton.small(
//             heroTag: UniqueKey(),
//             onPressed: () {},
//             child: const Icon(Icons.favorite_border_outlined),
//           ),
//           FloatingActionButton.extended(
//             onPressed: () {},
//             heroTag: UniqueKey(),
//             backgroundColor: Colors.red[600],
//             isExtended: true,
//             icon: const Icon(
//               Clarity.shopping_bag_solid,
//               color: Colors.white,
//               size: 12,
//             ),
//             label: const Text(
//               "     Add to Cart     ",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.white,
//               ),
//             ),
//           )
//         ],
//       ),
//       body: Stack(
//         children: [
//           Container(
//             padding: const EdgeInsets.only(top: 30),
//             width: double.infinity,
//             height: 400,
//             child: InstaImageViewer(
//               child: Image(
//                 image: Image.network(fit: BoxFit.fitWidth, data.images!).image,
//               ),
//             ),
//           ),
//           DraggableScrollableSheet(
//               initialChildSize: 0.6,
//               minChildSize: 0.6,
//               maxChildSize: 0.95,
//               builder: (contex, controlar) {
//                 return ClipRRect(
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     clipBehavior: Clip.hardEdge,
//                     decoration: const BoxDecoration(
//                         color: Color.fromARGB(255, 243, 243, 243),
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(20),
//                             topRight: Radius.circular(20))),
//                     child: ListView(
//                       clipBehavior: Clip.hardEdge,
//                       controller: controlar,
//                       children: [
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 90),
//                           color: Colors.black,
//                           height: 40,
//                           width: 20,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 8),
//                           child: Text(
//                             data.title!,
//                             textAlign: TextAlign.start,
//                             style: const TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 8),
//                           child: Text(
//                             data.description!,
//                             textAlign: TextAlign.start,
//                             style: const TextStyle(
//                                 fontSize: 16, color: Colors.grey),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 12),
//                           child: Text(
//                             '${data.price.toString()}\$',
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.orange),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text("Color: "),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.grey,
//                                   border: Border.all(color: Colors.orange),
//                                   borderRadius: BorderRadius.circular(100)),
//                               width: 30,
//                               height: 30,
//                             ),
//                             const Text("  gry"),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.black,
//                                   borderRadius: BorderRadius.circular(100)),
//                               width: 30,
//                               height: 30,
//                             ),
//                             const Text("  black"),
//                           ],
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text("size: ",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black)),
//                               SizedBox(
//                                 width: 30,
//                               ),
//                               Text("20   30   40   50   60 ",
//                                   style: TextStyle(
//                                       fontSize: 18, color: Colors.grey)),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               })
//         ],
//       ),
//     );
//   }
// }
