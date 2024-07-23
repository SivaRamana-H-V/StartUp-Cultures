// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable, non_constant_identifier_names, avoid_print
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HtmlModel {
  Icon? thumbnail;
  String? url;
  String? tittle;
  HtmlModel({
    this.thumbnail,
    this.url,
    this.tittle,
  });

  static List<HtmlModel> VideoList = [
    HtmlModel(
        thumbnail: const Icon(Icons.video_collection_outlined),
        url: "https://www.youtube.com/watch?v=SqCnZVoP0_g",
        // tittle: "Should You start the Startup"),
        tittle: "Introduction"),
    HtmlModel(
        thumbnail: const Icon(Icons.video_collection_outlined),
        url: "https://youtu.be/o2Cp4iQu7tM",
        // tittle: "Why not to Start the Startup"
        tittle: "Startup"),
    HtmlModel(
        thumbnail: const Icon(Icons.video_collection_outlined),
        url: "https://youtu.be/pgMEX_wTbvc",
        // tittle: "Before the Startup"
        tittle: "Where to get the problem"),
    HtmlModel(
        thumbnail: const Icon(Icons.video_collection_outlined),
        url: "https://youtu.be/n-S4fIoyDsI",
        // tittle: "Where do Great Startup Ideas Come From?"
        tittle: "How to validate the idea"),
    HtmlModel(
        thumbnail: const Icon(Icons.video_collection_outlined),
        url: "https://youtu.be/BJ7pCZqVRQE",
        // tittle: "How to Get and Evaluate Startup Ideas"
        tittle: "Initial Customers"),
    HtmlModel(
        thumbnail: const Icon(Icons.video_collection_outlined),
        url: "https://youtu.be/EUgzeqjV_lQ",
        // tittle: " Pivoting out of a Tarpit Idea"
        tittle: "MVP"),
    HtmlModel(
        thumbnail: const Icon(Icons.video_collection_outlined),
        url: "https://youtu.be/m517nhfYHz4?si=7WKUw7H5otNQF2yg",
        tittle: " Co-Founder Matching"),
    HtmlModel(
        thumbnail: const Icon(Icons.video_collection_outlined),
        url: "https://youtu.be/dV4L2sbeRf4?si=-NyBdwD8pnpjYFEt",
        tittle: "Co-FounderMistakes that kill companies & How to avoid them"),
    HtmlModel(
        thumbnail: const Icon(Icons.video_collection_outlined),
        url: "https://youtu.be/SzLN30vg4mg?si=U_CvkKRFbuQtZG1B",
        tittle: " How to Split Equity Among C0-Founders"),
    HtmlModel(
        thumbnail: const Icon(Icons.video_collection_outlined),
        url: "https://youtu.be/fPx-vYh-F7E?si=rr0MFp9Efqs5VW9C",
        tittle: "Innovation and types of innovation"),
    HtmlModel(
        thumbnail: const Icon(Icons.video_collection_outlined),
        url: "https://youtu.be/hT0b_y8u9Qg?si=mkqWLJU6om9AeByI",
        tittle: "Product Design"),
    HtmlModel(
        thumbnail: const Icon(Icons.video_collection_outlined),
        url: "https://youtu.be/mcCSbHGG-eY?si=9TDv_-HAvrRWi_a0",
        tittle: "Developement - Google course"),
  ];

  static getVideoId(String s) {
    print("url ofnyoutube $s");
    String? videoId = YoutubePlayer.convertUrlToId(s);
    return s;
  }
}
