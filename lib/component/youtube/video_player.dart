import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  // const videoUrl = 'https://www.youtube.com/watch?v=hP25aVmxkP8';

  final _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=hP25aVmxkP8")!,
      flags: YoutubePlayerFlags(autoPlay: false, loop: false));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        topActions: [
          const SizedBox(width: 8.0),
          Text(_controller.metadata.title)
        ],
      ),
    );
  }
}
