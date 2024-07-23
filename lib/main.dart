// ignore_for_file: avoid_print, unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'package:startupculture/splash.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://oamamhkiwtyrytdlobvx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9hbWFtaGtpd3R5cnl0ZGxvYnZ4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg2ODY0NTYsImV4cCI6MjAzNDI2MjQ1Nn0.gTLFCTwRZUoJOkOV_juSaiPk-1-LYypD4oTqOxD-8YA',
    postgrestOptions: const PostgrestClientOptions(schema: 'startup_culture'),
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

Map<String, dynamic> userDataFetcher = {};
late String userID;
var userid;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _getdata();
  }

  Future<void> _getdata() async {
    final user = supabase.auth.currentUser;
    PostgrestMap response;
    if (user != null) {
      try {
        response = (await supabase
            .from('user_profiles')
            .select()
            .eq('id', user.id)
            .single());
        setState(() {
          userDataFetcher = response;
          userID = user.email!;
          userid = user.id;
        });
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Culture',
      scrollBehavior: const MaterialScrollBehavior().copyWith(),
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xff3F3E3E),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffeca731)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xffeca731)),
      ),
      home: const SplashScreen(),
    );
  }
}
