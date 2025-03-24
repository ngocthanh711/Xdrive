import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  int expandedIndex = -1; // Lưu mục nào đang mở (-1 là không mở mục nào)

  List<Map<String, String>> faqList = [
    {
      "question": "Làm thế nào để đặt xe?",
      "answer":
          "Bạn có thể đặt xe bằng cách nhập điểm đón và điểm đến trên ứng dụng, chọn loại xe và xác nhận đặt xe.",
    },
    {
      "question": "Tôi có thể hủy chuyến đi không?",
      "answer": "Bạn có thể hủy chuyến đi trong vòng 5 phút sau khi đặt xe.",
    },
    {"question": "Làm thế nào để thanh toán?", "answer": "Content"},
    {"question": "Điều gì xảy ra nếu xe bị trễ?", "answer": "Content"},
    {"question": "Tôi có thể mang theo thú cưng không?", "answer": "Content"},
  ];

  void onExpansionChanged(bool expanded, int index) {
    setState(() {
      expandedIndex =
          expanded
              ? index
              : -1; // Nếu mở thì lưu index, nếu đóng thì đặt lại -1
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:
            faqList.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> faq = entry.value;
              bool isExpanded =
                  expandedIndex == index; // Kiểm tra mục nào đang mở

              return ExpansionTile(
                trailing: AnimatedRotation(
                  duration: Duration(milliseconds: 200),
                  turns: isExpanded ? 0.5 : 0.0, // Xoay 180 độ khi mở rộng
                  child: Icon(Icons.keyboard_arrow_down),
                ),
                initiallyExpanded: isExpanded,
                onExpansionChanged: (expanded) => onExpansionChanged(expanded, index),
                title: Text(
                  faq["question"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    fontSize: 16,
                    color: Color(0xFF0C215C), // Đổi màu chữ tiêu đề
                  ),
                ),
                collapsedBackgroundColor: null,
                // Màu nền khi collapse
                backgroundColor: null,
                // Màu nền khi mở ra
                tilePadding: EdgeInsets.only(bottom: 0),
                // Khoảng cách giữa title và nội dung
                childrenPadding: EdgeInsets.only(top: 0, bottom: 16),
                // Giảm khoảng cách giữa title và nội dung
                children: [
                  Text(
                    faq["answer"]!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Color(0xFF909AB1),
                    ),
                  ),
                ],
                // onExpansionChanged: (expanded) {
                //   setState(() {
                //     isExpanded = expanded; // Cập nhật trạng thái mở rộng
                //   });
                // },
              );
            }).toList(),
      ),
    );
  }
}
