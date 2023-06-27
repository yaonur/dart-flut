import 'dart:async';

void main() {
  final bloc = new Bloc();


  bloc.email.listen((value) {
    print(value);
  });

  bloc.changeEmail('MY NEW EMAIL');

  bloc.password.listen((value) {
    print(value);
  });

  bloc.changePassword('MY NEW PASSWORD');
}

class Bloc {
  final emailController = StreamController<String>();
  final passwordController = StreamController<String>();

//add data to stream
  Function(String) get changeEmail => emailController.sink.add;
  Function(String) get changePassword => passwordController.sink.add;

//retrieve data from stream
  get email => emailController.stream;
  get password => passwordController.stream;
}
