// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({
    super.key,
    this.labelText,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.focusNode,
    this.isError = false,
    this.obscureText,
    this.suffixIcon,
    this.enableSuggestions,
    this.autocorrect,
    this.inputFormatters,
    this.validator,
    this.prefix,
    this.prefixIcon,
    this.height,
    this.backgroundColor,
    this.hintText,
    this.maxLines = 1,
    this.expands,
    this.inputFontSize,
    this.hintStyle,
    this.isOptionel = false,
  });
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  bool isError;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? prefixIcon;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final double? height;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Color? backgroundColor;
  final String? hintText;
  final int? maxLines;
  final bool? expands;
  final bool isOptionel;
  final double? inputFontSize;
  final TextStyle? hintStyle;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    focusNode.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 55,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onTap: () {
          setState(() {
            focusNode.requestFocus();
            widget.isError = false;
          });
        },
        style: TextStyle(fontSize: widget.inputFontSize),
        inputFormatters: widget.inputFormatters,
        focusNode: focusNode,
        expands: widget.expands ?? false,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        controller: widget.controller,
        showCursor: true,
        obscureText: widget.obscureText ?? false,
        enableSuggestions: false,
        autocorrect: false,
        validator: widget.validator,
        maxLines: widget.maxLines,

        decoration: InputDecoration(
          hintText: widget.hintText,
          fillColor: Theme.of(context).colorScheme.primary,
          focusColor: Theme.of(context).colorScheme.primary,
          suffixIcon: widget.suffixIcon,

          prefixIcon: widget.prefixIcon,
          prefix: widget.prefix,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: !focusNode.hasFocus
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.primary,
              width: 1.0,
            ),
          ),

          // floatingLabelStyle: TextStyle(
          //   color: Theme.of(context).colorScheme.primary,
          //   fontWeight: FontWeight.bold,
          //   fontSize: 18,
          // ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20, // plus d’espace pour le label flottant
            horizontal: 12,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 0.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintStyle: widget.hintStyle ?? TextStyle(),
          labelStyle: TextStyle(
            //height: 0.5,
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),

          labelText: widget.labelText,
        ),
      ),
    );
  }
}
