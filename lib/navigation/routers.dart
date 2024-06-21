import 'package:flutter/material.dart';
import 'package:odc_mobile_project/m_evaluation/ui/pages/infoPage/InfoPage.dart';
import 'package:odc_mobile_project/m_user/business/interactor/UserInteractor.dart';
import 'package:odc_mobile_project/m_user/ui/pages/TestPage.dart';
import 'package:odc_mobile_project/m_user/ui/pages/login/LoginPage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

import '../m_evaluation/ui/pages/AuthPage/AuthPage.dart';
import '../m_evaluation/ui/pages/IntroPage/IntroPage.dart';
import '../m_evaluation/ui/pages/ScanCouponPage/ScanCouponPage.dart';
import '../m_evaluation/ui/pages/intervenantPage/intervenantPage.dart';
import '../m_evaluation/ui/pages/phasePage/PhasePage.dart';

part "routers.g.dart";

enum Urls { home, detailArticle, auth, login, test, Intro, scanner, evaluationAuth, phases, intervenants,info }

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final userInteractor = ref.watch(userInteractorProvider);
  return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: "/home/phases",
      /* redirect: (context, state) async {
        return null;
      },*/
      routes: <RouteBase>[
        GoRoute(
          path: "/home",
          name: Urls.home.name,
          builder: (ctx, state) => LoginPage(),
          routes: <RouteBase>[
            GoRoute(
                path: 'test',
                name: Urls.test.name,
                builder: (ctx, state) => Testpage()),
            GoRoute(
              path: "details/:id",
              name: Urls.detailArticle.name,
              pageBuilder: (ctx, state) {
                final articleId = state.pathParameters["id"];
                return MaterialPage(key: state.pageKey, child: LoginPage());
              },
            ),
            GoRoute(
              path: "phases",
              name: Urls.phases.name,
              builder: (ctx, state) => PhasePage(),
            ),
            GoRoute(
              path: "intervenants",
              name: Urls.intervenants.name,
              builder: (ctx, state) => IntervenantPage(),
            ),
            GoRoute(path: "info",
                name: Urls.info.name,
                builder: (ctx, state) => InfoPage()),
          ],
        ),
        GoRoute(
            path: "/auth",
            name: Urls.auth.name,
            builder: (ctx, state) => IntroPage(),
            routes: <RouteBase>[

              GoRoute(
                  path: 'intro',
                  name: Urls.Intro.name,
                  builder: (ctx, state) => IntroPage()),
              GoRoute(
                path: "evaluation-auth",
                name: Urls.evaluationAuth.name,
                builder: (ctx, state) => AuthPage(),
              ),
              GoRoute(
                  path: 'scanner',
                  name: Urls.scanner.name,
                  builder: (ctx, state) => ScanCouponPage()),

            ]),
      ],
      errorBuilder: (ctx, state) => LoginPage());

}
