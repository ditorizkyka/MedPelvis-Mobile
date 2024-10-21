import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medpelvis_mobile/src/constant/themes/colors.dart';
import 'package:medpelvis_mobile/src/constant/themes/size.dart';
import 'package:medpelvis_mobile/src/core/screen/home_page/widget/basiccard_homepage.dart';
import 'package:medpelvis_mobile/src/core/screen/home_page/widget/footer_homepage.dart';
import 'package:medpelvis_mobile/src/core/screen/home_page/widget/introduction_homepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    AppBar myAppBar = (isLandScape)
        ? AppBar(
            elevation: 0,
            // backgroundColor: const Color.fromARGB(255, 90, 190, 93),
            title: Container(
              margin: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      color: Colors.black,
                      child: Image.asset(
                        "assets/logo/medpelvis_mobile.png",
                      )),
                  Gap.w8,
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MedPelvis",
                        style: GoogleFonts.roboto(
                          fontSize: ScreenUtil().setSp(10),
                          fontWeight: FontWeight.w700,
                          color: ColorApp.darkGrey,
                        ),
                      ),
                      Gap.w4,
                      Text(
                        "Mobile",
                        style: GoogleFonts.roboto(
                          fontSize: ScreenUtil().setSp(10),
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        : AppBar(
            elevation: 0,
            // backgroundColor: const Color.fromARGB(255, 90, 190, 93),
            title: Container(
              margin: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 35.h,
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: ColorApp.greenApp,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        "assets/logo/medpelvis_mobile.png",
                      )),
                  Gap.w8,
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MedPelvis",
                        style: GoogleFonts.roboto(
                          fontSize: ScreenUtil().setSp(16),
                          fontWeight: FontWeight.w700,
                          color: ColorApp.darkGrey,
                        ),
                      ),
                      Gap.w4,
                      Text(
                        "Mobile",
                        style: GoogleFonts.roboto(
                          fontSize: ScreenUtil().setSp(16),
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );

    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 50, 154, 53),
      appBar: myAppBar,
      body: (isLandScape)
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                    width: MediaQuery.of(context).size.width,
                    height: bodyHeight * 0.5,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                    child: const IntroductionHomePage(),
                  ),
                  Gap.h16,
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 10),
                          child: Text(
                            "Pilihan Pembelajaran",
                            style: GoogleFonts.roboto(
                              fontSize: ScreenUtil().setSp(9),
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Gap.h16,
                        Container(
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const BasicCardHomepage(
                                title: "Anatomi Panggul",
                                subtitle:
                                    "Pelajari struktur tulang panggul yang penting dalam proses persalinan.",
                                imagePath: "assets/image/anatomi_panggul.png",
                                onTap: "anatomi_panggul",
                              ),
                              Gap.h12,
                              const BasicCardHomepage(
                                title: "Mekanisme Bersalin",
                                subtitle:
                                    "Temukan tahapan persalinan dari awal hingga akhir.",
                                imagePath: "assets/image/proses_bersalin.png",
                                onTap: "proses_bersalin",
                              ),
                              Gap.h12,
                              const BasicCardHomepage(
                                subtitle:
                                    "Eksplorasi anatomi kaki manusia yang mendukung gerak dan keseimbangan.",
                                title: "Anatomi Kaki",
                                imagePath: "assets/image/anatomi_kaki.png",
                                onTap: "anatomi_kaki",
                              ),
                              Gap.h12,
                              const BasicCardHomepage(
                                subtitle:
                                    "Pelajari struktur tangan dari tulang hingga otot.",
                                title: "Anatomi Tangan",
                                imagePath: "assets/image/anatomi_tangan.png",
                                onTap: "anatomi_tangan",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Gap.h20,
                  SizedBox(
                      height: bodyHeight * 0.2, child: const FooterHomePage()),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntroductionHomePage(),
                Gap.h12,
                PilihanPembelajaran(bodyHeight: bodyHeight),
                Gap.h12,
                SizedBox(
                    height: bodyHeight * 0.06, child: const FooterHomePage()),
              ],
            ),
    );
  }
}

class PilihanPembelajaran extends StatelessWidget {
  const PilihanPembelajaran({
    super.key,
    required this.bodyHeight,
  });

  final double bodyHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bodyHeight * 0.65,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pilihan Pembelajaran",
            style: GoogleFonts.roboto(
              fontSize: ScreenUtil().setSp(16),
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const BasicCardHomepage(
            title: "Anatomi Panggul",
            subtitle:
                "Pelajari struktur tulang panggul yang penting dalam proses persalinan.",
            imagePath: "assets/image/anatomi_panggul.png",
            onTap: "anatomi_panggul",
          ),
          // Gap.h12,
          const BasicCardHomepage(
            title: "Mekanisme Persalinan",
            subtitle: "Temukan Mekanisme Persalinan dari awal hingga akhir.",
            imagePath: "assets/image/proses_bersalin.png",
            onTap: "proses_bersalin",
          ),
          // Gap.h12,
          const BasicCardHomepage(
            subtitle:
                "Eksplorasi anatomi kaki manusia yang mendukung gerak dan keseimbangan.",
            title: "Anatomi Kaki",
            imagePath: "assets/image/anatomi_kaki.png",
            onTap: "anatomi_kaki",
          ),
          // Gap.h12,
          const BasicCardHomepage(
            subtitle: "Pelajari struktur tangan dari tulang hingga otot.",
            title: "Anatomi Tangan",
            imagePath: "assets/image/anatomi_tangan.png",
            onTap: "anatomi_tangan",
          ),
        ],
      ),
    );
  }
}
