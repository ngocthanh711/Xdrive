// // import 'package:flutter/material.dart';
// //
// // void _addLocation() {
// //   TextEditingController nameController = TextEditingController();
// //   TextEditingController addressController = TextEditingController();
// //
// //   showDialog(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return Scaffold(
// //         title: const Text('Thêm địa điểm mới'),
// //         content: SingleChildScrollView(
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: <Widget>[
// //               TextField(
// //                 controller: nameController,
// //                 decoration: const InputDecoration(labelText: 'Tên địa điểm'),
// //               ),
// //               TextField(
// //                 controller: addressController,
// //                 decoration: const InputDecoration(labelText: 'Địa chỉ'),
// //               ),
// //             ],
// //           ),
// //         ),
// //         // actions: <Widget>[
// //         //   TextButton(
// //         //     child: const Text('Hủy'),
// //         //     onPressed: () {
// //         //       Navigator.of(context).pop();
// //         //     },
// //         //   ),
// //         //   TextButton(
// //         //     child: const Text('Thêm'),
// //         //     onPressed: () {
// //         //       setState(() {
// //         //         likedLocations.add({
// //         //           'name': nameController.text,
// //         //           'address': addressController.text,
// //         //         });
// //         //       });
// //         //       Navigator.of(context).pop();
// //         //     },
// //         //   ),
// //         // ],
// //       );
// //     },
// //   );
// // }
//
// import 'package:flutter/material.dart';
//
// Future<void> showAddLocationDialog(BuildContext context, Function(Map<String, String>) onAdd) async {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//
//   return showDialog<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Thêm địa điểm mới'),
//         content: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(labelText: 'Tên địa điểm'),
//               ),
//               TextField(
//                 controller: addressController,
//                 decoration: const InputDecoration(labelText: 'Địa chỉ'),
//               ),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Hủy'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             child: const Text('Thêm'),
//             onPressed: () {
//               if (nameController.text.isNotEmpty && addressController.text.isNotEmpty) {
//                 onAdd({'name': nameController.text, 'address': addressController.text});
//                 Navigator.of(context).pop();
//               } else {
//                 // Optionally show an error message if fields are empty
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Vui lòng nhập tên và địa chỉ.')),
//                 );
//               }
//             },
//           ),
//         ],
//       );
//     },
//   );
// }