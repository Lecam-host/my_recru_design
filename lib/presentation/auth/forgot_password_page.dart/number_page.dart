import 'package:flutter/material.dart';
import 'package:my_recru_design/presentation/widgets/text_field.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'Réinitialiser votre mot de passe',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Veuillez entrez votre numéro de téléphone pour réinitialiser votre mot de passe',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: 20),
        Center(
          child: TextFieldWidget(
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.only(left: 5),
            //   child: Row(
            //     children: [
            //       SvgPicture.asset(SvgIconConstants.ciFlag, height: 20),
            //       const SizedBox(width: 5),
            //       Text("+225"),
            //     ],
            //   ),
            // ),
            //inputFontSize: 16,
            labelText: "Numero de telephone",
            keyboardType: TextInputType.numberWithOptions(
              decimal: false,
              signed: false,
            ),
          ),
        ),
      ],
    );
  }
}
