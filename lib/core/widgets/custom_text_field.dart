import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.onSaved,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      autocorrect: true,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(hintText: hintText),
      style: TextStyle(color: Colors.white),
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
    );
  }
}
