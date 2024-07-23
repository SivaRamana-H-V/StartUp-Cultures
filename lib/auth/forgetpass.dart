import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: const Color(0xffeca731), // Background color
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 30),
                SizedBox(
                  height: 135,
                  width: 300,
                  child: Image.asset(
                    'assets/authlogo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Color(0xffeca731),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        const TextField(
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.email, color: Color(0xffeca731)),
                            hintText: 'Email',
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle forgot password logic here
                            },
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              'Reset Password',
                              style: TextStyle(
                                color: Color(0xffeca731),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // Navigate back to the login page
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back to Login',
                    style: TextStyle(
                      color: Color(0xfffdfdfd),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: const ForgetPasswordPage(),
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xffeca731, {
          50: Color(0xffeca731),
          100: Color(0xffeca731),
          200: Color(0xffeca731),
          300: Color(0xffeca731),
          400: Color(0xffeca731),
          500: Color(0xffeca731),
          600: Color(0xffeca731),
          700: Color(0xffeca731),
          800: Color(0xffeca731),
          900: Color(0xffeca731),
        }),
      ),
    ));
