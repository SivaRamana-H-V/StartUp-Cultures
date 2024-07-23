// ignore_for_file: avoid_print, library_private_types_in_public_api, use_build_context_synchronously, prefer_typing_uninitialized_variables
import 'package:startupculture/auth/login.dart';
import 'package:startupculture/homepage.dart';
import 'package:startupculture/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';

var isEnrolled;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
    _checkSession();
  }

  Future<void> _checkSession() async {
    Future<bool> isUserEnrolled() async {
      final user = supabase.auth.currentUser;
      PostgrestMap response;
      if (user != null) {
        try {
          response = await supabase
              .from('user_profiles')
              .select()
              .eq('id', user.id)
              .single();
          if (response.isNotEmpty) {
            return true; // User is enrolled
          } else {
            return false; // User is not enrolled
          }
        } catch (e) {
          print('Error: $e');
          return false;
        }
      }
      return false;
    }

    isEnrolled = await isUserEnrolled();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              isEnrolled ? const homePage() : const LoginPage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeca731),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 135,
                width: 300,
                child: Image.asset(
                  'assets/authlogo.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
