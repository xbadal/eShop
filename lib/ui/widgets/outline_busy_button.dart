import 'package:flutter/material.dart';
import 'package:sample_provider_app/localization/app_localizations.dart';
import 'package:sample_provider_app/ui/shared/app_colors.dart';
import 'package:sample_provider_app/ui/shared/shared_styles.dart';

class OutlineBusyButton extends StatefulWidget {
  final bool busy;
  final String title;
  final Color borderColor;
  final Color splashColor;
  final Color buttonColor;
  final double width;
  final VoidCallback onPressed;

  const OutlineBusyButton({
    Key key,
    this.busy = false,
    @required this.title,
    this.borderColor = primary,
    this.splashColor = secondary,
    this.buttonColor = Colors.white,
    this.width = 150.0,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _OutlineBusyButtonState createState() => _OutlineBusyButtonState();
}

class _OutlineBusyButtonState extends State<OutlineBusyButton> {
  bool _pressed = false;

  bool get pressed => _pressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 40.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      minWidth: widget.width,
      disabledColor: offWhite,
      buttonColor: widget.buttonColor,
      splashColor: widget.splashColor,
      child: OutlineButton(
        splashColor: widget.splashColor,
        highlightColor: primary,
        onPressed: widget.onPressed != null
            ? () {
                widget.onPressed();
              }
            : null,
        child: widget.busy
            ? Container(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(blueGrey),
                ),
                height: 30.0,
                width: 30.0,
              )
            : Text(
                "${AppLocalizations.of(context).translate(widget.title)}",
                style: pressed ? buttonWhiteTextStyle : buttonTextStyle,
              ),
        borderSide: BorderSide(
          width: 2.0,
          color: blueGrey,
        ),
        disabledBorderColor: offWhite,
        disabledTextColor: blueGrey,
        color: Colors.white,
        textColor: primary,
        focusColor: primary,
        highlightedBorderColor: primary,
      ),
    );
  }
}
