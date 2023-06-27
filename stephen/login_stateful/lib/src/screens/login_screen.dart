import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email='';
  String password='';

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: const EdgeInsets.only(top: 25.0)),
            submitField(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: '',
      ),
      validator:validateEmail,
      onSaved: (value) {
        email=value!;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: '',
      ),
      validator: validatePassword,
      onSaved: (value) {
        password=value!;
      },
    );
  }

  Widget submitField() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blue[500]),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();
          print('Time to post $email and $password to my API');
        }
      },
      child: const Text('Submit'),
    );
  }
}
