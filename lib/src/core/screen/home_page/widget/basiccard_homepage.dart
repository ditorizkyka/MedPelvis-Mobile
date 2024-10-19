import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medpelvis_mobile/src/constant/themes/size.dart';

class BasicCardHomepage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String onTap;
  final String subtitle;

  const BasicCardHomepage({
    required this.subtitle,
    required this.title,
    required this.imagePath,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return GestureDetector(
        onTap: () {
          context.goNamed(onTap);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.black),
            color: const Color.fromARGB(255, 240, 240, 240),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            subtitle: Text(
              maxLines: 2,
              subtitle,
              style: GoogleFonts.roboto(
                  fontSize: isLandScape
                      ? ScreenUtil().setSp(8)
                      : ScreenUtil().setSp(11)),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            tileColor: Colors.white,
            leading: Container(
              width: SizeApp.w52,
              height: SizeApp.h72,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Image(image: AssetImage(imagePath)),
            ),
            title: Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: (isLandScape)
                    ? ScreenUtil().setSp(9)
                    : ScreenUtil().setSp(14),
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: SizeApp.h20,
            ),
          ),
        ));
  }
}
