import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recru_design/app/router/page_name.dart';
import 'package:my_recru_design/core/assets.dart';
import 'package:my_recru_design/presentation/widgets/button_custom.dart';
import 'package:my_recru_design/presentation/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Connexion',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Veuillez entrez vos informations de connexion',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 20),
                TextFieldWidget(inputFontSize: 16, labelText: "Identifiant"),

                SizedBox(height: 20),
                TextFieldWidget(
                  inputFontSize: 16,
                  labelText: "Mot de passe",
                  obscureText: true,
                ),

                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: 'Mot de passe oublié ? ',
                    style: Theme.of(context).textTheme.bodySmall,
                    children: [
                      TextSpan(
                        text: 'Cliquer ici',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          decorationThickness: 1,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.push(PageName.forgotPasswordPage);
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                Text.rich(
                  TextSpan(
                    text: 'Pas encore de compte ? ',
                    style: Theme.of(context).textTheme.bodySmall,
                    children: [
                      TextSpan(
                        text: 'Inscrivez-vous ici',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          decorationThickness: 1,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.push(PageName.signUpPersonelInfoPage);
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
                // SizedBox(height: 10),
                ButtonItem(
                  icon: SvgIconConstants.facebook,
                  label: "S’inscrire avec",
                ),
                SizedBox(height: 20),
                ButtonCustom(
                  label: 'Connecter',
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
  }
}
