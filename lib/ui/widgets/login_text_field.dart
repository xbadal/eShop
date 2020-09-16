import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_provider_app/ui/shared/themes.dart';

class LoginTextField extends StatelessWidget {
  LoginTextField(
      {this.hint,
      this.inputAction,
      this.inputType = TextInputType.number,
      this.error,
      this.onChanged,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.textAlign,
      this.focusNode,
      this.onFieldSubmitted,
      this.controller});

  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final FocusNode focusNode;
  final String hint;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final String error;
  final bool obscureText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextAlign textAlign;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        keyboardType: inputType,
        textAlign: textAlign == null ? TextAlign.center : textAlign,
        textInputAction: inputAction,
        style: TextStyle(
            color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w400),
        onChanged: onChanged,
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null ? prefixIcon : null,
          contentPadding: const EdgeInsets.all(12.0),
          border: BorderStyles.auctionTextFieldBorderStyle,
          enabledBorder: BorderStyles.auctionTextFieldBorderStyle,
          disabledBorder: BorderStyles.auctionTextFieldBorderStyle,
          focusedBorder: BorderStyles.auctionTextFieldBorderStyle,
          errorText: error ?? null,
          errorMaxLines: 3,
          errorBorder: BorderStyles.errorBorder,
          errorStyle: TextStyles.errorStyle,
          hintStyle: TextStyles.hintStyle,
          filled: true,
          hintText: hint,
          fillColor: Colors.white24,
        ),
      ),
    );
  }
}
