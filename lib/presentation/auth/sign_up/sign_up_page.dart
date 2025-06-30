import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recru_design/app/router/page_name.dart';
import 'package:my_recru_design/presentation/auth/sign_up/email_page.dart';
import 'package:my_recru_design/presentation/auth/sign_up/number_page.dart';
import 'package:my_recru_design/presentation/auth/sign_up/photo_page.dart';
import 'package:my_recru_design/presentation/widgets/button_custom.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final PageController _controller = PageController();
  PageController get controller => _controller;
  int currentPage = 0;
  bool isContinue = true;
  final List<Widget> pages = [EmailPage(), NumberPage(), PhotoPage()];
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.page!.toInt() == pages.length - 1) {}
      setState(() {
        currentPage = controller.page!.toInt();
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (currentPage == 0) {
              context.pop();
            } else {
              controller.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Inscription',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Veuillez entrez vos informations d’inscription',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 20),

              Expanded(
                child: PageView(controller: controller, children: pages),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    if (currentPage == pages.length - 1)
                      ButtonCustom(
                        backgroundColor: Colors.white,
                        textColor: Theme.of(context).colorScheme.primary,
                        withBoder: true,
                        label: 'Ignorer',
                        onPressed: () {
                          context.go(PageName.home);
                        },
                      ),
                    SizedBox(height: 10),
                    ButtonCustom(
                      label: currentPage == pages.length - 1
                          ? 'Continuer'
                          : 'Suivant',
                      onPressed: () {
                        if (currentPage == pages.length - 1) {
                          context.go(PageName.home);
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//