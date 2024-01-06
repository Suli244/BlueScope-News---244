import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
    this.hintText,
    this.suffix,
    this.maxLines,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 15),
    this.expands = false,
    this.isCollapsed = false,
    this.counter,
  });

  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final Widget? suffix;
  final Function(String value) onChanged;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final bool expands;
  final bool isCollapsed;
  final Widget? counter;

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(
          color: const Color(0xffD9E6F0),
          width: 1.h,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: expands,
      maxLines: maxLines,
      onChanged: onChanged,
      controller: controller,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        counterStyle: const TextStyle(color: Colors.white),
        suffix: suffix,
        isCollapsed: isCollapsed,
        counter: counter,
        enabledBorder: _border,
        contentPadding: contentPadding,
        focusedBorder: _border,
        focusedErrorBorder: _border,
        labelStyle: const TextStyle(
          color: Color(0xFF181A1B),
          fontSize: 15,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
        // errorBorder: _border,
        hintText: labelText,
      ),
    );
  }
}
