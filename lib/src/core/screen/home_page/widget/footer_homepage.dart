import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterHomePage extends StatelessWidget {
  const FooterHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Center(
      child: Container(
        // margin: const EdgeInsets.all(10),
        // padding: EdgeInsets.fromLTRB(0, 0, 0, 30.h),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.black,
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "© 2024 Universitas Hang Tuah Pekanbaru",
            style: GoogleFonts.roboto(
                fontSize: isLandScape
                    ? ScreenUtil().setSp(8)
                    : ScreenUtil().setSp(12),
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
