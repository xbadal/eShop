import 'package:flutter/material.dart';
import 'package:sample_provider_app/ui/shared/app_colors.dart';
import 'package:sample_provider_app/ui/shared/ui_helper.dart';

class LoadingWidget extends StatelessWidget {
  final String title;
  final String message;

  LoadingWidget({this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            verticalSpace(24.0),
            Text(
              title,
              style: TextStyle(
                  color: primary, fontWeight: FontWeight.w700, fontSize: 16.0),
            ),
            verticalSpace(8.0),
            Text(
              message,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
