import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recru_design/app/router/page_name.dart';
import 'package:my_recru_design/presentation/auth/forgot_password_page.dart/new_password_page.dart';
import 'package:my_recru_design/presentation/auth/forgot_password_page.dart/number_page.dart'
    show NumberPage;
import 'package:my_recru_design/presentation/auth/forgot_password_page.dart/otp_page.dart';
import 'package:my_recru_design/presentation/auth/sign_up/email_page.dart';
import 'package:my_recru_design/presentation/widgets/button_custom.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final PageController _controller = PageController();
  PageController get controller => _controller;
  int currentPage = 0;
  bool isContinue = true;
  final List<Widget> pages = [NumberPage(), OtpPage(), NewPasswordPage()];
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
                child: ButtonCustom(
                  label: currentPage == pages.length - 1
                      ? 'Continuer'
                      : 'Suivant',
                  onPressed: () {
                    if (currentPage == pages.length - 1) {
                      context.go(PageName.contactHome);
                    } else {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
