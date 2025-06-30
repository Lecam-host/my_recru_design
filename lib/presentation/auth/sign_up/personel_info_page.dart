import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recru_design/app/router/page_name.dart';
import 'package:my_recru_design/core/assets.dart';
import 'package:my_recru_design/presentation/widgets/button_custom.dart';
import 'package:my_recru_design/presentation/widgets/text_field.dart';

class SignUpPersonelInfoPage extends StatefulWidget {
  const SignUpPersonelInfoPage({super.key});

  @override
  State<SignUpPersonelInfoPage> createState() => _SignUpPersonelInfoPageState();
}

class _SignUpPersonelInfoPageState extends State<SignUpPersonelInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 100,
      //   leadingWidth: 100,
      //   leading:
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppImagesConstants.logo, width: 100),

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
                TextFieldWidget(labelText: "Nom"),

                SizedBox(height: 20),
                TextFieldWidget(labelText: "Prénoms"),

                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: 'Déjà un compte? ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: 'Connectez-vous ici',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          decorationColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          decorationThickness: 1,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.push(PageName.loginPage);
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ButtonItem(
                  icon: SvgIconConstants.google,
                  label: "S’inscrire avec",
                ),

                ButtonItem(
                  icon: SvgIconConstants.facebook,
                  label: "S’inscrire avec",
                ),
                SizedBox(height: 20),
                ButtonCustom(
                  label: 'Suivant',
                  onPressed: () {
                    context.push(PageName.signUpPage);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    super.key,
    required this.icon,
    this.label = "S’inscrire avec",
  });
  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,

      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(width: 10),
          SvgPicture.asset(icon, height: 25),
        ],
      ),
    );
    // SizedBox(
    //   height: 50,
    //   child: ElevatedButton.icon(
    //     onPressed: () {
    //       // Action du bouton
    //     },
    //     icon: SvgPicture.asset(icon, height: 25),
    //     label: Text(
    //       label,
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontSize: 16,
    //         fontWeight: FontWeight.w500,
    //       ),
    //     ),
    //     style: ElevatedButton.styleFrom(
    //       backgroundColor: Theme.of(
    //         context,
    //       ).colorScheme.primary, // Couleur bordeaux foncée
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(30),
    //       ),
    //       padding: const EdgeInsets.symmetric(horizontal: 24),
    //     ),
    //   ),
    // );
  }
}
