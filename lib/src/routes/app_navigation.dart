import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medpelvis_mobile/src/core/data/dataContent.dart';
import 'package:medpelvis_mobile/src/core/screen/home_page/anatomi_kaki/anatomi_kaki.dart';
import 'package:medpelvis_mobile/src/core/screen/home_page/anatomi_panggul/anatomi_panggul.dart';
import 'package:medpelvis_mobile/src/core/screen/home_page/anatomi_tangan/anatomi_tangan.dart';
import 'package:medpelvis_mobile/src/core/screen/home_page/home_page.dart';
import 'package:medpelvis_mobile/src/core/screen/home_page/mekanisme_persalinan/mekanisme_persalinan.dart';
import 'package:medpelvis_mobile/src/core/screen/splash_screen/splash_screen.dart';

class AppNavigation {
  AppNavigation._();

  static String initR = '/splashscreen';
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: initR,
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: '/splashscreen',
        name: 'splashscreen',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
          path: '/homepage',
          name: 'homepage',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: 'anatomipanggul',
              name: 'anatomi_panggul',
              builder: (context, state) => const AnatomiPanggul(),
            ),
            GoRoute(
              path: 'anatomitangan',
              name: 'anatomi_tangan',
              builder: (context, state) => const AnatomiTangan(),
            ),
            GoRoute(
              path: 'anatomikaki',
              name: 'anatomi_kaki',
              builder: (context, state) => const AnatomiKaki(),
            ),
            GoRoute(
              path: 'prosesbersalin',
              name: 'proses_bersalin',
              builder: (context, state) => MekanismePersalinan(
                listPart: listPart,
              ),
            ),
          ])
    ],
  );
}
