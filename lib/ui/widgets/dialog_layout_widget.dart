import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_provider_app/localization/app_localizations.dart';
import 'package:sample_provider_app/locator.dart';
import 'package:sample_provider_app/models/dialog/dialog_model.dart';
import 'package:sample_provider_app/services/common/dialog_service.dart';
import 'package:sample_provider_app/ui/shared/app_colors.dart';
import 'package:sample_provider_app/ui/shared/shared_styles.dart';
import 'package:sample_provider_app/ui/shared/ui_helper.dart';

class DialogLayoutWidget extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final String positiveButtonLabel;
  final String negativeButtonLabel;
  final VoidCallback onPositiveButtonClick;
  final VoidCallback onNegativeButtonClick;

  const DialogLayoutWidget({
    Key key,
    this.title,
    this.icon,
    this.description,
    this.positiveButtonLabel,
    this.negativeButtonLabel,
    this.onPositiveButtonClick,
    this.onNegativeButtonClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isConfirmationDialog = negativeButtonLabel != null;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      backgroundColor: Colors.white,
      elevation: 2.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 130.0,
            child: Image.asset(
              icon ?? 'assets/images/no_connection.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            "${AppLocalizations.of(context).translate(title) ?? title}",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                color: black, fontWeight: FontWeight.w700, fontSize: 18.0),
          ),
          verticalSpace(8.0),
          Container(
            width: 200.0,
            child: Text(
              "${AppLocalizations.of(context).translate(description) ?? description}",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: blueGrey,
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
          ),
          verticalSpace(24.0),
          if (isConfirmationDialog)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                horizontalSpaceMediumSmall,
                Expanded(
                  child: ButtonTheme(
                    height: 40.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: OutlineButton(
                      splashColor: secondary,
                      highlightColor: primary,
                      onPressed: () {
                        if (onNegativeButtonClick != null) {
                          onNegativeButtonClick();
                        }
                        locator<DialogService>()
                            .dialogComplete(DialogResponse(confirmed: true));
                      },
                      color: Colors.white,
                      highlightedBorderColor: primary,
                      borderSide: BorderSide(width: 1.0, color: primary),
                      disabledBorderColor: Colors.grey[400],
                      disabledTextColor: Colors.grey[400],
                      child: Text(
                        "${AppLocalizations.of(context).translate(negativeButtonLabel)}",
                        style: buttonTextStyle,
                      ),
                    ),
                  ),
                ),
                horizontalSpaceMediumSmall,
                Expanded(
                  child: ButtonTheme(
                    height: 40.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: OutlineButton(
                      splashColor: secondary,
                      highlightColor: primary,
                      onPressed: () {
                        if (onPositiveButtonClick != null) {
                          onPositiveButtonClick();
                        }
                        locator<DialogService>()
                            .dialogComplete(DialogResponse(confirmed: true));
                      },
                      color: Colors.white,
                      child: Text(
                        "${AppLocalizations.of(context).translate(positiveButtonLabel)}",
                        style: buttonTextStyle,
                      ),
                      highlightedBorderColor: primary,
                      borderSide: BorderSide(width: 1.0, color: blueGrey),
                      disabledBorderColor: Colors.grey[400],
                      disabledTextColor: Colors.grey[400],
                    ),
                  ),
                ),
                horizontalSpaceMediumSmall,
              ],
            ),
          if (!isConfirmationDialog)
            ButtonTheme(
              minWidth: screenWidthFraction(context, dividedBy: 2),
              height: 40.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: OutlineButton(
                splashColor: secondary,
                highlightColor: primary,
                onPressed: () {
                  if (onPositiveButtonClick != null) {
                    onPositiveButtonClick();
                  }
                  locator<DialogService>()
                      .dialogComplete(DialogResponse(confirmed: true));
                },
                color: Colors.white,
                borderSide: BorderSide(width: 1.0, color: blueGrey),
                highlightedBorderColor: primary,
                disabledBorderColor: Colors.grey[400],
                disabledTextColor: Colors.grey[400],
                child: Text(
                  "${AppLocalizations.of(context).translate(positiveButtonLabel)}",
                  style: buttonTextStyle,
                ),
              ),
            ),
          verticalSpace(24.0),
        ],
      ),
    );
  }
}
