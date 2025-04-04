import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StarRatingWidget extends StatefulWidget {
  final Function(int) onRatingChanged; // Callback trả về số sao

  const StarRatingWidget({Key? key, required this.onRatingChanged}) : super(key: key);

  @override
  _StarRatingWidgetState createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  int selectedStars = 0; // Số sao mặc định

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedStars = index + 1;
            });
            widget.onRatingChanged(selectedStars); // Trả về giá trị sao
          },
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Image.asset(
              index < selectedStars
                  ? "assets/images/star_filled.png"
                  : "assets/images/star_empty.png",
              width: 42,
              height: 42,
            ),
          ),
        );
      }),
    );
  }
}
