import 'package:chatlo/services/auth/auth_service.dart';
import 'package:chatlo/components/my_button.dart';
import 'package:chatlo/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // Text editing controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // login method
  void login(BuildContext context) async {
    // Auth service
    final authService = AuthService();

    // Try Login
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _pwController.text);
    }

    // Catch any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
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
              const SizedBox(height: 25),

              // login btn
              MyButton(
                text: "Login", // Variable for the login button's text
                onTap: () => login(context),
              ),

              const SizedBox(height: 25),

              // register now
              Text(
                "Why don't u hv an account still huh??",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),

              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Register now!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}
