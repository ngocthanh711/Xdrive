import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});



  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? _selectedLanguage;

  void _selectLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  void showDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(24.0),
            child: Material( // Sử dụng Material để có nền và shadow mặc định
              color: Colors.transparent, // Để màu nền của Container hiển thị
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      SvgPicture.asset('assets/svg/circle_check.svg'),
                      const SizedBox(height: 16),
                      Text(
                        'Cập nhật ngôn ngữ thành công!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.interTight(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: const Color(0xFF0C215C),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(buildContext).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF16348F),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                          ),
                          child: Text(
                            'Hoàn thành',
                            style: GoogleFonts.interTight(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: SvgPicture.asset('assets/svg/x.svg'),
                      onPressed: () {
                        Navigator.of(buildContext).pop();
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(anim1),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(anim1),
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Ngôn ngữ',
          style: GoogleFonts.interTight(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: const Color(0xFF0C215C),
            height: 1.4,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _LanguageButton(
              language: 'Tiếng Việt',
              icon: 'assets/images/vietnam.png',
              // You can use an actual flag image/icon here
              isSelected: _selectedLanguage == 'Tiếng Việt',
              onTap: () => _selectLanguage('Tiếng Việt'),
            ),
            const SizedBox(height: 8),
            _LanguageButton(
              language: 'English',
              icon: 'assets/images/english.png',
              // You can use an actual flag image/icon here
              isSelected: _selectedLanguage == 'English',
              onTap: () => _selectLanguage('English'),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: ElevatedButton(
                onPressed:() {
                  showDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff16348F),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  disabledBackgroundColor: Color(0xff16348F),
                  disabledForegroundColor: Colors.white,
                ),
                child: Text(
                  'Cập nhật',
                  style: GoogleFonts.interTight(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String language;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageButton({
    Key? key,
    required this.language,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffF0F4FF) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? const Color(0xff16348F) : Color(0xffCAD1E4),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Image.asset(icon), // Adjust icon size as needed
            const SizedBox(width: 12),
            Text(
              language,
              style: GoogleFonts.interTight(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: const Color(0xFF0C215C),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
