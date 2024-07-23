// ignore_for_file: unnecessary_import, camel_case_types, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'dartmodel.dart';

class javaPage extends StatefulWidget {
  final String title;
  const javaPage({super.key, required this.title});

  @override
  State<javaPage> createState() => _javaPageState();
}

class _javaPageState extends State<javaPage> {
  String? url;
  late YoutubePlayerController _controller;
  int totalVideos = DartModel.VideoList.length; // Total number of videos
  int videosWatched = 0; // Number of videos watched
  bool courseCompleted = false;
  late List<DartModel> filteredVideos;
  late int length;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
        DartModel.VideoList.first.url!,
      )!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    // Filter videos based on the passed URL
    filterlist(widget.title);
  }

  void filterlist(String query) {
    int a = 0;
    for (var i = 0; i < DartModel.VideoList.length; i++) {
      if (DartModel.VideoList[i].tittle?.trim().toLowerCase() ==
          query.trim().toLowerCase()) {
        a = a + i + 1;
      }
    }
    setState(() {
      length = a;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double calculateProgress() {
    return (videosWatched / totalVideos) * 100;
  }

  void generateCertificate() {
    // Generate certificate with user's name
    print('Certificate generated for User');
    setState(() {
      courseCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
        title: const Text(
          'Course 1',
          style: TextStyle(color: Color(0xfffdfdfd)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onEnded: (_) {
                setState(() {
                  videosWatched++;
                  if (videosWatched == totalVideos) {
                    generateCertificate();
                  }
                });
              },
            ),
            LinearProgressIndicator(
              value: calculateProgress() / 100,
              backgroundColor: const Color(0xffeca731),
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Color(0xffeca731)),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // itemCount: HtmlModel.VideoList.length,
              itemCount: length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(DartModel.VideoList[index].thumbnail ?? ''),
                  title: Text(DartModel.VideoList[index].tittle!,
                      style:
                          const TextStyle(fontSize: 15, color: Colors.black)),
                  onTap: () {
                    setState(() {
                      String? videoId = YoutubePlayer.convertUrlToId(
                        DartModel.VideoList[index].url!,
                      );
                      _controller.load(videoId!);
                    });
                  },
                );
              },
            ),
            if (courseCompleted)
              ElevatedButton(
                onPressed: () {
                  // Handle viewing the certificate
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Viewing Certificate'),
                    ),
                  );
                },
                child: const Text('View Certificate'),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Course Progress: ${calculateProgress().toStringAsFixed(2)}%',
              ),
            ),
          );
        },
        child: const Icon(Icons.percent),
      ),
    );
  }
}
