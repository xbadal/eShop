import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_provider_app/localization/app_localizations.dart';
import 'package:sample_provider_app/localization/localization_keys.dart';
import 'package:sample_provider_app/locator.dart';
import 'package:sample_provider_app/models/dialog/dialog_model.dart';
import 'package:sample_provider_app/services/common/connectivity_service.dart';
import 'package:sample_provider_app/services/common/dialog_service.dart';
import 'package:sample_provider_app/ui/shared/shared_styles.dart';
import 'package:sample_provider_app/ui/shared/ui_helper.dart';
import 'package:sample_provider_app/ui/widgets/error_widget_view.dart';
import 'package:provider/provider.dart';

import 'app_colors.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key key, this.child})
      : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  final _dialogService = locator<DialogService>();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();

  @override
  void initState() {
    _dialogService.registerDialogListener(_showDialog);
    _dialogService.registerSnackbarListener(_showSnackBar);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    var connectionStatus = Provider.of<ConnectivityStatus>(context);
//    if (connectionStatus == ConnectivityStatus.Offline) {
//      return ErrorWidgetView(
//        title: NoInternetConnectionTitle,
//        message: NoInternetConnectionMessage,
//        buttonLabel: EnableWifiLabel,
//      );
//    }
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldState,
      body: widget.child,
    );
  }

  void _showDialog(DialogRequest request) {
    var isConfirmationDialog = request.onNegativeButtonClick != null;
    showDialog(
      context: context,
      builder: (context) => request.builder != null
          ? request.builder()
          : AlertDialog(
              title: Text(
                "${AppLocalizations.of(context).translate(request.title) ?? request.title}",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: black,
                ),
              ),
              content: Text(
                "${AppLocalizations.of(context).translate(request.description) ?? request.description}",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: blueGrey,
                ),
              ),
              actions: <Widget>[
                if (isConfirmationDialog)
                  FlatButton(
                    splashColor: secondary,
                    onPressed: () {
                      if (request.onNegativeButtonClick != null) {
                        request.onNegativeButtonClick();
                      }
                      _dialogService.dialogComplete(
                        DialogResponse(confirmed: false),
                      );
                    },
                    child: Text(
                      "${AppLocalizations.of(context).translate(request.negativeButtonLabel).toUpperCase()}",
                      style: errorButtonStyle,
                    ),
                  ),
                FlatButton(
                  splashColor: secondary,
                  onPressed: () {
                    if (request.onPositiveButtonClick != null) {
                      request.onPositiveButtonClick();
                    }
                    _dialogService
                        .dialogComplete(DialogResponse(confirmed: true));
                  },
                  child: Text(
                    "${AppLocalizations.of(context).translate(request.positiveButtonLabel).toUpperCase()}",
                    style: errorButtonStyle,
                  ),
                )
              ],
            ),
    );
  }

  _showSnackBar(String message) {
    onWidgetDidBuild(() {
      _scaffoldState.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "${AppLocalizations.of(context).translate(message) ?? message}",
            style: GoogleFonts.lato(
              fontSize: 14.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.black,
        ),
      );
    });
  }
}
