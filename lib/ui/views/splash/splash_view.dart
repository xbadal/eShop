import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_provider_app/ui/shared/app_colors.dart';
import 'package:sample_provider_app/ui/shared/ui_helper.dart';
import 'package:sample_provider_app/ui/views/splash/splash_view_model.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SplashViewModel>.withConsumer(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) => model.handleStartupLogin(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: primary,
          body: Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 200.0,
                    width: 200.0,
                  ),
                  verticalSpaceLarge,
                  if (model.currentVersion != null &&
                      model.currentVersion.isNotEmpty)
                    Text(
                      "Version ${model.currentVersion}",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: accent,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600),
                    ),
                  verticalSpaceSmall,
                  if (model.loading) CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
