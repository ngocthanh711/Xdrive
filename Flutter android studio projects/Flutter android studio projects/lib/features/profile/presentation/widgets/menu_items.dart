import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItem extends StatelessWidget {
  final String svgIcon;
  final String title;
  final Widget screen;

  const MenuItem({
    super.key,
    required this.svgIcon,
    required this.title,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        svgIcon,
        width: 24,
        height: 24,
        fit: BoxFit.contain,
        alignment: Alignment.centerLeft,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xff0C215C),
          fontWeight: FontWeight.w500,
          height: 1.5,
          fontSize: 16,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
      },
    );
  }
}
