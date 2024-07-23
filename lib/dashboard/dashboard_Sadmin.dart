// ignore_for_file: must_be_immutable, use_build_context_synchronously, avoid_print, prefer_typing_uninitialized_variables, unnecessary_null_comparison, file_names

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Add this line to import the necessary package
import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:startupculture/auth/login.dart';
import '../form/fetch.dart';
import '../main.dart';

List leaderboard = [];
// Define the 'attendanceData' variable
List<BarChartGroupData> attendanceData = [
  BarChartGroupData(
    x: 0,
    barRods: [
      BarChartRodData(
        color: Colors.amber,
        toY: 5,
      ),
    ],
  ),
  BarChartGroupData(
    x: 1,
    barRods: [
      BarChartRodData(
        color: Colors.amber,
        toY: 8,
      ),
    ],
  ),
  BarChartGroupData(
    x: 2,
    barRods: [
      BarChartRodData(
        color: Colors.amber,
        toY: 3,
      ),
    ],
  ),
  BarChartGroupData(
    x: 3,
    barRods: [
      BarChartRodData(
        color: Colors.amber,
        toY: 10,
      ),
    ],
  ),
];

int score = 0;
bool _isLoading = false;

class DashboardSAdmin extends StatefulWidget {
  const DashboardSAdmin({super.key});

  @override
  State<DashboardSAdmin> createState() => _DashboardSAdminState();
}

class _DashboardSAdminState extends State<DashboardSAdmin> {
  @override
  void initState() {
    super.initState();
    _getLeaderboard();
  }

  Future<void> logout(BuildContext context) async {
    await supabase.auth.signOut();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  Future<void> _getLeaderboard() async {
    setState(() {
      _isLoading = true;
    });
    final response = await supabase.from('leader_board').select();
    final data = await supabase.from('leader_board').select('*');
    for (var i in data) {
      if (i['id'] == userid) {
        setState(() {
          score = i['Credits'];
        });
      }
    }
    setState(() {
      leaderboard = response;
      leaderboard.sort((a, b) => b['Credits'].compareTo(a['Credits']));
      _isLoading = false;
    });
  }

  Future<void> _refreshPage() async {
    await _getLeaderboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Startup Culture',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [Icon(Icons.notifications_active), SizedBox(width: 20)],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xffeca731),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Align(
                      alignment: Alignment.centerLeft, child: ProfileLable()),
                  const SizedBox(width: 6),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userDataFetcher['Name'] ?? 'User',
                      ),
                      Text(
                        userDataFetcher['Email'],
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Logout'),
                          content:
                              const Text('Are you sure you want to logout?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                logout(context);
                              },
                              child: const Text('Logout'),
                            ),
                          ],
                        );
                      });
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: _refreshPage,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/Vector 1.png',
                          fit: BoxFit.fitWidth,
                        ),
                        const Positioned(
                          top: 20,
                          left: 20,
                          child: Text(
                            'Welcome!',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Positioned(
                            top: 70, left: 30, child: ProfileLable()),
                        Positioned(
                          top: 80,
                          left: 120,
                          child: Text(
                            userDataFetcher['Name'] ?? 'User',
                          ),
                        ),
                        Positioned(
                          top: 105,
                          left: 110,
                          child: Text(
                            'ID: $userID',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8.0),
                      children: [
                        statCard("Total Colleges", 210, Icons.school),
                        statCard("Total Students", 5850, Icons.people),
                        statCard("Total Mentors", 210, Icons.person),
                        statCard("Total Courses", 2, Icons.book),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 200,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            barGroups: attendanceData,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircularPercentIndicator(
                        radius: 100.0,
                        lineWidth: 13.0,
                        animation: true,
                        percent:
                            0.5, // This should be calculated based on actual data
                        center: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total Students"),
                            Text(
                              "1,234",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            Text("Male / Female"),
                          ],
                        ),
                        footer: const Text("Male / Female"),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget statCard(String title, int value, IconData icon) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.amber),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              value.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
