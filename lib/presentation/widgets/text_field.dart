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
    this.labelStyle,
    this.withBorder = true,
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
  final TextStyle? labelStyle;
  final bool withBorder;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final FocusNode _focusNode = FocusNode();

  // Color for border
  Color _borderColor = Colors.grey;
  double borderWidth = 1;

  @override
  void initState() {
    super.initState();
    // Change color for border if focus was changed
    _focusNode.addListener(() {
      setState(() {
        _borderColor = _focusNode.hasFocus
            ? Theme.of(context).colorScheme.primary
            : Color(0xFFCED1D5);

        borderWidth = _focusNode.hasFocus ? 2 : 1;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: widget.height ?? 60,
      decoration: BoxDecoration(
        border: widget.withBorder
            ? Border.all(color: _borderColor, width: borderWidth)
            : null,

        color: widget.backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onTap: () {
          setState(() {
            _focusNode.requestFocus();
            widget.isError = false;
          });
        },
        style: TextStyle(fontSize: widget.inputFontSize),
        inputFormatters: widget.inputFormatters,
        focusNode: _focusNode,
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

          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          floatingLabelBehavior: FloatingLabelBehavior.auto,

          hintStyle: widget.hintStyle,
          labelStyle:
              widget.labelStyle ??
              TextStyle(
                fontSize: 12,
                color: Color(0xFF949CAE),
                fontWeight: FontWeight.w400,
              ),

          labelText: widget.labelText,
        ),
      ),
    );
  }
}
