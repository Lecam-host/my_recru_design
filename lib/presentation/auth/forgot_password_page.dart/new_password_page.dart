import 'package:flutter/material.dart';
import 'package:my_recru_design/presentation/widgets/text_field.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text('Mot de passe', style: Theme.of(context).textTheme.titleMedium),
        Text(
          'Veuillez créer un nouveau mot de passe',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: 20),
        TextFieldWidget(inputFontSize: 16, labelText: "Nouveau mot de passe"),
        SizedBox(height: 20),

        Center(
          child: TextFieldWidget(
            inputFontSize: 16,
            labelText: "Confirmez nouveau mot de passe",
          ),
        ),
      ],
    );
  }
}
