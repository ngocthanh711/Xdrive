import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TagButtons extends StatefulWidget {
  final List<String> tags;

  TagButtons({required this.tags});

  @override
  _TagButtonsState createState() => _TagButtonsState();
}

class _TagButtonsState extends State<TagButtons> {
  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: widget.tags.map((tag) {
          final isSelected = selectedTags.contains(tag);

          return ElevatedButton(
            onPressed: () {
              setState(() {
                if (isSelected) {
                  selectedTags.remove(tag);
                } else {
                  selectedTags.add(tag);
                }
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected ? const Color(0xFF16348F) : const Color(0xFFDAE4FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            child: Text(
              tag,
              style: GoogleFonts.interTight(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                height: 1.33333,
                color: isSelected ? Colors.white : const Color(0xFF16348F),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Ví dụ sử dụng:
// TagButtons(
//   tags: [
//     "Tuyệt vời!",
//     "Xe sạch sẽ",
//     "Lái xe an toàn",
//     "Ngồi êm ái",
//     "Đúng giờ",
//     "Di chuyển nhanh",
//     "Ứng dụng dễ dùng"
//   ],
// )