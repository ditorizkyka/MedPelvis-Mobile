import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:medpelvis_mobile/src/constant/themes/size.dart';

class DetailInformationSection extends StatefulWidget {
  const DetailInformationSection({
    super.key,
    required this.imgList,
    required this.title,
    required this.explanation,
    required this.function,
  });

  final List<String> imgList;
  final String title;
  final String explanation;
  final String function;

  @override
  State<DetailInformationSection> createState() =>
      _DetailInformationSectionState();
}

class _DetailInformationSectionState extends State<DetailInformationSection> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
            children: [
              Container(
                padding: EdgeInsets.all(20),
                height: SizeApp.customHeight(300), // Atur tinggi carousel
                child: PhotoViewGallery.builder(
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.white, // Latar belakang putih
                  ),
                  itemCount: widget.imgList.length,
                  builder: (context, index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: AssetImage(widget.imgList[index]),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 2.0,
                    );
                  },
                  scrollPhysics: const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => setState(() {
                      _current = entry.key;
                    }),
                    child: Container(
                      width: 20.0,
                      height: 4.0,
                      margin: EdgeInsets.fromLTRB(4.h, 0.h, 4.h, 20.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _current == entry.key
                            ? Colors.green.withOpacity(0.9)
                            : Colors.green.withOpacity(0.4),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        Gap.h16,
        Container(
          padding: const EdgeInsets.all(20),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.roboto(
                  fontSize: ScreenUtil().setSp(19),
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Gap.h16,
              Text(
                "Penjelasan",
                style: GoogleFonts.roboto(
                  fontSize: ScreenUtil().setSp(16),
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                widget.explanation,
                style: GoogleFonts.roboto(
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Fungsi",
                style: GoogleFonts.roboto(
                  fontSize: ScreenUtil().setSp(16),
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                widget.function,
                style: GoogleFonts.roboto(
                  fontSize: ScreenUtil().setSp(14),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
