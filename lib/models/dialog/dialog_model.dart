import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DialogRequest {
  final String title;
  final String description;
  final String positiveButtonLabel;
  final String negativeButtonLabel;
  final VoidCallback onPositiveButtonClick;
  final VoidCallback onNegativeButtonClick;
  final Widget Function() builder;

  DialogRequest({
    this.title,
    this.description,
    this.positiveButtonLabel,
    this.negativeButtonLabel,
    this.onPositiveButtonClick,
    this.onNegativeButtonClick,
    this.builder,
  });
}

class DialogResponse {
  final String fieldOne;
  final String fieldTwo;
  final bool confirmed;

  DialogResponse({
    this.fieldOne,
    this.fieldTwo,
    this.confirmed,
  });
}
