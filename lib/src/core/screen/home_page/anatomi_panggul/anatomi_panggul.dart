import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medpelvis_mobile/src/constant/themes/colors.dart';
import 'package:medpelvis_mobile/src/constant/themes/size.dart';
import 'package:medpelvis_mobile/src/core/data/dataContent.dart';
import 'package:medpelvis_mobile/src/core/screen/home_page/widget/footer_homepage.dart';
import 'package:medpelvis_mobile/src/widgets/description.dart';
import 'package:medpelvis_mobile/src/widgets/detail_information_section.dart';
import 'package:medpelvis_mobile/src/widgets/title_section.dart';
import 'package:medpelvis_mobile/src/widgets/youtube_section.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AnatomiPanggul extends StatefulWidget {
  const AnatomiPanggul({super.key});

  @override
  State<AnatomiPanggul> createState() => _AnatomiPanggulState();
}

class _AnatomiPanggulState extends State<AnatomiPanggul> {
  final videoURL = "https://youtu.be/qcuv1u-3bDo";
  late YoutubePlayerController _youtubePlayerController;
  bool _isFullScreen = false; // Untuk melacak mode fullscreen

  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );

    // Listener untuk mendeteksi perubahan mode fullscreen
    _youtubePlayerController.addListener(() {
      if (_youtubePlayerController.value.isFullScreen != _isFullScreen) {
        setState(() {
          _isFullScreen = _youtubePlayerController.value.isFullScreen;
        });
      }
    });
    _youtubePlayerController.addListener(_onPlayerStateChange);
  }

  void _onPlayerStateChange() {
    if (_youtubePlayerController.value.isFullScreen) {
      // Saat fullscreen, atur orientasi ke landscape.
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      // Kembalikan orientasi ke portrait setelah keluar dari fullscreen.
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  @override
  void dispose() {
    // Reset orientasi saat keluar dari halaman.
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    _youtubePlayerController.removeListener(_onPlayerStateChange);
    _youtubePlayerController.dispose();
    super.dispose();
  }

  String _selectedItem = 'Sacrum (Os. Sacrum)';

  // Content based on dropdown selection
  Widget getContentPelvis() {
    switch (_selectedItem) {
      case 'Sacrum (Os. Sacrum)':
        return DetailInformationSection(
          imgList: dataContent['pelvis']!['sacrum']['imgList'],
          title: dataContent['pelvis']!['sacrum']['title'],
          explanation: dataContent['pelvis']!['sacrum']['explanation'],
          function: dataContent['pelvis']!['sacrum']['function'],
        );
      case 'Coccyx (Os. Coccigys)':
        return DetailInformationSection(
          imgList: dataContent['pelvis']!['coccyx']['imgList'],
          title: dataContent['pelvis']!['coccyx']['title'],
          explanation: dataContent['pelvis']!['coccyx']['explanation'],
          function: dataContent['pelvis']!['coccyx']['function'],
        );
      case "Sacral Promontory (Promontorium)":
        return DetailInformationSection(
          imgList: dataContent['pelvis']!["sacral_promontory"]['imgList'],
          title: dataContent['pelvis']!["sacral_promontory"]['title'],
          explanation: dataContent['pelvis']!["sacral_promontory"]
              ['explanation'],
          function: dataContent['pelvis']!["sacral_promontory"]['function'],
        );
      case "Sacroiliac Joint (Sayap Sacrum)":
        return DetailInformationSection(
          imgList: dataContent['pelvis']!['sacroiliac_joint']['imgList'],
          title: dataContent['pelvis']!['sacroiliac_joint']['title'],
          explanation: dataContent['pelvis']!['sacroiliac_joint']
              ['explanation'],
          function: dataContent['pelvis']!['sacroiliac_joint']['function'],
        );
      case "Ischial Spine (Spina Ischiadika)":
        return DetailInformationSection(
          imgList: dataContent['pelvis']!['ishicial_spine']['imgList'],
          title: dataContent['pelvis']!['ishicial_spine']['title'],
          explanation: dataContent['pelvis']!['ishicial_spine']['explanation'],
          function: dataContent['pelvis']!['ishicial_spine']['function'],
        );
      case "Pubic Crest (Tuberculum Pubicum)":
        return DetailInformationSection(
          imgList: dataContent['pelvis']!['pubic_crest']['imgList'],
          title: dataContent['pelvis']!['pubic_crest']['title'],
          explanation: dataContent['pelvis']!['pubic_crest']['explanation'],
          function: dataContent['pelvis']!['pubic_crest']['function'],
        );
      case "Pubic Sysmphysis (Symphisis Pubis)":
        return DetailInformationSection(
          imgList: dataContent['pelvis']!['pubic_symphysis']['imgList'],
          title: dataContent['pelvis']!['pubic_symphysis']['title'],
          explanation: dataContent['pelvis']!['pubic_symphysis']['explanation'],
          function: dataContent['pelvis']!['pubic_symphysis']['function'],
        );
      case "Pubic arch (Arcus Pubis)":
        return DetailInformationSection(
          imgList: dataContent['pelvis']!['pubic_arch']['imgList'],
          title: dataContent['pelvis']!['pubic_arch']['title'],
          explanation: dataContent['pelvis']!['pubic_arch']['explanation'],
          function: dataContent['pelvis']!['pubic_arch']['function'],
        );
      case "Ischium (Os. Ischium)":
        return DetailInformationSection(
          imgList: dataContent['pelvis']!['ischium']['imgList'],
          title: dataContent['pelvis']!['ischium']['title'],
          explanation: dataContent['pelvis']!['ischium']['explanation'],
          function: dataContent['pelvis']!['ischium']['function'],
        );
      case "Acetabulum":
        return DetailInformationSection(
          imgList: dataContent['pelvis']!['acetabulum']['imgList'] ??
              ['assets/image/imagePelvis/sacrum/sacrum1.png'],
          title: dataContent['pelvis']!['acetabulum']['title'],
          explanation: dataContent['pelvis']!['acetabulum']['explanation'],
          function: dataContent['pelvis']!['acetabulum']['function'],
        );
      case "Pelvic brim (libra innominata)":
        return DetailInformationSection(
          imgList: dataContent['pelvis']!['pelvic_brim']['imgList'],
          title: dataContent['pelvis']!['pelvic_brim']['title'],
          explanation: dataContent['pelvis']!['pelvic_brim']['explanation'],
          function: dataContent['pelvis']!['pelvic_brim']['function'],
        );
      case "Ilium (Os. Illium)":
        return DetailInformationSection(
          imgList: dataContent['pelvis']!['ilium']['imgList'],
          title: dataContent['pelvis']!['ilium']['title'],
          explanation: dataContent['pelvis']!['ilium']['explanation'],
          function: dataContent['pelvis']!['ilium']['function'],
        );
      case "Iliach Crest (Crista Illiaca)":
        return DetailInformationSection(
          imgList: dataContent['pelvis']!['iliach_crest']['imgList'],
          title: dataContent['pelvis']!['iliach_crest']['title'],
          explanation: dataContent['pelvis']!['iliach_crest']['explanation'],
          function: dataContent['pelvis']!['iliach_crest']['function'],
        );
      default:
        return const Text("not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _isFullScreen
          ? null
          : AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white, // Ubah warna panah kembali di halaman ini
              ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorApp.greenApp,
                      Color.fromARGB(255, 109, 239, 113),
                    ],
                  ),
                ),
              ),
              centerTitle: true,
              title: Text(
                "Anatomi Panggul",
                style: GoogleFonts.roboto(
                  fontSize: ScreenUtil().setSp(18),
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
      body: SafeArea(
        child: _isFullScreen
            ? YoutubePlayer(
                controller: _youtubePlayerController,
                showVideoProgressIndicator: true,
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: widthScreen,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          VideoSection(
                              youtubePlayerController:
                                  _youtubePlayerController),
                          Gap.h28,
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
                              children: [
                                const TitleSection(
                                  title: "Anatomi Panggul",
                                ),
                                Gap.h16,
                                const DescriptionSection(
                                    desc:
                                        "Panggul adalah sebuah cincin tulang yang menopang tulang belakang dan melindungi organ perut. Bagian tubuh ini berada tepat di dasar perut atau antara perut/punggung bawah dan tungkai kaki.\n \nOtot kaki, punggung, dan perut melekat pada bagian panggul. Otot-otot ini menjaga tubuh tetap tegak dan memungkinkan tubuh untuk bergerak, seperti menekuk, memutar pinggang, berjalan, hingga berlari.\n \nSebenarnya, area panggul wanita dan pria sama-sama terdiri dari tulang, otot, sendi, ligamen, saraf, dan organ-organ di dalamnya. Hanya saja, organ pada anatomi panggul pria dan wanita berbeda."),
                              ],
                            ),
                          ),
                          Gap.h16,
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: DropdownButtonFormField<String>(
                              borderRadius: BorderRadius.circular(10),
                              value: _selectedItem,
                              isExpanded: true,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedItem = newValue!;
                                });
                              },
                              items: <String>[
                                "Sacrum (Os. Sacrum)",
                                "Coccyx (Os. Coccigys)",
                                "Sacral Promontory (Promontorium)",
                                "Sacroiliac Joint (Sayap Sacrum)",
                                "Ischial Spine (Spina Ischiadika)",
                                "Pubic Crest (Tuberculum Pubicum)",
                                "Pubic Sysmphysis (Symphisis Pubis)",
                                "Pubic arch (Arcus Pubis)",
                                "Ischium (Os. Ischium)",
                                "Acetabulum (Acetabulum)",
                                "Pelvic brim (libra innominata)",
                                "Ilium (Os. Illium)",
                                "Iliach Crest (Crista Illiaca)"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          Gap.h16,
                          getContentPelvis(),
                          Gap.h16,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: const FooterHomePage(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
