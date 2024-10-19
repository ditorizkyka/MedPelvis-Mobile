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

class AnatomiKaki extends StatefulWidget {
  const AnatomiKaki({super.key});

  @override
  State<AnatomiKaki> createState() => _AnatomiKakiState();
}

class _AnatomiKakiState extends State<AnatomiKaki> {
  final videoURL = "https://youtu.be/ROd1Acma64o?feature=shared";
  late YoutubePlayerController _youtubePlayerController;
  bool _isFullScreen = false;

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
  Widget getContentKaki() {
    switch (_selectedItem) {
      case 'Distal Phalanx':
        return DetailInformationSection(
          imgList: dataContent['kaki']!['distalPhalanx']['imgList'],
          title: dataContent['kaki']!['distalPhalanx']['title'],
          explanation: dataContent['kaki']!['distalPhalanx']['explanation'],
          function: dataContent['kaki']!['distalPhalanx']['function'],
        );
      case 'Middle Phalanx':
        return DetailInformationSection(
          imgList: dataContent['kaki']!['middlePhalanx']['imgList'],
          title: dataContent['kaki']!['middlePhalanx']['title'],
          explanation: dataContent['kaki']!['middlePhalanx']['explanation'],
          function: dataContent['kaki']!['middlePhalanx']['function'],
        );
      case 'Proximal Phalanx':
        return DetailInformationSection(
          imgList: dataContent['kaki']!['proximalPhalanx']['imgList'],
          title: dataContent['kaki']!['proximalPhalanx']['title'],
          explanation: dataContent['kaki']!['proximalPhalanx']['explanation'],
          function: dataContent['kaki']!['proximalPhalanx']['function'],
        );
      case 'Metatarsals':
        return DetailInformationSection(
          imgList: dataContent['kaki']!['metatarsals']['imgList'],
          title: dataContent['kaki']!['metatarsals']['title'],
          explanation: dataContent['kaki']!['metatarsals']['explanation'],
          function: dataContent['kaki']!['metatarsals']['function'],
        );
      case 'Talus':
        return DetailInformationSection(
          imgList: dataContent['kaki']!['talus']['imgList'],
          title: dataContent['kaki']!['talus']['title'],
          explanation: dataContent['kaki']!['talus']['explanation'],
          function: dataContent['kaki']!['talus']['function'],
        );
      case 'Calcaneus':
        return DetailInformationSection(
          imgList: dataContent['kaki']!['calcaneus']['imgList'],
          title: dataContent['kaki']!['calcaneus']['title'],
          explanation: dataContent['kaki']!['calcaneus']['explanation'],
          function: dataContent['kaki']!['calcaneus']['function'],
        );
      case 'Cuboid':
        return DetailInformationSection(
          imgList: dataContent['kaki']!['cuboid']['imgList'],
          title: dataContent['kaki']!['cuboid']['title'],
          explanation: dataContent['kaki']!['cuboid']['explanation'],
          function: dataContent['kaki']!['cuboid']['function'],
        );
      case 'Lateral Cuneiform':
        return DetailInformationSection(
          imgList: dataContent['kaki']!['lateralCuneiform']['imgList'],
          title: dataContent['kaki']!['lateralCuneiform']['title'],
          explanation: dataContent['kaki']!['lateralCuneiform']['explanation'],
          function: dataContent['kaki']!['lateralCuneiform']['function'],
        );
      case 'Medial Cuneiform':
        return DetailInformationSection(
          imgList: dataContent['kaki']!['medialCuneiform']['imgList'],
          title: dataContent['kaki']!['medialCuneiform']['title'],
          explanation: dataContent['kaki']!['medialCuneiform']['explanation'],
          function: dataContent['kaki']!['medialCuneiform']['function'],
        );
      case 'Intermediate Cuneiform':
        return DetailInformationSection(
          imgList: dataContent['kaki']!['intermediateCuneiform']['imgList'],
          title: dataContent['kaki']!['intermediateCuneiform']['title'],
          explanation: dataContent['kaki']!['intermediateCuneiform']
              ['explanation'],
          function: dataContent['kaki']!['intermediateCuneiform']['function'],
        );
      case 'Navicular':
        return DetailInformationSection(
          imgList: dataContent['kaki']!['navicular']['imgList'],
          title: dataContent['kaki']!['navicular']['title'],
          explanation: dataContent['kaki']!['navicular']['explanation'],
          function: dataContent['kaki']!['navicular']['function'],
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
                "Anatomi Kaki",
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
                                  title: "Anatomi Kaki",
                                ),
                                Gap.h16,
                                const DescriptionSection(
                                    desc:
                                        "Anatomi tulang kaki terdiri dari 26 tulang yang dibagi menjadi tiga bagian utama: tarsus, metatarsus, dan phalanges. Tarsus mencakup tujuh tulang di bagian belakang kaki, termasuk talus yang menghubungkan kaki dengan pergelangan, dan kalkaneus, atau tulang tumit.\n\nMetatarsus terdiri dari lima tulang panjang yang membentuk bagian tengah kaki, menghubungkan tarsus dengan tulang jari-jari. Phalanges adalah tulang jari-jari kaki yang berjumlah 14; setiap jari memiliki tiga falang kecuali jempol kaki, yang hanya memiliki dua. Tulang-tulang ini bekerja sama untuk mendukung berat tubuh, memungkinkan pergerakan, serta menjaga keseimbangan."),
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
                                'Distal Phalanx',
                                'Middle Phalanx',
                                'Proximal Phalanx',
                                'Metatarsals',
                                'Talus',
                                'Calcaneus',
                                'Cuboid',
                                'Lateral Cuneiform',
                                'Medial Cuneiform',
                                'Intermediate Cuneiform',
                                'Navicular'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          Gap.h16,
                          getContentKaki(),
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
