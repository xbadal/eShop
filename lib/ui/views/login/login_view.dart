import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:sample_provider_app/ui/shared/app_colors.dart';
import 'package:sample_provider_app/ui/shared/ui_helper.dart';
import 'package:sample_provider_app/ui/views/login/login_view_model.dart';
import 'package:sample_provider_app/ui/widgets/busy_button.dart';
import 'package:sample_provider_app/ui/widgets/login_field_widget.dart';

class LoginView extends StatelessWidget {
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: primary,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: primary,
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(left: 24.0, right: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          verticalSpaceSmall,
                          Image.asset(
                            'assets/images/logo.png',
                            height: 100.0,
                            width: 100.0,
                          ),
                          verticalSpaceMedium,
                          Text(
                            'Welcome to',
                            style: GoogleFonts.poppins(
                              color: buttonColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 22.0,
                            ),
                          ),
                          Text(
                            'eShop',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          ),
                          verticalSpaceMedium,
                          StreamBuilder<String>(
                            stream: model.mobile,
                            builder: (context, snapshot) {
                              _mobile.value =
                                  _mobile.value.copyWith(text: snapshot.data);
                              return LoginFieldWidget(
                                hint: "Mobile",
                                controller: _mobile,
                                textAlign: TextAlign.start,
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.phone,
                                error: snapshot.error,
                                onChanged: model.onMobileChange,
                                obscureText: false,
                              );
                            },
                          ),
                          verticalSpaceMedium,
                          StreamBuilder<String>(
                            stream: model.password,
                            builder: (context, snapshot) {
                              _password.value =
                                  _password.value.copyWith(text: snapshot.data);
                              return LoginFieldWidget(
                                hint: "Password",
                                controller: _password,
                                textAlign: TextAlign.start,
                                inputAction: TextInputAction.done,
                                inputType: TextInputType.visiblePassword,
                                error: snapshot.error,
                                onChanged: model.onPasswordChange,
                                obscureText: true,
                              );
                            },
                          ),
                          verticalSpaceMedium,
                          Text(
                            'Forgot Password?',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.lato(
                              color: buttonColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                            ),
                          ),
                          verticalSpaceMedium,
                          StreamBuilder<bool>(
                            stream: model.validateLoginButton,
                            builder: (context, snapshot) {
                              return BusyButton(
                                busy: model.loading,
                                title: 'Login',
                                width: screenWidth(context),
                                onPressed:
                                    snapshot.hasData ? model.login : null,
                              );
                            },
                          ),
                          verticalSpaceMediumSmall,
                          InkWell(
                            onTap: model.navigateToSignUp,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Don\'t have an account?',
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0,
                                  ),
                                ),
                                horizontalSpaceTiny,
                                Text(
                                  'Sign Up',
                                  style: GoogleFonts.lato(
                                    color: buttonColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
