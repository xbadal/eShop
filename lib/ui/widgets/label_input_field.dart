import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_provider_app/extension/string_extension.dart';
import 'package:sample_provider_app/localization/app_localizations.dart';
import 'package:sample_provider_app/ui/shared/app_colors.dart';
import 'package:sample_provider_app/ui/shared/ui_helper.dart';
import 'package:sample_provider_app/ui/widgets/note_text.dart';

class LabelInputField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final double fieldHeight;
  final int maxLines;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String validationMessage;
  final String initialValue;
  final Function enterPressed;
  final bool smallVersion;
  final FocusNode fieldFocusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final String additionalNote;
  final Function(String) onChanged;
  final TextInputFormatter formatter;
  final String prefix;
  final Widget suffixIcon;
  final bool autoFocus;
  final bool verified;

  const LabelInputField({
    Key key,
    @required this.controller,
    @required this.placeholder,
    @required this.onChanged,
    this.fieldHeight = 60.0,
    this.maxLines = 1,
    this.validationMessage,
    this.prefix,
    this.initialValue,
    this.enterPressed,
    this.fieldFocusNode,
    this.nextFocusNode,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.additionalNote,
    this.formatter,
    this.smallVersion = false,
    this.password = false,
    this.isReadOnly = false,
    this.autoFocus = false,
    this.suffixIcon,
    this.verified = false,
  })  : assert(controller != null),
        assert(placeholder != null),
        super(key: key);

  @override
  _LabelInputFieldState createState() => _LabelInputFieldState();
}

class _LabelInputFieldState extends State<LabelInputField> {
  bool isPassword;

  @override
  void initState() {
    isPassword = widget.password;

    if (widget.initialValue.isNotNullOrEmpty) {
      widget.controller.value = widget.controller.value.copyWith(
        text: widget.initialValue,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: widget.smallVersion ? 40 : widget.fieldHeight,
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  cursorColor: titleColor,
                  controller: widget.controller,
                  keyboardType: widget.textInputType,
                  focusNode: widget.fieldFocusNode,
                  textInputAction: widget.textInputAction,
                  onChanged: widget.onChanged,
                  maxLines: widget.maxLines,
                  autofocus: widget.autoFocus,
                  inputFormatters:
                      widget.formatter != null ? [widget.formatter] : null,
                  onEditingComplete: () {
                    if (widget.enterPressed != null) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      widget.enterPressed();
                    }
                  },
                  onFieldSubmitted: (value) {
                    if (widget.nextFocusNode != null) {
                      widget.nextFocusNode.requestFocus();
                    }
                  },
                  obscureText: isPassword,
                  readOnly: widget.isReadOnly,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(top: 12.0, bottom: 12.0),
                    prefix: Text(
                      "${widget.prefix ?? ''}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                    ),
                    suffixIcon: widget.suffixIcon,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: blueGrey)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: blueGrey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.verified ? Colors.black : titleColor),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryDark),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText:
                        "${AppLocalizations.of(context).translate(widget.placeholder) ?? widget.placeholder}",
                    labelStyle: TextStyle(
                      fontSize: widget.smallVersion ? 14 : 16,
                      fontWeight: FontWeight.w400,
                      color: blueGrey,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  isPassword = !isPassword;
                }),
                child: widget.password
                    ? Container(
                        width: widget.fieldHeight,
                        height: widget.fieldHeight,
                        alignment: Alignment.center,
                        child: Icon(isPassword
                            ? Icons.visibility_off
                            : Icons.visibility))
                    : Container(),
              ),
            ],
          ),
        ),
        if (widget.validationMessage != null) verticalSpace(8),
        if (widget.validationMessage != null)
          NoteText(
            "${AppLocalizations.of(context).translate(widget.validationMessage)}",
            color: Colors.red,
          ),
        if (widget.additionalNote != null) verticalSpace(5),
        if (widget.additionalNote != null) NoteText(widget.additionalNote),
        verticalSpaceSmall
      ],
    );
  }
}
