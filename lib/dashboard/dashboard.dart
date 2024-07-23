// ignore_for_file: must_be_immutable, use_build_context_synchronously, avoid_print, prefer_typing_uninitialized_variables, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:startupculture/auth/login.dart';
import '../form/fetch.dart';
import '../main.dart';

List leaderboard = [];
int score = 0;
bool _isLoading = false;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/Vector 1.png',
                          width: double.infinity,
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
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Dashboard',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        ClipRect(
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8.0),
                                      child: CircularPercentIndicator(
                                        animation: true,
                                        animationDuration: 2000,
                                        radius: 70, // Reduced radius
                                        lineWidth: 22,
                                        percent: score == null
                                            ? 0
                                            : score / 100, // Example percentage
                                        progressColor: Colors.amber,
                                        backgroundColor: Colors.white,
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        center: Text(
                                          score == null ? '0' : "$score%",
                                          style: const TextStyle(
                                              fontSize:
                                                  20), // Reduced font size
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Good',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      'Course Completion',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Credit Score',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/Star.gif',
                                          ),
                                          Text(
                                            score == null ? '0' : '$score/100',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Leader Board',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    ClipRect(
                      child: Column(
                        children: [
                          ClipRect(
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: SizedBox(
                                height: 570,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: leaderboard.length,
                                  itemBuilder: (context, index) {
                                    final item = leaderboard[index];
                                    return Container(
                                      width: 150, // Adjust the width as needed
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: LeaderboardTile(
                                        rank: index + 1,
                                        name: item['Name'] ?? 'User',
                                        points: item['Credits'] ?? '0',
                                        isHighlighted:
                                            item['id'] == userDataFetcher['id'],
                                        index: index,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class LeaderProfile extends StatelessWidget {
  LeaderProfile({
    super.key,
    required this.text,
  });
  var text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 4,
        ),
      ),
      child: Column(
        // alignment: Alignment.bottomCenter,
        children: [
          Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber[100],
              ),
              child: Center(
                  child: Text(
                userDataFetcher['Name'] ?? 'User'.substring(0, 1),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ))),
          Container(
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 8,
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LeaderboardTile extends StatelessWidget {
  final int rank;
  final String name;
  final int points;
  final bool isHighlighted;
  final int index;

  const LeaderboardTile({
    super.key,
    required this.rank,
    required this.name,
    required this.points,
    this.isHighlighted = false,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isHighlighted ? Colors.amber : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: ListTile(
        leading: Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber[100],
            ),
            child: Center(
                child: Text(
              leaderboard[index]['Name'].substring(0, 1),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ))),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text(''),
        trailing: Text('$points pts',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        dense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ),
    );
  }
}
