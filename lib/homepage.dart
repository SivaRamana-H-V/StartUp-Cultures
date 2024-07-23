// ignore_for_file: unused_field, unnecessary_import, camel_case_types, use_super_parameters, prefer_const_constructors

import 'package:startupculture/courses.dart';
import 'package:startupculture/courses/html.dart';
import 'package:startupculture/dashboard/dashboard.dart';
import 'package:startupculture/profile.dart';
import 'package:startupculture/widgets/roadmap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'quiz/splitquzi.dart';

// import 'dashboard/dashboard_Sadmin.dart';
// import 'dashboard/dashboard_admin.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late PageController _pageController;
  late int _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab = 0;
    _pageController = PageController(initialPage: _selectedTab);
  }

  final List _pages = [
    Dashboard(),
    totalScore == 0
        ? QuizAfterCourse()
        : coursesPage(
            totalScore: totalScore,
          ),
    // DashboardAdmin(),
    RoadmapPage(),
    // DashboardSAdmin(),
    ProfilePage(),
    // htmlPage(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: Divider.createBorderSide(context),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          items: [
            _buildBottomNavigationBarItem('assets/Vector.png', "Dashboard", 0),
            _buildBottomNavigationBarItem('assets/Vector-1.png', "Courses", 1),
            _buildBottomNavigationBarItem(
                'assets/Vector-2.png', "Resources", 2),
            _buildBottomNavigationBarItem('assets/Vector-3.png', "Profile", 3),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.amber,
            width: 2,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => htmlPage(
                      url: '',
                    )),
          );
        },
        backgroundColor: Color(0xffeca731),
        child: Image.asset(
          'assets/Menu.png',
          height: 52,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String assetPath, String label, int index) {
    return BottomNavigationBarItem(
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                _selectedTab == index ? Color(0xffeca731) : Colors.black,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                assetPath,
                width: 24, // Adjust the size as needed
                height: 24, // Adjust the size as needed
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: _selectedTab == index ? Color(0xffeca731) : Colors.black,
              ),
            ),
            Visibility(
              visible: _selectedTab == index,
              child: Container(
                  height: 4,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Color(0xffeca731),
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ],
        ),
        label:
            '' // We don't need a label here as it's included in the custom widget
        );
  }
}
