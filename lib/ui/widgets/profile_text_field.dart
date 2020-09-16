import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_provider_app/ui/shared/app_colors.dart';

class ProfileTextField extends StatelessWidget {
  ProfileTextField(
      {this.hint,
      this.inputAction,
      this.inputType = TextInputType.text,
      this.error,
      this.labelText,
      this.onChanged,
      this.obscureText = false,
      this.enabled = true,
      this.prefixIcon,
      this.suffixIcon,
      this.focusNode,
      this.onFieldSubmitted,
      this.editingController});

  final Function(String) onChanged;
  final String hint;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final String error;
  final String labelText;
  final bool obscureText;
  final bool enabled;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final TextEditingController editingController;
  final Function(String) onFieldSubmitted;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextFormField(
        enabled: enabled,
        controller: editingController,
        textInputAction: inputAction,
        style: GoogleFonts.lato(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
        focusNode: focusNode,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: inputType,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12.0),
          border: const OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 0.0,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 0.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
            borderSide: const BorderSide(
              color: primary,
              width: 0.0,
            ),
          ),
          errorText: error,
          errorMaxLines: 1,
          errorBorder: const OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0),
            ),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 0.5,
            ),
          ),
          errorStyle: GoogleFonts.montserrat(
              color: Colors.red, fontWeight: FontWeight.w400, fontSize: 12.0),
          hintStyle: GoogleFonts.montserrat(
              color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 14.0),
          filled: true,
          hintText: hint,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
