import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recru_design/app/router/page_name.dart';
import 'package:my_recru_design/presentation/contact/contact_home.dart';
import 'package:my_recru_design/presentation/favorite/favorite_home.dart';
import 'package:my_recru_design/presentation/recent/recent_home.dart';
import 'package:my_recru_design/presentation/splash_page.dart';
import 'package:my_recru_design/presentation/widgets/bottom_navigation_bar.dart';

class AppRouter extends GoRouter {
  AppRouter()
    : super.routingConfig(
        initialLocation: PageName.splash,
        observers: <NavigatorObserver>[],
        routingConfig: ValueNotifier<RoutingConfig>(
          RoutingConfig(
            routes: [
              StatefulShellRoute.indexedStack(
                pageBuilder: (context, state, child) {
                  return getPage(
                    child: BottomNavigationPage(child: child),
                    state: state,
                  );
                },
                branches: [
                  StatefulShellBranch(
                    //  navigatorKey: PageKey.marketNavigatorKey,
                    routes: [
                      GoRoute(
                        path: PageName.favoriteHome,
                        pageBuilder: (context, GoRouterState state) {
                          return getPage(
                            child: const FavoriteHome(),
                            state: state,
                          );
                        },
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    //  navigatorKey: PageKey.marketNavigatorKey,
                    routes: [
                      GoRoute(
                        path: PageName.recentHome,
                        pageBuilder: (context, GoRouterState state) {
                          return getPage(
                            child: const RecentHome(),
                            state: state,
                          );
                        },
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    //  navigatorKey: PageKey.marketNavigatorKey,
                    routes: [
                      GoRoute(
                        path: PageName.contactHome,
                        pageBuilder: (context, GoRouterState state) {
                          return getPage(
                            child: const ContactHome(),
                            state: state,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              GoRoute(
                path: PageName.splash,
                name: PageName.splash,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(child: const SplashPage(), state: state);
                },
              ),
            ],
          ),
        ),
      );
}

Page getPage({required Widget child, required GoRouterState state}) {
  return MaterialPage(key: state.pageKey, child: child);
}
