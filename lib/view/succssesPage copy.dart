// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:store_app/core/viewmodel/AuthenticationManager%20.dart';
// import 'package:store_app/core/viewmodel/landing_viewmodel.dart';
// import 'package:store_app/core/viewmodel/userController.dart';
// import 'package:store_app/view/AddressPage.dart';
// import 'package:store_app/view/home_page.dart';
// import 'package:store_app/view/onBorder.dart';
// import 'package:store_app/view/orderPAge.dart';
// import 'package:store_app/view/widgets/CustomButton.dart';
// import 'package:store_app/view/widgets/buttonText.dart';
// import 'package:store_app/view/wishlistPge.dart';


// class SearchWithFilters extends StatefulWidget {
//   @override
//   _SearchWithFiltersState createState() => _SearchWithFiltersState();
// }

// class _SearchWithFiltersState extends State<SearchWithFilters> {
//   String searchInput = '';
//   String selectedCategory = 'كل الفئات';
//   String selectedPrice = 'كل الأسعار';

//   final List<String> categories = ['كل الفئات', 'الفئة 1', 'الفئة 2'];
//   final List<String> prices = ['كل الأسعار', 'منخفض', 'متوسط', 'مرتفع'];

//   void applyFilters() {
//     // هنا يمكنك إضافة منطق لتصفية النتائج بناءً على القيم المختارة
//     String results =
//         'بحث: $searchInput, فئة: $selectedCategory, سعر: $selectedPrice';
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         content: Text(results),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('بحث بفلاتر'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(labelText: 'ابحث هنا'),
//               onChanged: (value) {
//                 setState(() {
//                   searchInput = value;
//                 });
//               },
//             ),
//             DropdownButton<String>(
//               value: selectedCategory,
//               onChanged: (value) {
//                 setState(() {
//                   selectedCategory = value!;
//                 });
//               },
//               items:
//                   categories.map<DropdownMenuItem<String>>((String category) {
//                 return DropdownMenuItem<String>(
//                   value: category,
//                   child: Text(category),
//                 );
//               }).toList(),
//             ),
//             DropdownButton<String>(
//               value: selectedPrice,
//               onChanged: (value) {
//                 setState(() {
//                   selectedPrice = value!;
//                 });
//               },
//               items: prices.map<DropdownMenuItem<String>>((String price) {
//                 return DropdownMenuItem<String>(
//                   value: price,
//                   child: Text(price),
//                 );
//               }).toList(),
//             ),
//             ElevatedButton(
//               onPressed: applyFilters,
//               child: Text('تطبيق الفلاتر'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
