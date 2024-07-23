// ignore_for_file: camel_case_types, use_super_parameters, library_private_types_in_public_api, prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables, must_be_immutable, collection_methods_unrelated_type
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:startupculture/courses/htmlmodel.dart';

class htmlPage extends StatefulWidget {
  final String url;

  const htmlPage({Key? key, required this.url}) : super(key: key);

  @override
  _htmlPageState createState() => _htmlPageState();
}

class _htmlPageState extends State<htmlPage> {
  late YoutubePlayerController _controller;
  int totalVideos = HtmlModel.VideoList.length; // Total number of videos
  int videosWatched = 0; // Number of videos watched
  bool courseCompleted = false;
  late List<HtmlModel> filteredVideos;
  late int length;
  Duration lastPosition = Duration.zero;

  @override
  void initState() {
    super.initState();
    // Initialize the YoutubePlayerController
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
        HtmlModel.VideoList.first.url!,
      )!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        disableDragSeek: true,
      ),
    );
    // Filter videos based on the passed URL
    filterlist(widget.url);

    // Add listener to monitor video position
    _controller.addListener(_videoListener);
  }

  void _videoListener() {
    final currentPosition = _controller.value.position;
    if (currentPosition > lastPosition + Duration(seconds: 2)) {
      // User tried to seek forward
      _controller.seekTo(lastPosition);
    } else {
      // Update the last known position if playing normally
      lastPosition = currentPosition;
    }
  }

  void filterlist(String query) {
    int a = 0;
    for (var i = 0; i < HtmlModel.VideoList.length; i++) {
      if (HtmlModel.VideoList[i].tittle?.trim().toLowerCase() ==
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
    _controller.removeListener(_videoListener);
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

  void _navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xfffdfdfd)),
        title: Text(
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
                  _navigateBack(context); // Automatically navigate back
                });
              },
            ),
            LinearProgressIndicator(
              value: calculateProgress() / 100,
              backgroundColor: Color(0xffeca731),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xffeca731)),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: HtmlModel.VideoList[index].thumbnail,
                  title: Text(HtmlModel.VideoList[index].tittle!,
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                  onTap: () {
                    setState(() {
                      String? videoId = YoutubePlayer.convertUrlToId(
                        HtmlModel.VideoList[index].url!,
                      );
                      _controller.load(videoId!);
                      lastPosition = Duration.zero; // Reset lastPosition for the selected video
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
                    SnackBar(
                      content: Text('Viewing Certificate'),
                    ),
                  );
                },
                child: Text('View Certificate'),
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
        child: Icon(Icons.percent),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('length', length));
  }
}