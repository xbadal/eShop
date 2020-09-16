import 'package:rxdart/rxdart.dart';
import 'package:sample_provider_app/helper/validators.dart';
import 'package:sample_provider_app/models/auth/auth_response_model.dart';
import 'package:sample_provider_app/services/auth/auth_service.dart';
import 'package:sample_provider_app/viewmodels/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  final _service = AuthenticationService();

  final _mobileController = BehaviorSubject<String>();

  Stream<String> get mobile =>
      _mobileController.stream.transform(mobileValidator);

  Function(String) get onMobileChange => _mobileController.sink.add;

  final _passwordController = BehaviorSubject<String>();

  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  Function(String) get onPasswordChange => _passwordController.sink.add;

  Stream<bool> get validateLoginButton =>
      CombineLatestStream([mobile, password], (data) => true);

  //Api calls
  void login() async {
    setBusy(true);
    final mobile = _mobileController.value;
    final password = _passwordController.value;
    final data = <String, String>{
      "mobile": mobile,
      'password': password,
    };
    AuthResponseModel result = await _service.loginUser(data);
    if (result.success) {
      await _service.saveAuthToken(result.data.token);
      await _service.saveUser(result.data);
      navigateToHome();
    } else {
      _service.showErrorDialog();
    }
    setBusy(false);
  }

  //Navigation
  void navigateToHome() async {
    return _service.navigateToHome();
  }

  void navigateToSignUp() async {
//    return _service.navigateToRegister();
  }

  @override
  void dispose() {
    _mobileController?.close();
    _passwordController?.close();
    super.dispose();
  }
}
