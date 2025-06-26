import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recru_design/app/router/page_name.dart';
import 'package:my_recru_design/core/assets.dart';
import 'package:my_recru_design/presentation/widgets/button_custom.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  PageController get controller => _controller;
  bool acceptTermsOfUse = false;
  int currentPage = 0;
  bool isContinue = true;
  final List<Widget> pages = [
    OnboardingItem(
      title: "Le pouvoir de votre réseau, simplifié et centralisé.",
      description:
          "My Recrue vous permet de centraliser tous vos contacts en un seul endroit, pour un accès rapide et une gestion simplifiée.",
      image: SvgIconConstants.onboarding1,
    ),
    OnboardingItem(
      title: "Le pouvoir de votre réseau, simplifié et centralisé.",
      description:
          "Avec my Recrue, vous pouvez ajouter des notes, des tags et des rappels pour chaque contact, pour ne jamais oublier un détail important.",
      image: SvgIconConstants.onboarding2,
    ),
    OnboardingItem(
      title: "Le pouvoir de votre réseau, simplifié et centralisé.",
      description:
          "L'application vous aide à rester organisé en synchronisant vos contacts sur tous vos appareils, où que vous soyez.",
      image: SvgIconConstants.onboarding3,
    ),
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.page!.toInt() == pages.length - 1) {}
      setState(() {
        currentPage = controller.page!.toInt();
        isContinue =
            controller.page!.toInt() == pages.length - 1 && !acceptTermsOfUse
            ? false
            : true;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(controller: controller, children: pages),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonCustom(
                      label: currentPage == pages.length - 1
                          ? 'Commencer'
                          : 'Suivant',
                      onPressed: () {
                        if (currentPage == pages.length - 1) {
                          context.go(PageName.loginPage);
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    AnimatedSmoothIndicator(
                      count: pages.length,
                      activeIndex: controller.hasClients
                          ? controller.page!.toInt()
                          : 0,
                      axisDirection: Axis.horizontal,
                      effect: WormEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Theme.of(context).colorScheme.primary,
                        dotHeight: 5,
                        dotWidth: 20,
                      ),
                      onDotClicked: (index) {
                        controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const OnboardingItem({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(height: 50),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontSize: 25),
          ),
          SizedBox(height: 15),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Center(child: SvgPicture.asset(image)),

          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [SizedBox(height: 30), const Spacer()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
