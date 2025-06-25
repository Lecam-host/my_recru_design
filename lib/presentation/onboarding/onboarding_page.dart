import 'package:flutter/material.dart';
import 'package:my_recru_design/core/assets.dart';

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
      title: "Vendez facilement vos produits",
      description:
          "Trouvez des acheteurs et vendez vos récoltes sans tracas. C’est simple et rapide.",
      image: SvgIconConstants.onboarding1,
    ),
    OnboardingItem(
      title: "Trouvez les meilleurs prix",
      description:
          "Accédez à un réseau d’acheteurs pour obtenir le meilleur prix pour vos produits",
      image: SvgIconConstants.onboarding2,
    ),
    OnboardingItem(
      title: "Connectez-vous avec vos acheteurs",
      description:
          "Restez en contact avec des acheteurs sérieux et sécurisez vos ventes en quelques étapes.",
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
      // floatingActionButton: FloatingActionButton(
      //    onPressed: (){
      //     log(context.read<AuthBloc>().state.status.toString());
      //    },
      // ),
      // body: Stack(
      //   children: [
      //     PageView(
      //       controller: controller,
      //       children: pages,
      //     ),
      //     Align(
      //       alignment: Alignment.bottomCenter,
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //         child: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //             AnimatedSmoothIndicator(
      //                 count: pages.length,
      //                 activeIndex:
      //                     controller.hasClients ? controller.page!.toInt() : 0,
      //                 axisDirection: Axis.horizontal,
      //                 effect: WormEffect(
      //                   dotColor: Colors.grey,
      //                   activeDotColor: ConstantColors.primary,
      //                   dotHeight: 10,
      //                   dotWidth: 10,
      //                 ), // your preferred effect
      //                 onDotClicked: (index) {
      //                   controller.animateToPage(index,
      //                       duration: const Duration(milliseconds: 300),
      //                       curve: Curves.easeIn);
      //                 }),
      //             const SizedBox(height: 20),
      //             if (pages.length - 1 == currentPage)
      //               CheckboxListTile(
      //                   value: acceptTermsOfUse,
      //                   onChanged: (value) {
      //                     setState(() {
      //                       acceptTermsOfUse = value!;
      //                       isContinue = value;
      //                     });
      //                     context.read<AuthBloc>().add(
      //                         ChangeAcceptTermsOfUseEvent(
      //                             acceptTermsOfUse: acceptTermsOfUse));
      //                   },
      //                   controlAffinity: ListTileControlAffinity.leading,
      //                   title: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         "J'accepte les conditions d'utilisation",
      //                         style: TextStyle(
      //                           color: Colors.black,
      //                         ),
      //                       ),
      //                       GestureDetector(
      //                         onTap: () => context
      //                             .pushNamed(PageRoutes.inAppWebPage, extra: {
      //                           "title": "Conditions d'utilisation",
      //                           "url": ConstantUrl.confidentialityUrl
      //                         }),
      //                         child: Text(
      //                           "Conditions d'utilisation",
      //                           style: TextStyle(
      //                             color: ConstantColors.primary,
      //                             decoration: TextDecoration.underline,
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   )),
      //             const SizedBox(height: 20),
      //             ButtonCustom(
      //               label: currentPage == pages.length - 1
      //                   ? 'Commencer'
      //                   : 'Suivant',
      //               disabled: !isContinue,
      //               onPressed: () {
      //                 if (controller.page!.toInt() == pages.length - 1) {
      //                   context.read<AuthBloc>().add(
      //                       const ChangeAuthenticationStatusEvent(
      //                           status: AuthenticationStatus.unauthenticated));
      //                   context.go(PageRoutes.home);
      //                   return;
      //                 }
      //                 controller.nextPage(
      //                     duration: const Duration(milliseconds: 300),
      //                     curve: Curves.easeIn);
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
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
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage(ConstantImages.pattern),
            //         fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
