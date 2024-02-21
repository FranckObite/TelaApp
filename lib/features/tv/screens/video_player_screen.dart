import 'package:flutter/material.dart';
import 'package:tela_mobile/common/theme/app_font.dart';
import 'package:tela_mobile/common/theme/pallete.dart';
import 'package:tela_mobile/constant/api_keys.dart';
import 'package:tela_mobile/services/youtube_live_api.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../models/channel.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  static const String routeName = "/live-player";

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final String videoAssetPath = "assets/videos/video.mp4";

  bool isLoading = true;
  bool isLive = false;
  Channel? customChannel;
  late YoutubePlayerController controller;
  late String currentLiveTitle;

  @override
  void initState() {
    super.initState();
    initChannel();
  }

  initChannel() async {
    Channel channel = await YoutubeLiveApi.youtubeLiveApi
        .fetchChannel(channelId: ApiKeys.channelId);

    setState(() {
      customChannel = channel;
      isLoading = false;
      isLive = channel.videos![0].title!.contains("live") ||
          channel.videos![0].title!.contains("direct");
    });

    if (isLive) {
      controller = YoutubePlayerController(
        initialVideoId: channel.videos![0].id!,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
        ),
      );
    }

    // print(customChannel!.videos![0].title);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: !isLive ? Pallete.whiteColor : Colors.black,
      appBar: AppBar(
          title: Text(
        'Tela Original',
        style: AppFont.appBarTextStyle(),
      )),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Pallete.gradientSecondColor,
              ),
            )
          : isLive
              ? Center(child: YoutubePlayer(controller: controller))
              : Center(
                  child: Text(
                    "Aucune émission en direct pour l'instant",
                    textAlign: TextAlign.center,
                    style: AppFont.font().copyWith(fontSize: 18),
                  ),
                ),
    );
  }
}
