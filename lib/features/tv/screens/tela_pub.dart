import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../common/theme/pallete.dart';

class TelaPubScreen extends StatefulWidget {
  const TelaPubScreen({super.key});
  static const String routeName = "/tela-pub";

  @override
  State<TelaPubScreen> createState() => _TelaPubScreenState();
}

class _TelaPubScreenState extends State<TelaPubScreen> {
  late VideoPlayerController controller;
  Color color = Colors.transparent;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
        'https://telacici.com/Pub_video/PUB_PARTIE1.mp4');

    controller.addListener(() {
      setState(() {});
    });
    controller.setLooping(true);
    controller.initialize().then((_) => setState(() {}));
    controller.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 100,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                  backgroundColor: Pallete.gradientFirstColor,
                  radius: 40,
                  child: Text(
                    "Tela \nPub ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
        body: Center(
            child: controller.value.isInitialized
                ? Stack(alignment: Alignment.center, children: [
                    InkWell(
                      onTap: () {
                        controller.value.isPlaying
                            ? controller.pause()
                            : controller.play();
                      },
                      child: AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: VideoPlayer(
                          controller,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.value.isPlaying
                            ? controller.pause()
                            : controller.play();
                      },
                      icon: Icon(
                        Icons.play_arrow,
                        color: controller.value.isPlaying
                            ? Colors.transparent
                            : Colors.black,
                        size: 80,
                      ),
                    ),
                    //VideoProgressIndicator(controller, allowScrubbing: true),
                  ])
                : const CircularProgressIndicator()));
  }
}
