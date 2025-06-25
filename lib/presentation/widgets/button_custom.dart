import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String label;
  final bool? isLoading;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Function() onPressed;
  final bool? withBoder;

  const ButtonCustom({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.textColor,
    this.backgroundColor,
    this.withBoder,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            side: withBoder != null && withBoder!
                ? BorderSide(color: Theme.of(context).colorScheme.primary)
                : BorderSide.none,

            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.primary,
        ),
        child: isLoading != null && isLoading!
            ? const CircularProgressIndicator(color: Colors.white)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (icon != null)
                    Row(children: [icon!, const SizedBox(width: 10)]),
                  Text(
                    label,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: textColor ?? Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
