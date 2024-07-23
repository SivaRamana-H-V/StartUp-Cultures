// ignore_for_file: unnecessary_import, sort_child_properties_last
import 'package:flutter/material.dart';

import 'form/fetch.dart';
import 'main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
        backgroundColor: const Color(0xffeca731),
        title: const Text(
          'Profile',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xfffdfdfd)),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ProfileLable(),
                Text(userDataFetcher['Name'] ?? 'User'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userDataFetcher['Email'],
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(width: 3),
                    const Text('|'),
                    const SizedBox(width: 3),
                    Text(
                      userDataFetcher['Phone_number'].toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: 342,
            height: 150,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit profile information',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Notification',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Security',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: 342,
            height: 192,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Help & Support',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Privacy Policy',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Logout',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
