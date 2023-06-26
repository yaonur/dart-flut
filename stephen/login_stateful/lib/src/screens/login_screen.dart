import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey=GlobalKey<FormState>();

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key:formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin:const EdgeInsets.only(top: 25.0)),
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
      validator:(value){
        if (!value!.contains('@')){
          return 'Please enter a valid email';
        }
        return null;
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
      validator:(value){
        if (value!.length<4){
          return 'Password must be at least 4 characters';
        }
        return null;
      },
    );
  }

  Widget submitField() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blue[500]),
      onPressed: () {
        formKey.currentState?.validate();
        // formKey.currentState?.reset();sdf
      },
      child: const Text('Submit'),
    );
  }
}
