import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_provider_app/ui/shared/ui_helper.dart';

import 'busy_button.dart';

class LoginPlaceHolderWidget extends StatelessWidget {
  final Function onTap;

  LoginPlaceHolderWidget({this.onTap});

  @override
  Widget build(BuildContext context) {
    var model;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please Login to continue',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                  color: Colors.grey),
            ),
            verticalSpace(24.0),
            BusyButton(
              title: 'Login',
              onPressed: onTap,
              width: 200.0,
            )
          ],
        ),
      ),
    );
  }
}
