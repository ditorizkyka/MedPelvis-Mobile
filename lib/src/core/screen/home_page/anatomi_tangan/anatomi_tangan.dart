import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medpelvis_mobile/src/constant/themes/size.dart';
import 'package:medpelvis_mobile/src/core/data/dataContent.dart';
import 'package:medpelvis_mobile/src/core/screen/home_page/widget/footer_homepage.dart';
import 'package:medpelvis_mobile/src/widgets/description.dart';
import 'package:medpelvis_mobile/src/widgets/detail_information_section.dart';
import 'package:medpelvis_mobile/src/widgets/title_section.dart';
import 'package:medpelvis_mobile/src/widgets/youtube_section.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AnatomiTangan extends StatefulWidget {
  const AnatomiTangan({super.key});

  @override
  State<AnatomiTangan> createState() => _AnatomiTanganState();
}

class _AnatomiTanganState extends State<AnatomiTangan> {
  final videoURL = "https://www.youtube.com/watch?v=zyl6eoU-3Rg&authuser=0";
  late YoutubePlayerController _youtubePlayerController;
  bool _isFullScreen = false; // Untuk melacak mode fullscreen

  @override
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

  String _selectedItem = 'Distal Phalanx';

  // Content based on dropdown selection
  Widget getContentTangan() {
    switch (_selectedItem) {
      case 'Distal Phalanx':
        return DetailInformationSection(
          imgList: dataContent['tangan']!['distalPhalanx']['imgList'],
          title: dataContent['tangan']!['distalPhalanx']['title'],
          explanation: dataContent['tangan']!['distalPhalanx']['explanation'],
          function: dataContent['tangan']!['distalPhalanx']['function'],
        );
      case 'Middle Phalanx':
        return DetailInformationSection(
          imgList: dataContent['tangan']!['middlePhalanx']['imgList'],
          title: dataContent['tangan']!['middlePhalanx']['title'],
          explanation: dataContent['tangan']!['middlePhalanx']['explanation'],
          function: dataContent['tangan']!['middlePhalanx']['function'],
        );
      case 'Proximal Phalanx':
        return DetailInformationSection(
          imgList: dataContent['tangan']!['proximalPhalanx']['imgList'],
          title: dataContent['tangan']!['proximalPhalanx']['title'],
          explanation: dataContent['tangan']!['proximalPhalanx']['explanation'],
          function: dataContent['tangan']!['proximalPhalanx']['function'],
        );
      case 'Metacarpal Bone':
        return DetailInformationSection(
          imgList: dataContent['tangan']!['metacarpalBone']['imgList'],
          title: dataContent['tangan']!['metacarpalBone']['title'],
          explanation: dataContent['tangan']!['metacarpalBone']['explanation'],
          function: dataContent['tangan']!['metacarpalBone']['function'],
        );
      case 'Trapezium':
        return DetailInformationSection(
          imgList: dataContent['tangan']!['trapezium']['imgList'],
          title: dataContent['tangan']!['trapezium']['title'],
          explanation: dataContent['tangan']!['trapezium']['explanation'],
          function: dataContent['tangan']!['trapezium']['function'],
        );
      case 'Trapezoid':
        return DetailInformationSection(
          imgList: dataContent['tangan']!['trapezoid']['imgList'],
          title: dataContent['tangan']!['trapezoid']['title'],
          explanation: dataContent['tangan']!['trapezoid']['explanation'],
          function: dataContent['tangan']!['trapezoid']['function'],
        );
      case 'Capitate':
        return DetailInformationSection(
          imgList: dataContent['tangan']!['capitate']['imgList'],
          title: dataContent['tangan']!['capitate']['title'],
          explanation: dataContent['tangan']!['capitate']['explanation'],
          function: dataContent['tangan']!['capitate']['function'],
        );
      case 'Hamate':
        return DetailInformationSection(
          imgList: dataContent['tangan']!['hamate']['imgList'],
          title: dataContent['tangan']!['hamate']['title'],
          explanation: dataContent['tangan']!['hamate']['explanation'],
          function: dataContent['tangan']!['hamate']['function'],
        );
      case 'Scaphoid':
        return DetailInformationSection(
          imgList: dataContent['tangan']!['scaphoid']['imgList'],
          title: dataContent['tangan']!['scaphoid']['title'],
          explanation: dataContent['tangan']!['scaphoid']['explanation'],
          function: dataContent['tangan']!['scaphoid']['function'],
        );
      case 'Lunate':
        return DetailInformationSection(
          imgList: dataContent['tangan']!['lunate']['imgList'],
          title: dataContent['tangan']!['lunate']['title'],
          explanation: dataContent['tangan']!['lunate']['explanation'],
          function: dataContent['tangan']!['lunate']['function'],
        );
      case 'Pisiform':
        return DetailInformationSection(
          imgList: dataContent['tangan']!['pisiform']['imgList'],
          title: dataContent['tangan']!['pisiform']['title'],
          explanation: dataContent['tangan']!['pisiform']['explanation'],
          function: dataContent['tangan']!['pisiform']['function'],
        );
      case 'Triquetrum':
        return DetailInformationSection(
          imgList: dataContent['tangan']!['triquetrum']['imgList'],
          title: dataContent['tangan']!['triquetrum']['title'],
          explanation: dataContent['tangan']!['triquetrum']['explanation'],
          function: dataContent['tangan']!['triquetrum']['function'],
        );
      default:
        return const Text("not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    // print(selectedValue);
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
                      Colors.green,
                      Color.fromARGB(255, 78, 207, 82),
                    ],
                  ),
                ),
              ),
              centerTitle: true,
              title: Text(
                "Anatomi Tangan",
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
                                  title: "Anatomi Tangan",
                                ),
                                Gap.h16,
                                const DescriptionSection(
                                    desc:
                                        "Tangan dan pergelangan tangan Anda adalah bagian tubuh yang kompleks yang memungkinkan Anda menyentuh dan mengendalikan objek.\n\nAnatomi tangan manusia terdiri dari 27 tulang yang terbagi menjadi tiga kelompok utama: tulang karpal (di pergelangan tangan), metakarpal (di telapak tangan), dan falang (tulang jari). Tulang karpal, berjumlah delapan, membentuk pergelangan tangan dan memberikan fleksibilitas. Metakarpal adalah lima tulang yang menghubungkan telapak dengan jari, sementara falang membentuk jari-jari, dengan tiga tulang pada setiap jari kecuali ibu jari, yang hanya memiliki dua."),
                              ],
                            ),
                          ),
                          Gap.h16,
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
                                "Distal Phalanx",
                                "Middle Phalanx",
                                "Proximal Phalanx",
                                "Metacarpal Bone",
                                "Trapezium",
                                "Trapezoid",
                                "Capitate",
                                "Hamate",
                                "Scaphoid",
                                "Lunate",
                                "Pisiform",
                                "Triquetrum"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          Gap.h16,
                          getContentTangan(),
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
