import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sample_provider_app/constants/routes_name.dart';
import 'package:sample_provider_app/localization/localization_keys.dart';
import 'package:sample_provider_app/locator.dart';
import 'package:sample_provider_app/models/auth/user.dart';
import 'package:sample_provider_app/services/common/dialog_service.dart';
import 'package:sample_provider_app/services/common/navigation_service.dart';
import 'package:sample_provider_app/services/repository/repository_service.dart';
import 'package:sample_provider_app/services/storage/storage_service.dart';
import 'package:sample_provider_app/ui/widgets/dialog_layout_widget.dart';

abstract class BaseService {
  final _repository = locator<RepositoryService>();
  final _dialogService = locator<DialogService>();
  final _storageService = locator<StorageService>();
  final _navigationService = locator<NavigationService>();

  String get pushToken => _storageService.pushToken;

  RepositoryService get repository => _repository;

  DialogService get dialogService => _dialogService;

  StorageService get storageService => _storageService;

  NavigationService get navigationService => _navigationService;

  String get authToken => _storageService.authToken;

  User get user => _storageService.userData;

  void _showDialog(
      {String title,
      String description,
      VoidCallback onPositiveButtonClick,
      VoidCallback onNegativeButtonClick,
      String positiveButtonLabel,
      String negativeButtonLabel,
      Widget Function() builder}) async {
    await dialogService.showDialog(
      title: title,
      description: description,
      positiveButtonLabel: positiveButtonLabel,
      negativeButtonLabel: negativeButtonLabel,
      onPositiveButtonClick: onPositiveButtonClick,
      onNegativeButtonClick: onNegativeButtonClick,
      builder: builder,
    );
  }

  void showSuccessDialog({
    String title = DoneTitle,
    @required String description,
    String icon = "assets/images/done.png",
    String positiveButtonLabel = OKButtonLabel,
    VoidCallback onPositiveButtonClick,
  }) {
    _showDialog(
      builder: () => DialogLayoutWidget(
        title: title,
        description: description,
        icon: icon,
        positiveButtonLabel: positiveButtonLabel,
        onPositiveButtonClick: onPositiveButtonClick,
      ),
    );
  }

  void showErrorDialog({
    String title = ErrorTitle,
    String description = ErrorMessage,
    String positiveButtonLabel = OKButtonLabel,
    VoidCallback onPositiveButtonClick,
  }) {
    _showDialog(
      builder: () => DialogLayoutWidget(
        title: title,
        description: description,
        icon: "assets/images/error.png",
        onPositiveButtonClick: onPositiveButtonClick,
        positiveButtonLabel: positiveButtonLabel,
      ),
    );
  }

  void showConfirmationDialog({
    String title,
    String description,
    String icon,
    String positiveButtonLabel,
    String negativeButtonLabel,
    VoidCallback onPositiveButtonClick,
    VoidCallback onNegativeButtonClick,
  }) {
    _showDialog(
      builder: () => DialogLayoutWidget(
        title: title,
        description: description,
        icon: icon,
        positiveButtonLabel: positiveButtonLabel,
        negativeButtonLabel: negativeButtonLabel,
        onPositiveButtonClick: onPositiveButtonClick,
        onNegativeButtonClick: onNegativeButtonClick,
      ),
    );
  }

  void logout() async {
    bool isCleared = await _storageService.clearAll();
    if (isCleared) {
      await navigationService.navigateUntilRemoved(LoginRoutePage);
    }
  }

  void showSessionExpiredDialog() {
    _showDialog(
      builder: () => DialogLayoutWidget(
        title: SessionExpiredTitle,
        description: SessionExpiredMessage,
        icon: "assets/images/error.png",
        onPositiveButtonClick: () {
          logout();
        },
        positiveButtonLabel: LogInTitle,
      ),
    );
  }
}
