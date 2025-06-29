import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_recru_design/presentation/widgets/otp_field.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  Timer? _timer;
  int _countdown = 10;
  void _startTimer() {
    _countdown = 10;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_countdown > 0) {
            _countdown--;
          } else {
            _timer?.cancel();
          }
        });
      }
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

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

        OtpField(length: 4),
        SizedBox(height: 20),
        Text(
          '00 : ${_countdown.toString().padLeft(2, '0')} secondes',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
        ),

        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            text: 'Pas encore reçu ? ',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
            children: [
              TextSpan(
                text: 'Renvoyez',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  decorationColor: Theme.of(context).colorScheme.primary,
                  decorationThickness: 1,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
