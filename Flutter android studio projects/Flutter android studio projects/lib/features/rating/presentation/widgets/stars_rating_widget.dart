import 'package:flutter/material.dart';

class StarRatingWidget extends StatefulWidget {
  @override
  _StarRatingWidgetState createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  int selectedStars = 0; // Số sao mặc định được chọn

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // Giúp Row chỉ chiếm đúng nội dung bên trong
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedStars = index + 1; // Cập nhật số sao được chọn
            });
          },
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Image.asset(
              index < selectedStars
                  ? "assets/star_filled.png"
                  : "assets/star_empty.png",
              width: 42,
              height: 42,
            ),
          ),
        );
      }),
    );
  }
}
