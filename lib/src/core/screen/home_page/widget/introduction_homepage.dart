import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medpelvis_mobile/src/constant/themes/size.dart';

class IntroductionHomePage extends StatelessWidget {
  const IntroductionHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Stack(
      children: [
        Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            width: mediaQueryWidth,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              gradient: const SweepGradient(
                colors: [
                  Colors.green,
                  Color.fromARGB(255, 78, 207, 82),
                ],
                startAngle: 0.0,
                endAngle: 3.14, // Pi radians = 180 degrees
                center: Alignment.center,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    child: Text(
                      "Sistem Pembelajaran",
                      style: GoogleFonts.roboto(
                        fontSize: (isLandScape)
                            ? ScreenUtil().setSp(8)
                            : ScreenUtil().setSp(13),
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Gap.h12,
                  Text(
                    "Anatomi Panggul &\nMekanisme Persalinan",
                    style: GoogleFonts.roboto(
                      fontSize: (isLandScape)
                          ? ScreenUtil().setSp(11)
                          : ScreenUtil().setSp(22),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ]),
              ],
            )),
      ],
    );
  }
}
