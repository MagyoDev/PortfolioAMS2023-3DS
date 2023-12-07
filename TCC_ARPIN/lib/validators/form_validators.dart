import 'package:flutter/services.dart';

class EmailTextInputFormatter extends FilteringTextInputFormatter {
  EmailTextInputFormatter()
      : super(RegExp(r'^[\w\.\-]+@[a-zA-Z\d\.\-]+\.[a-zA-Z]{2,4}$'),
            allow: true);
}

class PasswordTextInputFormatter extends FilteringTextInputFormatter {
  PasswordTextInputFormatter()
      : super(RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\\-]{8,}$'), allow: true);
}