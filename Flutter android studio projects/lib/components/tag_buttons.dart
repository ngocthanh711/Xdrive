import 'package:flutter/material.dart';

class TagButtons extends StatefulWidget {
  @override
  _TagButtonsState createState() => _TagButtonsState();
}

class _TagButtonsState extends State<TagButtons> {
  List<String> tags = [
    "Tuyệt vời!",
    "Xe sạch sẽ",
    "Lái xe an toàn",
    "Ngồi êm ái",
    "Đúng giờ",
    "Di chuyển nhanh",
    "Ứng dụng dễ dùng",
  ];
  Set<String> selectedTags = {}; // Lưu trạng thái button nào được chọn

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 8,
        runSpacing: 8,
        children:
        tags.map((tag) {
          bool isSelected = selectedTags.contains(tag);

          return ElevatedButton(
            onPressed: () {
              setState(() {
                if (isSelected) {
                  selectedTags.remove(tag); // Bỏ chọn nếu đã chọn trước đó
                } else {
                  selectedTags.add(tag); // Chọn nếu chưa chọn
                }
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
              isSelected ? Color(0xFF16348F) : Color(0xFFDAE4FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            child: Text(
              tag,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                height: 1.33333,
                color: isSelected ? Colors.white : Color(0xFF16348F),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}