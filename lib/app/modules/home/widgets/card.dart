// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tmdb_test/app/modules/home/views/detail_view.dart';

// // class ListCard extends StatelessWidget {
// //   String category;
// //   List<Map<String, dynamic>> film;

// //   ListCard({Key? key, required this.category, required this.film})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           SizedBox(height: 20),
// //           Text(
// //             category,
// //             style: TextStyle(
// //                 color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
// //           ),
// //           SizedBox(height: 15),
// //           SingleChildScrollView(
// //             scrollDirection: Axis.horizontal,
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               children: film.map((e) => ViewCard(desicriptoin: e)).toList(),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// class ViewCard extends StatelessWidget {
//   Map<String, dynamic> desicriptoin;
//   ViewCard({Key? key, required this.desicriptoin}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Get.to(DetailView()),
//       child: Container(
//         height: 200,
//         width: 150,
//         margin: EdgeInsets.only(right: 10, bottom: 10),
//         decoration: BoxDecoration(
//           color: Colors.grey[350],
//           borderRadius: BorderRadius.all(
//             Radius.circular(20),
//           ),
//         ),
//         child: Column(children: [
//           Container(
//             height: 130,
//             width: Get.width,
//             decoration: BoxDecoration(
//               color: Colors.amber,
//               borderRadius: BorderRadius.vertical(
//                 top: Radius.circular(20),
//               ),
//             ),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(20),
//                 ),
//                 child: Image.network(
//                     'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1780&q=80')),
//           ),
//           Text(desicriptoin['title']),
//           Text(desicriptoin['rate'].toString()),
//         ]),
//         // child: Image.network(
//         //     'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1780&q=80'),
//       ),
//     );
//   }
// }
