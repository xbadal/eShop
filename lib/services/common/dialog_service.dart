import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_provider_app/models/dialog/dialog_model.dart';

class DialogService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Function(DialogRequest) _showDialogListener;
  Function(String) _showSnackBarListener;
  Completer<DialogResponse> _completer;

  //Register a callback function. Typically to show the dialog. Void
  registerDialogListener(Function(DialogRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  //Register a callback function. Typically to show the SnackBar. Void
  registerSnackbarListener(Function(String) showSnackbarListener) {
    _showSnackBarListener = showSnackbarListener;
  }

  //Function to show dialog
  Future<DialogResponse> showDialog(
      {String title,
      String description,
      String positiveButtonLabel,
      String negativeButtonLabel,
      VoidCallback onPositiveButtonClick,
      VoidCallback onNegativeButtonClick,
      Widget Function() builder}) {
    _completer = Completer<DialogResponse>();
    _showDialogListener(DialogRequest(
        title: title,
        description: description,
        positiveButtonLabel: positiveButtonLabel,
        negativeButtonLabel: negativeButtonLabel,
        onNegativeButtonClick: onNegativeButtonClick,
        onPositiveButtonClick: onNegativeButtonClick,
        builder: builder));
    return _completer.future;
  }

  //Function to show Snackbar. Void
  showSnackBar(String message) {
    _showSnackBarListener(message);
  }

  //Function to Complete the dialog to resume Future's execution.
  dialogComplete(DialogResponse response) {
    navigatorKey.currentState.pop();
    _completer.complete(response);
    _completer = null;
  }
}
