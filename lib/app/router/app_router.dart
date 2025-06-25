import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recru_design/app/router/page_name.dart';
import 'package:my_recru_design/presentation/auth/forgot_password_page.dart/forgot_password_page.dart';
import 'package:my_recru_design/presentation/auth/login/login_page.dart';
import 'package:my_recru_design/presentation/auth/sign_up/personel_info_page.dart';
import 'package:my_recru_design/presentation/auth/sign_up/sign_up_page.dart';
import 'package:my_recru_design/presentation/contact/contact_home.dart';
import 'package:my_recru_design/presentation/favorite/favorite_home.dart';
import 'package:my_recru_design/presentation/onboarding/onboarding_page.dart';
import 'package:my_recru_design/presentation/recent/recent_home.dart';
import 'package:my_recru_design/presentation/splash_page.dart';
import 'package:my_recru_design/presentation/widgets/bottom_navigation_bar.dart';

class AppRouter extends GoRouter {
  AppRouter()
    : super.routingConfig(
        initialLocation: PageName.signUpPersonelInfoPage,
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
              GoRoute(
                path: PageName.onboardingPage,
                name: PageName.onboardingPage,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(child: const OnboardingPage(), state: state);
                },
              ),
              GoRoute(
                path: PageName.signUpPersonelInfoPage,
                name: PageName.signUpPersonelInfoPage,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const SignUpPersonelInfoPage(),
                    state: state,
                  );
                },
              ),

              GoRoute(
                path: PageName.signUpPage,
                name: PageName.signUpPage,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(child: const SignUpPage(), state: state);
                },
              ),
              GoRoute(
                path: PageName.loginPage,
                name: PageName.loginPage,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(child: const LoginPage(), state: state);
                },
              ),
              GoRoute(
                path: PageName.forgotPasswordPage,
                name: PageName.forgotPasswordPage,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const ForgotPasswordPage(),
                    state: state,
                  );
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
