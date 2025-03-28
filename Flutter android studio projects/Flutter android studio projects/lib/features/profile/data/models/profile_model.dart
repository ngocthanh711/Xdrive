// class UserModel {
//   final String name;
//   final String phone;
//   final String? avatarUrl; // Cho phép null
//
//   UserModel({required this.name, required this.phone, this.avatarUrl});
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       name: "${json['firstName']} ${json['lastName']}",
//       phone: json['phone'] ?? 'N/A',
//       avatarUrl: json['image'], // Nếu API không có ảnh, giá trị này sẽ là null
//     );
//   }
// }
