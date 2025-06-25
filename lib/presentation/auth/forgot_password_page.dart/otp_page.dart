import 'package:flutter/material.dart';
import 'package:my_recru_design/presentation/widgets/otp_field.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text('Code OTP', style: Theme.of(context).textTheme.titleMedium),
        Text(
          'Vous avez reçu un code de réactivation par sms',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: 20),

        Center(child: OtpField(length: 4)),
      ],
    );
  }
}
