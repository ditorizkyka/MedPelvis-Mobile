import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleSection extends StatelessWidget {
  final String title;
  const TitleSection({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: ScreenUtil().setSp(19),
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
