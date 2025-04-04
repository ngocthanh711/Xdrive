import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoInputFields extends StatefulWidget {
  const InfoInputFields({super.key});

  @override
  State<InfoInputFields> createState() => _InfoInputFieldsState();
}

class _InfoInputFieldsState extends State<InfoInputFields> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildInputField(labelText: 'Họ và tên', controller: _nameController),
        const SizedBox(height: 16),
        _buildInputField(labelText: 'Email', controller: _emailController),
      ],
    );
  }

  Widget _buildInputField({
    required String labelText,
    required TextEditingController controller,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xffCAD1E4), width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style:  GoogleFonts.interTight(
                      color: Color(0xff909AB1),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.33333,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: '$labelText '),
                       TextSpan(
                        text: '*',
                        style: GoogleFonts.interTight(color: Color(0xffFB2C36)),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                  style: GoogleFonts.interTight(
                    color: Color(0xff0C215C),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              controller.clear();
            },
            icon: SvgPicture.asset('assets/svg/circle_cross.svg'),
          ),
        ],
      ),
    );
  }
}
