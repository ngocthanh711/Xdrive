import 'package:intl/intl.dart';

String formatPriceString(String priceString) {
  try {
    // Chuyển đổi sang số nguyên
    int price = int.parse(priceString);

    // Định dạng số với dấu phẩy
    final formatter = NumberFormat('#,###');
    String formattedPrice = formatter.format(price);

    // Thêm ký tự "đ" vào cuối
    return '$formattedPriceđ';
  } catch (e) {
    // Xử lý lỗi nếu chuỗi không hợp lệ
    return 'Lỗi định dạng giá';
  }
}