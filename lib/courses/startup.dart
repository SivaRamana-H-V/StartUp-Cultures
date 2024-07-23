// ignore_for_file: camel_case_types, use_super_parameters, library_private_types_in_public_api, prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables, must_be_immutable, collection_methods_unrelated_type
import 'package:flutter/material.dart';
import 'package:startupculture/courses/htmlmodel.dart';

import 'html.dart';

class AboutCourseStartup extends StatefulWidget {
  var image;
  List<Map<String, dynamic>> modules;
  AboutCourseStartup({super.key, this.image, required this.modules});

  @override
  State<AboutCourseStartup> createState() => _AboutCourseStartupState();
}

class _AboutCourseStartupState extends State<AboutCourseStartup> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: widget.image != null
              ? Image.network(widget.image, fit: BoxFit.cover)
              : Icon(Icons.image),
          leading: IconButton(
            icon: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(Icons.arrow_back)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Icon(Icons.share))),
            IconButton(
              icon: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(Icons.bookmark_border_outlined)),
              onPressed: () {},
            ),
          ],
          toolbarHeight: 290,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Column(
                  children: const [
                    Row(
                      children: [
                        Text(
                          'StartUp',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                        SizedBox(
                          width: 170,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 30,
                        ),
                        Text(
                          '4.5 Reviews',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20),
                        Icon(Icons.person, color: Colors.grey, size: 25),
                        SizedBox(width: 5),
                        Text('StartUp Culture',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            )),
                        SizedBox(width: 40),
                        Icon(Icons.play_circle_fill_sharp,
                            color: Colors.grey, size: 25),
                        SizedBox(width: 5),
                        Text('12 Modules',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            )),
                      ],
                    ),
                    TabBar(
                      tabs: [
                        Tab(text: 'About'),
                        Tab(text: 'Modules'),
                      ],
                      labelStyle: TextStyle(
                        color: Colors.amber,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      unselectedLabelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      indicatorColor: Colors.amber,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 5.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(children: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'About this course',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'The Startup Essentials course provides aspiring entrepreneurs with the knowledge and tools to launch and grow successful startups. Learn key aspects of ideation, business planning, funding, and scaling to turn your innovative ideas into reality.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: ModulesList(),
          ),
        ]),
      ),
    );
  }
}

class ModulesList extends StatefulWidget {
  const ModulesList({super.key});
  @override
  State<ModulesList> createState() => _ModulesListState();
}

class _ModulesListState extends State<ModulesList> {
  final List<Map<String, dynamic>> modules = [
    {
      "title": "M1 Deciding to start the Startup",
      "duration": "20 Min",
      "lessons": [
        {
          "C": 1,
          // "title": "Should You start the Startup ",
          "title": "Introduction",
          "time": "10:00",
          "icon": Icons.play_arrow,
          "completed": true,
        },
        {
          "C": 2,
          // "title": "Why not to Start the Startup",
          "title": "Startup",
          "time": "05:00",
          "icon": Icons.play_arrow,
          "completed": false,
        },
        {
          "C": 3,
          // "title": " Before the Startup",
          "title": "Where to get the problem",
          "time": "05:00",
          "icon": Icons.play_arrow,
          "completed": false,
        },
      ]
    },
    {
      "title": "M2  Evaluate the startup Idea",
      "duration": "40 Min",
      "lessons": [
        {
          "C": 1,
          // "title": " Where do Great Startup Ideas Come From?",
          "title": "How to validate the idea",
          "time": "10:00",
          "icon": Icons.play_arrow,
          "completed": false,
        },
        {
          "C": 2,
          // "title": "How to Get and Evaluate Startup Ideas ",
          "title": "Initial Customers",
          "time": "15:00",
          "icon": Icons.play_arrow,
          "completed": false,
        },
        {
          "C": 3,
          // "title": " Pivoting out of a Tarpit Idea",
          "title": "MVP",
          "time": "15:00",
          "icon": Icons.play_arrow,
          "completed": false,
        },
      ]
    },
    {
      "title": "M3  Building the Team",
      "duration": "40 Min",
      "lessons": [
        {
          "C": 1,
          "title": "Co-Founder Matching ",
          "time": "10:00",
          "icon": Icons.play_arrow,
          "completed": false,
        },
        {
          "C": 2,
          "title": "Co-FounderMistakes that kill companies & How to avoid them",
          "time": "15:00",
          "icon": Icons.play_arrow,
          "completed": false,
        },
        {
          "C": 3,
          "title": "How to Split Equity Among C0-Founders",
          "time": "15:00",
          "icon": Icons.play_arrow,
          "completed": false,
        },
      ]
    },
    {
      "title": "M4  Towards Innovation",
      "duration": "40 Min",
      "lessons": [
        {
          "C": 1,
          "title": "Innovation and types of innovation",
          "time": "10:00",
          "icon": Icons.play_arrow,
          "completed": false,
        },
        {
          "C": 2,
          "title": "Product Design ",
          "time": "15:00",
          "icon": Icons.play_arrow,
          "completed": false,
        },
        {
          "C": 3,
          "title": "Developement - Google course",
          "time": "15:00",
          "icon": Icons.play_arrow,
          "completed": false,
        },
      ]
    },
  ];

  void markLessonAsCompleted(int moduleIndex, int lessonIndex) {
    setState(() {
      if (lessonIndex + 1 == 3) {
        if (moduleIndex + 1 == 4) {
          return;
        }
        lessonIndex = 0;
        modules[moduleIndex + 1]['lessons'][lessonIndex]['completed'] = true;
      } else {
        modules[moduleIndex]['lessons'][lessonIndex + 1]['completed'] = true;
      }
    });
  }

  void navigateToHtmlPage(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => htmlPage(url: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: modules.length,
      itemBuilder: (context, moduleIndex) {
        final module = modules[moduleIndex];
        return ModuleCard(
          moduleIndex: moduleIndex,
          title: module["title"],
          duration: module["duration"],
          lessons: module["lessons"],
          markLessonAsCompleted: markLessonAsCompleted,
        );
      },
    );
  }
}

class ModuleCard extends StatelessWidget {
  final String title;
  final String duration;
  final List<Map<String, dynamic>> lessons;

  final int moduleIndex;
  final Function(int, int) markLessonAsCompleted;

  ModuleCard({
    super.key,
    required this.title,
    required this.duration,
    required this.lessons,
    required this.moduleIndex,
    required this.markLessonAsCompleted,
  });

  final List<Map<String, dynamic>> quiz = [
    {
      "type": "multiple_choice",
      "question":
          "When considering starting a startup, what is equally as important as having a good idea?",
      "options": [
        "A) Having a detailed business plan",
        "B) A large market that can support growth",
        "C) Previous startup experience",
        "D) Advanced technical skills"
      ],
      "answer": "B) A large market that can support growth"
    },
    {
      "type": "true_false",
      "question":
          "Even if a startup fails, the experience gained can be more valuable than traditional employment.",
      "answer": "True"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  duration,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            Divider(),
            ...lessons.asMap().entries.map((entry) {
              int lessonIndex = entry.key;
              Map<String, dynamic> lesson = entry.value;
              return LessonTile(
                lessonIndex: lessonIndex,
                lesson,
                moduleIndex: moduleIndex,
                markLessonAsCompleted: markLessonAsCompleted,
              );
            }),
            Divider(),
            Text(
              'Quiz',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: lessons[2]['completed']
                  ? Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ...quiz.asMap().entries.map(
                            (entry) {
                              Map<String, dynamic> question = entry.value;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    question['question'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  if (question['type'] == 'multiple_choice')
                                    ...question['options'].map((option) {
                                      return RadioListTile(
                                        title: Text(option),
                                        value: option,
                                        groupValue: null,
                                        onChanged: (value) {},
                                      );
                                    }),
                                  if (question['type'] == 'true_false')
                                    ...['True', 'False'].map((option) {
                                      return RadioListTile(
                                        title: Text(option),
                                        value: option,
                                        groupValue: null,
                                        onChanged: (value) {},
                                      );
                                    }),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Answer: ${question['answer']}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Divider(),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Please complete the lessons to unlock the quiz',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonTile extends StatefulWidget {
  final Map<String, dynamic> lesson;
  final int moduleIndex;
  final int lessonIndex;
  final Function(int, int) markLessonAsCompleted;
  const LessonTile(
    this.lesson, {
    super.key,
    required this.moduleIndex,
    required this.lessonIndex,
    required this.markLessonAsCompleted,
  });

  @override
  State<LessonTile> createState() => _LessonTileState();
}

class _LessonTileState extends State<LessonTile> {
  @override
  Widget build(BuildContext context) {
    final int index = HtmlModel.VideoList.indexWhere((video) =>
        video.tittle?.trim().toLowerCase() ==
        widget.lesson['title'].trim().toLowerCase());
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      leading: CircleAvatar(
        backgroundColor: Colors.orange,
        child: Text(
          widget.lesson['C'].toString(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(widget.lesson['title']),
      subtitle: Text(widget.lesson['time']),
      trailing: _getTrailingIcon(index),
    );
  }

  Widget _getTrailingIcon(int index) {
    if (widget.lesson['completed']) {
      return IconButton(
        icon: Icon(
          Icons.play_arrow,
          color: Colors.orange,
          size: 30.0,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => htmlPage(url: widget.lesson['title']),
            ),
          );
          Future.delayed(Duration(seconds: 2), () {
            widget.markLessonAsCompleted(
                widget.moduleIndex, widget.lessonIndex);
          });
        },
      );
    } else {
      return Icon(Icons.lock);
    }
  }
}
