import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpField extends StatefulWidget {
  const OtpField({
    super.key,
    this.controller,
    this.onCompleted,
    this.validator,
    this.length = 6,
  });
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  final String? Function(String?)? validator;
  final int length;
  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  defaultPinTheme() => PinTheme(
    width: 50,
    height: 70,
    textStyle: TextStyle(fontSize: 22, color: Colors.black),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(style: BorderStyle.solid, color: Colors.grey),
    ),
  );
  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        obscuringWidget: Text(
          '•',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        length: widget.length,
        controller: widget.controller,
        focusNode: focusNode,

        defaultPinTheme: defaultPinTheme(),
        separatorBuilder: (index) => const SizedBox(width: 8),
        validator: widget.validator,

        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onCompleted: widget.onCompleted,
        onChanged: (value) {
          debugPrint('onChanged: $value');
        },
        cursor: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 9),
              width: 22,
              height: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
        focusedPinTheme: defaultPinTheme().copyWith(
          decoration: defaultPinTheme().decoration!.copyWith(
            color: Colors.white,
            border: Border.all(
              style: BorderStyle.solid,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        submittedPinTheme: defaultPinTheme().copyWith(
          decoration: defaultPinTheme().decoration!.copyWith(
            color: Colors.white,
            border: Border.all(
              style: BorderStyle.solid,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        errorPinTheme: defaultPinTheme().copyBorderWith(
          border: Border.all(color: Colors.redAccent),
        ),
      ),
    );
  }
}
