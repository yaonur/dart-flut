import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';
class Bloc extends Object with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Change data to stream
  Function(String) get changeEmail=>_email.sink.add;
  Function(String) get changePassword=>_password.sink.add;

  // Add data from stream
  Stream<String> get email=>_email.stream.transform(validateEmail);
  Stream<String> get password=>_password.stream.transform(validatePassword);
  Stream<bool> get submitValue=>Rx.combineLatest2(email, password, (e, p) => true);

  submit(){
    final validEmail=_email.valueOrNull;
    final validPassword=_password.valueOrNull;
    print('Email is $validEmail and password is $validPassword');
  }

  dispose(){
    _email.close();
    _password.close();
  }

}

// final bloc = Bloc();