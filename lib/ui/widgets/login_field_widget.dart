import 'package:flutter/material.dart';

import 'login_text_field.dart';

class LoginFieldWidget extends StatelessWidget {
  LoginFieldWidget(
      {this.hint,
      this.inputAction,
      this.inputType,
      this.error,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.textAlign,
      this.onChanged,
      this.controller,
      this.focusNode,
      this.onFieldSubmitted,
      this.type = "field"});

  final String hint;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final String error;
  final bool obscureText;
  final Widget prefixIcon, suffixIcon;
  final String type;
  final TextAlign textAlign;
  final Function(String) onChanged;
  final FocusNode focusNode;
  final Function onFieldSubmitted;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return LoginTextField(
      controller: controller,
      hint: hint,
      focusNode: focusNode,
      onChanged: onChanged,
      inputAction: inputAction,
      inputType: inputType,
      error: error ?? null,
      obscureText: obscureText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      textAlign: textAlign,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
