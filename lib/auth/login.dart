// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, avoid_print

import 'dart:ui';
import 'package:startupculture/auth/enroll.dart';
import 'package:startupculture/auth/forgetpass.dart';
import 'package:startupculture/customshape.dart';
import 'package:startupculture/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  late bool _isVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Future<void> _login() async {
    final email = _usernameController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showError('Email and password cannot be empty.');
      return;
    }

    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final User? user = res.user;

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const EnrollmentForm(),
          ),
        );
      } else {
        _showError('Login failed. Please check your network.');
      }
    } catch (e) {
      print('not run try $e');
      _showError('Invalid credentials. Please try again.');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.45],
                  colors: [
                    Color(0xFFFAB400),
                    Colors.white,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  CustomPaint(
                    size: const Size(238, 303),
                    painter: RPSCustomPainter12(),
                  ),
                  CustomPaint(
                    size: const Size(350, 900),
                    painter: RPSCustomPainter2(),
                  ),
                  Positioned(
                    top: 180,
                    left: 50,
                    child: Image.asset(
                      'assets/authlogoBK.png',
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFFFAB400),
                      ),
                      labelText: 'Email',
                      iconColor: Color(0xFFFAB400),
                      labelStyle: TextStyle(color: Color(0xFFFAB400)),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    obscureText: _isVisible,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.lock, color: Color(0xFFFAB400)),
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Color(0xFFFAB400)),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: _isVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onPressed: _toggleVisibility,
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPasswordPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(
                      onPressed: _login,
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.amber),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Transform.rotate(
                  angle: 46,
                  child: Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
