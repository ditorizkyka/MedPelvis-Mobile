import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({
    super.key,
    required YoutubePlayerController youtubePlayerController,
  }) : _youtubePlayerController = youtubePlayerController;

  final YoutubePlayerController _youtubePlayerController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.green,
          width: MediaQuery.of(context).size.width,
          child: YoutubePlayer(
            controller: _youtubePlayerController,
            showVideoProgressIndicator: true,
          ),
        ),
      ],
    );
  }
}
