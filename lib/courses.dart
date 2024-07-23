import 'package:startupculture/courses/business.dart';
import 'package:flutter/material.dart';
import 'package:startupculture/homepage.dart';

import 'courses/startup.dart';

class Course {
  final String title;
  final String icon;
  final Widget page;

  Course(this.title, this.icon, this.page);
}

// ignore: camel_case_types
class coursesPage extends StatefulWidget {
  final int totalScore;
  const coursesPage({super.key, required this.totalScore});

  @override
  State<coursesPage> createState() => _coursesPageState();
}

// ignore: camel_case_types
class _coursesPageState extends State<coursesPage> {
  final List<Course> courses = [
    Course(
        'Startup',
        'https://www.veritis.com/wp-content/uploads/2020/05/how-devops-helps-startups-veritis.jpg',
        AboutCourseStartup(
          image:
              'https://www.veritis.com/wp-content/uploads/2020/05/how-devops-helps-startups-veritis.jpg',
               modules: const [],
        )),
    Course(
        'Business',
        'https://img.freepik.com/free-photo/business-person-futuristic-business-environment_23-2150970181.jpg',
        AboutCourseBusiness(
            image:
                'https://img.freepik.com/free-photo/business-person-futuristic-business-environment_23-2150970181.jpg')),
    // Add more courses here if needed
  ];

  List<Course> getFilteredCourses(int totalScore) {
    if (totalScore >= 7) {
      return courses.where((course) => course.title == 'Startup').toList();
    } else {
      return courses.where((course) => course.title == 'Business').toList();
    }
  }

  late List<Course> filteredCourses = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      filteredCourses = getFilteredCourses(widget.totalScore);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffeca731),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const homePage(),
              ),
            );
          },
        ),
        title: const Text(
          'Courses',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xfffdfdfd)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: filteredCourses.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Number of columns, adjust as needed
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 5 / 4, // Adjust as needed
          ),
          itemBuilder: (context, index) {
            final course = filteredCourses[index];
            return _buildCourseCard(course);
          },
        ),
      ),
    );
  }

  Widget _buildCourseCard(Course course) {
    return Container(
        height: 500,
        decoration: BoxDecoration(
          color: const Color(0xffD9D9D9),
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
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(course.icon), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(course.title,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  ElevatedButton(
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => course.page),
                          ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            const Color(0xffeca731)),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                      ),
                      child: const Center(
                          child: Text(
                        'Enroll Now',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )))
                ],
              ),
            )
          ],
        ));
  }
}
