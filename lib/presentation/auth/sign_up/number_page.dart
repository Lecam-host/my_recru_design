import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_recru_design/presentation/widgets/text_field.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  final String prefix = "🇨🇮 +225 ";
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.text = prefix;
    super.initState();
  }

  bool isError = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: TextFieldWidget(
            controller: controller,
            //inputFontSize: 16,
            inputFormatters: [PrefixFormatter(prefix)],
            labelText: "Numero de telephone",
            suffixIcon: isError
                ? Icon(Icons.check_circle, color: Colors.red)
                : null,
            onChanged: (p0) {
              if (p0.length > 10 + prefix.length) {
                setState(() {
                  isError = true;
                });
              } else {
                setState(() {
                  isError = false;
                });
              }
            },
            validator: (p0) {
              if (p0 == null && p0!.length > 10 + prefix.length) {
                setState(() {
                  isError = true;
                });

                return;
              }
              setState(() {
                isError = isError;
              });
              return null;
            },
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

class PrefixFormatter extends TextInputFormatter {
  final String prefix;

  PrefixFormatter(this.prefix);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Empêche la suppression du préfixe
    if (!newValue.text.startsWith(prefix)) {
      return oldValue;
    }
    return newValue;
  }
}
