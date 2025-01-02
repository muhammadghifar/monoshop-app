import 'package:flutter/material.dart';
import 'package:submission/component/button/elevated_button.dart';
import 'package:submission/component/button/text_button.dart';
import 'package:submission/component/form/text_field.dart';
import 'package:submission/view/main_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true; // Track whether the form is for login or registration

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool? isRemember = false;

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin; // Toggle between login and register
    });
  }

  void _submit() {
    if (_isLogin) {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        // Simple validation check for login
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please fill in all fields.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Handle login logic
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => MainScreen(
                  username: _emailController.text,
                )),
      );
    } else {
      // Registration logic
      if (_nameController.text.isEmpty ||
          _emailController.text.isEmpty ||
          _passwordController.text.isEmpty) {
        // Simple validation check for registration
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please fill in all fields.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Handle registration logic
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => MainScreen(
                  username: _nameController.text,
                )),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(60.0),
      //   child: Container(
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       boxShadow: [
      //         BoxShadow(
      //           color: Colors.black.withOpacity(0.2),
      //           spreadRadius: 1,
      //           blurRadius: 4,
      //           offset: const Offset(0, 2),
      //         ),
      //       ],
      //     ),
      //     child: AppBar(
      //       title: const Text('Login / Register'),
      //       backgroundColor: Colors.transparent,
      //       elevation: 0,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 72),
            children: <Widget>[
              const Icon(Icons.shopping_cart, size: 100),
              const Center(
                child: Text("MONOSHOP",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 80),
              if (!_isLogin)
                Column(
                  children: [
                    TextFieldComponent(
                      controller: _nameController,
                      labelText: 'Name',
                      hintText: 'John Doe',
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              TextFieldComponent(
                controller: _emailController,
                labelText: 'Email',
                hintText: 'example@mail.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldComponent(
                controller: _passwordController,
                labelText: 'Password',
                hintText: '********',
                obscureText: true,
              ),
              if (_isLogin)
              Row(
                children: [
                  Checkbox(
                    value: isRemember,
                    onChanged: (newValue) {
                      setState(() {
                        isRemember = newValue;
                      });
                    },
                  ),
                  const Text('Remember me'),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButtonComponent(
                onPressed: _submit,
                text: _isLogin ? 'Login' : 'Register',
              ),
              const SizedBox(height: 20),
              TextButtonComponent(
                onPressed: _toggleForm,
                text: _isLogin
                    ? 'Don\'t have an acocunt? Register'
                    : 'Already have an account? Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
