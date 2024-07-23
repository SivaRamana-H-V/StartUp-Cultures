// ignore_for_file: unnecessary_import, camel_case_types, avoid_print

import 'package:startupculture/courses/jsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class jsPage extends StatefulWidget {
  const jsPage({super.key});

  @override
  State<jsPage> createState() => _jsPageState();
}

class _jsPageState extends State<jsPage> {
  String? url;
  late YoutubePlayerController _controller;
  String? videoId = YoutubePlayer.convertUrlToId(
      "https://youtu.be/ajdRvxDWH4w?si=NZgMFm2UWgpVyv3R");
//
  @override
  void initState() {
    super.initState();
    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );
    } else {
      print("video id is null");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("url of current videl $url");
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xfffdfdfd)),
        title: Text(
          'JS Course',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: jsModel.VideoList.length,
                itemBuilder: (ctx, i) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        String? videoId = YoutubePlayer.convertUrlToId(
                            jsModel.VideoList[i].url!);

                        _controller.load(videoId!);
                      });
                    },
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: Image.asset(
                        jsModel.VideoList[i].thumbnail!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        jsModel.VideoList[i].tittle!,
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
