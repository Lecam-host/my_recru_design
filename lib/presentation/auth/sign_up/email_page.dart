import 'package:flutter/material.dart';
import 'package:my_recru_design/presentation/widgets/text_field.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 59, child: TextFieldWidget(labelText: "Email")),
      ],
    );
  }
}
