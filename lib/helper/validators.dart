import 'dart:async';

import 'package:sample_provider_app/extension/string_extension.dart';

const mobileRegex = r"^([0-9][\s]*){10,16}$";

const codeRegex = r"^([0-9][\s]*){4,4}$";

final StreamTransformer<String, String> validateEmail =
    StreamTransformer<String, String>.fromHandlers(
  handleData: (email, sink) {
    final RegExp _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+\.[a-zA-Z]{2,4}",
    );
    if (_emailRegExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  },
);
final StreamTransformer<String, String> mobileValidator =
    StreamTransformer<String, String>.fromHandlers(
  handleData: (phone, sink) {
    if (phone.isNotNullOrEmpty && RegExp(mobileRegex).hasMatch(phone)) {
      sink.add(phone);
    } else {
      sink.addError('Enter valid mobile number');
    }
  },
);

final StreamTransformer<String, String> otpValidator =
    StreamTransformer<String, String>.fromHandlers(
  handleData: (phone, sink) {
    if (phone.isNotNullOrEmpty && phone.length == 5) {
      sink.add(phone);
    } else {
      sink.addError('Enter valid OTP');
    }
  },
);

final StreamTransformer<String, String> validInput =
    StreamTransformer<String, String>.fromHandlers(
  handleData: (phone, sink) {
    if (phone.isNotNullOrEmpty && phone.length > 0) {
      sink.add(phone);
    } else {
      sink.addError('Enter valid Input');
    }
  },
);

final StreamTransformer<String, String> passwordValidator =
    StreamTransformer<String, String>.fromHandlers(
  handleData: (password, sink) {
    if (password.isNotNullOrEmpty && password.length > 1) {
      sink.add(password);
    } else {
      sink.addError('Enter valid password');
    }
  },
);

final StreamTransformer<String, String> nameValidator =
    StreamTransformer<String, String>.fromHandlers(
  handleData: (password, sink) {
    if (password.isNotNullOrEmpty && password.length > 1) {
      sink.add(password);
    } else {
      sink.addError('Enter valid name');
    }
  },
);
final StreamTransformer<String, String> amountValidator =
    StreamTransformer<String, String>.fromHandlers(
  handleData: (amount, sink) {
    if (amount.isNotNullOrEmpty &&
        amount.length > 1 &&
        double.parse(amount) > 0) {
      sink.add(amount);
    } else {
      sink.addError('Enter valid amount');
    }
  },
);

final StreamTransformer<String, String> pincodeValidator =
    StreamTransformer<String, String>.fromHandlers(
  handleData: (pincode, sink) {
    if (pincode.isNotNullOrEmpty && pincode.length == 6) {
      sink.add(pincode);
    } else {
      sink.addError('Enter valid pincode');
    }
  },
);
