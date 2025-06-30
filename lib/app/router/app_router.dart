import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recru_design/app/router/page_name.dart';
import 'package:my_recru_design/presentation/auth/forgot_password_page.dart/forgot_password_page.dart';
import 'package:my_recru_design/presentation/auth/login/login_page.dart';
import 'package:my_recru_design/presentation/auth/sign_up/personel_info_page.dart';
import 'package:my_recru_design/presentation/auth/sign_up/sign_up_page.dart';
import 'package:my_recru_design/presentation/contact/contact_details_page.dart';
import 'package:my_recru_design/presentation/contact/contact_home.dart';
import 'package:my_recru_design/presentation/contact/create_contact_page.dart';
import 'package:my_recru_design/presentation/favorite/favorite_home.dart';
import 'package:my_recru_design/presentation/home/home_page.dart';
import 'package:my_recru_design/presentation/home/qrcode_scann_page.dart';
import 'package:my_recru_design/presentation/onboarding/onboarding_page.dart';
import 'package:my_recru_design/presentation/recent/recent_home.dart';
import 'package:my_recru_design/presentation/splash_page.dart';
import 'package:my_recru_design/presentation/widgets/bottom_navigation_bar.dart';

class AppRouter extends GoRouter {
  AppRouter()
    : super.routingConfig(
        initialLocation: PageName.home,
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
                    navigatorKey: GlobalKey<NavigatorState>(
                      debugLabel: 'contact',
                    ),
                    routes: [
                      GoRoute(
                        path: PageName.contactHome,

                        //name: PageName.contactHome,
                        pageBuilder: (context, GoRouterState state) {
                          return getPage(
                            child: const ContactHome(),
                            state: state,
                          );
                        },
                        routes: [],
                      ),
                      GoRoute(
                        path: PageName.createContactPage,
                        name: PageName.createContactPage,
                        pageBuilder: (context, GoRouterState state) {
                          return getPage(
                            child: const CreateContactPage(),
                            state: state,
                          );
                        },
                        routes: [],
                      ),
                    ],
                  ),
                ],
              ),
              GoRoute(
                path: PageName.contactDetailsPage,
                name: PageName.contactDetailsPage,
                pageBuilder: (context, GoRouterState state) {
                  final contact = state.extra as Contact;
                  return getPage(
                    child: ContactDetailsPage(contact: contact),
                    state: state,
                  );
                },
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

              GoRoute(
                path: PageName.home,
                name: PageName.home,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(child: const HomePage(), state: state);
                },
              ),

              GoRoute(
                path: PageName.mobileScannerPage,
                name: PageName.mobileScannerPage,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const MobileScannerPage(),
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
