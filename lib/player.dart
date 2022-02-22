import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  final String music;
  Player({required this.music});
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  Duration duration = Duration();
  Duration position = Duration();

  bool isPlaying = false;

  final assetsAudioPlayer = AssetsAudioPlayer();

  void play() {
    assetsAudioPlayer.play();
    setState(() {
      isPlaying = true;
    });
  }

  void stop() {
    assetsAudioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  void init() async {
    await assetsAudioPlayer.open(
      Audio("assets/${widget.music}"),
      autoStart: false,
    );
    duration = assetsAudioPlayer.current.value!.audio.duration;
    print(duration);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.music);
    return Column(
      children: [
        Slider(
          activeColor: Colors.amber,
          thumbColor: Colors.red,
          inactiveColor: Colors.grey.withOpacity(0.2),
          value: 10,
          max: 100,
          onChanged: (double value) {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '0.0',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              '${duration.inMinutes} : ${duration.inSeconds.remainder(60)}',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              iconSize: 50,
              color: Colors.white,
              onPressed: () {},
              icon: Icon(Icons.skip_previous),
            ),
            ClipOval(
              child: Material(
                color: Colors.grey.withOpacity(0.2),
                child: InkWell(
                  splashColor: Colors.blue,
                  onTap: () {
                    isPlaying ? stop() : play();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 62,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              iconSize: 50,
              color: Colors.white,
              onPressed: () {},
              icon: Icon(Icons.skip_next),
            ),
          ],
        ),
      ],
    );
  }
}
