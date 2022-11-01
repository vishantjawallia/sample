// ignore_for_file: file_names
import '../config/Palettes.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String input;
  final String initialValue;
  final String hint;
  final bool readOnly;
  final bool autofocus;
  final TextStyle? style;
  final TextInputType keyboard;
  final TextEditingController? controller;
  final Widget? suffix;
  final EdgeInsetsGeometry? mainPadding;
  final void Function()? onTap;
  const CustomTextField({
    Key? key,
    this.input = "",
    this.keyboard = TextInputType.text,
    this.initialValue = "",
    @required this.controller,
    this.readOnly = false,
    this.autofocus = false,
    this.hint = "",
    this.suffix,
    this.mainPadding,
    this.onTap,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: mainPadding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Palettes.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        readOnly: readOnly,
        autofocus: autofocus,
        controller: controller,
        keyboardType: keyboard,
        onTap: onTap,
        style: style,
        decoration: InputDecoration(
          suffix: suffix ?? const SizedBox(),
          hintText: hint,
          hintStyle: const TextStyle(fontWeight: FontWeight.w500),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
