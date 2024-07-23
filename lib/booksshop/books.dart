// ignore_for_file: unnecessary_import

import 'package:startupculture/courses.dart';
import 'package:startupculture/courses/html.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
        title: Text(
          'Books Shop',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCourseContainer(
                  'assets/AtomicHabits.png',
                  'Atomic Habits',
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const htmlPage(url: ''))),
                ),
                const SizedBox(width: 15),
                _buildCourseContainer(
                  'assets/css.png',
                  'Learn CSS3',
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const coursesPage(totalScore: 0))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseContainer(
      String imageAsset, String title, VoidCallback onPressed) {
    return Container(
      height: 250,
      width: 200,
      decoration: BoxDecoration(
        color: const Color(0xffeca731),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageAsset,
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              color: Color(0xffeca731),
              fontWeight: FontWeight.normal,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Download Now',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
