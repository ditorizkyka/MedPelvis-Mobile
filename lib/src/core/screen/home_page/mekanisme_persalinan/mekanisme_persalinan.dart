import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medpelvis_mobile/src/constant/themes/size.dart';
import 'package:medpelvis_mobile/src/core/data/dataContent.dart';
import 'package:medpelvis_mobile/src/core/screen/home_page/widget/footer_homepage.dart';
import 'package:medpelvis_mobile/src/widgets/description.dart';
import 'package:medpelvis_mobile/src/widgets/title_section.dart';
import 'package:medpelvis_mobile/src/widgets/youtube_section.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class MekanismePersalinan extends StatefulWidget {
  MekanismePersalinan({super.key, required this.listPart});

  final List listPart;

  @override
  State<MekanismePersalinan> createState() => _MekanismePersalinanState();
}

class _MekanismePersalinanState extends State<MekanismePersalinan> {
  int _current = 0;

  final CarouselSliderController _controller = CarouselSliderController();

  final videoURL = "https://youtu.be/8T-7lNLKotQ";
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

  List getData() {
    return dataContent['mekanisme_persalinan']!['listPart'];
  }

  // Content based on dropdown selection

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
                      Colors.green,
                      Color.fromARGB(255, 78, 207, 82),
                    ],
                  ),
                ),
              ),
              centerTitle: true,
              title: Text(
                "Mekanisme Persalinan",
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
                                  title: "Mekanisme Persalinan",
                                ),
                                Gap.h16,
                                DescriptionSection(
                                    desc: dataContent['mekanisme_persalinan']![
                                        'explanation']),
                              ],
                            ),
                          ),
                          Gap.h16,
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            alignment: Alignment.topRight,
                            child: Stack(
                              children: [
                                CarouselSlider(
                                  carouselController: _controller,
                                  items: widget.listPart.map((item) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 500,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 10,
                                                      offset:
                                                          const Offset(0, 3),
                                                    ),
                                                  ],
                                                ),
                                                padding:
                                                    const EdgeInsets.all(20),
                                                width: widthScreen,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: InteractiveViewer(
                                                        maxScale: 5.0,
                                                        child: Image.asset(
                                                          item[0],
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.8, // Adjust the width for the image
                                                          fit: BoxFit
                                                              .cover, // Ensure the image fits well
                                                        ),
                                                      ),
                                                    ),
                                                    Gap.h20,
                                                    Text(
                                                      'Tahap ${_current + 1}',
                                                      style: GoogleFonts.roboto(
                                                        fontSize: ScreenUtil()
                                                            .setSp(16),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Gap.h4,
                                                    // Space between image and text
                                                    Text(
                                                      item[1], // Title
                                                      style: GoogleFonts.roboto(
                                                        fontSize: ScreenUtil()
                                                            .setSp(16),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
                                                      ),
                                                      textAlign: TextAlign
                                                          .start, // Center the text
                                                    ),
                                                    Gap.h4,
                                                    Text(
                                                      '(Swipe Untuk melihat Tahapan lainnya)',
                                                      style: GoogleFonts.roboto(
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontSize: ScreenUtil()
                                                            .setSp(12),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Gap.h16,
                                                    Text(
                                                      item[
                                                          2], // Process description
                                                      style: GoogleFonts.roboto(
                                                        fontSize: ScreenUtil()
                                                            .setSp(14),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black,
                                                      ),

                                                      textAlign: TextAlign
                                                          .justify, // Center the text
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                  options: CarouselOptions(
                                    height: 900,
                                    viewportFraction: 1.0,
                                    autoPlay: false,
                                    // aspectRatio: 2,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _current = index;
                                      });
                                    },
                                  ),
                                ),
                                // Container(
                                //   // color: Colors.red,
                                //   margin: EdgeInsets.fromLTRB(
                                //       0, SizeApp.customHeight(190), 0, 0),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: widget.listPart
                                //         .asMap()
                                //         .entries
                                //         .map((entry) {
                                //       return GestureDetector(
                                //         onTap: () => _controller
                                //             .animateToPage(entry.key),
                                //         child: Container(
                                //           width: 20.0,
                                //           height: 4.0,
                                //           margin: const EdgeInsets.symmetric(
                                //               vertical: 8.0, horizontal: 4.0),
                                //           decoration: BoxDecoration(
                                //             borderRadius:
                                //                 BorderRadius.circular(20),
                                //             shape: BoxShape.rectangle,
                                //             color:
                                //                 (Theme.of(context).brightness ==
                                //                             Brightness.dark
                                //                         ? Colors.white
                                //                         : Colors.green)
                                //                     .withOpacity(
                                //                         _current == entry.key
                                //                             ? 0.9
                                //                             : 0.4),
                                //           ),
                                //         ),
                                //       );
                                //     }).toList(),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: const FooterHomePage(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
