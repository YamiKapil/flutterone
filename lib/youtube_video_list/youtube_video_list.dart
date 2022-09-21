import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoList extends StatelessWidget {
  const YoutubeVideoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List _youtube = [
      'https://www.youtube.com/watch?v=aWzlQ2N6qqg',
      'https://www.youtube.com/watch?v=SNV7364Rm70',
      'https://www.youtube.com/watch?v=iVlI8A1GKlE',
      'https://www.youtube.com/watch?v=PkLzRnfB4Vw',
      'https://www.youtube.com/watch?v=aWzlQ2N6qqg',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
      ),
      body: Column(
        children: [
          // const Text(
          //   'Youtube video list',
          //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          // ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _youtube.length,
              itemBuilder: (context, index) {
                String videoId;
                videoId = YoutubePlayer.convertUrlToId(_youtube[index])!;

                YoutubePlayerController _controller = YoutubePlayerController(
                  initialVideoId: videoId,
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                    disableDragSeek: false,
                  ),
                );
                return Card(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: YoutubePlayer(
                      controller: _controller,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
