import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionSection extends StatelessWidget {
  final String desc;
  const DescriptionSection({
    required this.desc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          desc,
          textAlign: TextAlign.justify,
          style: GoogleFonts.roboto(
            // alignment

            fontSize: ScreenUtil().setSp(14),
            // fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
