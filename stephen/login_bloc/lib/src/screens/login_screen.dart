import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(children: [
        emailField(),
        passwordField(),
        Container(margin: const EdgeInsets.only(top: 25.0)),
        submitButton(),
      ]),
    );
  }

  emailField() {
    return const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(hintText: 'email', labelText: 'EMail Address',errorText:'invalid email'),
    );
  }

  passwordField() {
    return const TextField(
      // obscureText: true,
      decoration: InputDecoration(hintText: 'password', labelText: 'Password',errorText:'invalid password'),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: const Text('Submit'),
      onPressed: () {},
    );
  }
}
