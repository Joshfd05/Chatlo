import 'package:chatlo/pages/home_page.dart';
import 'package:chatlo/services/auth/auth_service.dart';
import 'package:chatlo/components/my_button.dart';
import 'package:chatlo/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  // Text editing controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  //  methRegisterod
  void register(BuildContext context) {
    final _auth = AuthService(); // get auth service

    // check if passwords match it will create user
    if (_pwController.text == _confirmPwController.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );

        print("User created!");
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    // If not it will show an error
    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Password doesn't match!!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.airline_seat_flat_angled_rounded,
                size: 50,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 20),

              // Welcome back message
              Text(
                "Long time no see brudh!!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // email textfield
              MyTextfield(
                hintText:
                    'Email', // Variable for the email textfield's hint text
                obscureText: false,
                controller: _emailController,
              ),
              const SizedBox(height: 10),

              // pw textfield
              MyTextfield(
                hintText:
                    "Password", // Variable for the password textfield's hint text
                obscureText: true,
                controller: _pwController,
              ),
              const SizedBox(height: 10),

              // confirm pw textfield
              MyTextfield(
                hintText:
                    "Confirm Password", // Variable for the password textfield's hint text
                obscureText: true,
                controller: _confirmPwController,
              ),

              const SizedBox(height: 25),

              // register btn
              MyButton(
                text: "Register", // Variable for the Register button's text
                onTap: () => register(
                    context), // Function for the Register button's onTap
              ),

              const SizedBox(height: 25),

              // register now
              Text(
                "Already have an account?",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),

              GestureDetector(
                onTap: onTap,
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}
