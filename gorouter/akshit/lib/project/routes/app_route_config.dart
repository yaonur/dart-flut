import 'package:akshit/pages/about.dart';
import 'package:akshit/pages/contact_us.dart';
import 'package:akshit/pages/erro_page.dart';
import 'package:akshit/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './app_route_consts.dart';

import '../../pages/home.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: MyAppConstants.homeRouteName,
      path: '/',
      pageBuilder: (context, state) {
        return const MaterialPage(child: Home());
      },
    ),
    GoRoute(
      name: MyAppConstants.aboutRouteName,
      path: '/about',
      pageBuilder: (context, state) {
        return const MaterialPage(child: About());
      },
    ),
    GoRoute(
      name: MyAppConstants.contactRouteName,
      path: '/contact',
      pageBuilder: (context, state) {
        return const MaterialPage(child: Contact());
      },
    ),
    GoRoute(
      name: MyAppConstants.profileRouteName,
      path: '/profile',
      pageBuilder: (context, state) {
        return const MaterialPage(child: Profile());
      },
    ),
  ],
  errorPageBuilder: (context, state) => const MaterialPage(child: ErrorPage()),
);
