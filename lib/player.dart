import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  final String music;
  final Function changeMusic;
  Player({required this.music, required this.changeMusic});
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

  void pause() {
    assetsAudioPlayer.pause();
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
    // print(duration);

    assetsAudioPlayer.currentPosition.listen((event) {
      // print(event);
      setState(() {
        position = event;
      });
    });
  }

  void seeking(int sec) {
    setState(() {
      position = Duration(seconds: sec);
    });

    assetsAudioPlayer.seek(position);
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
          value: position.inSeconds.toDouble(),
          max: duration.inSeconds.toDouble(),
          onChanged: (double value) {
            seeking(value.toInt());
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${position.inMinutes}:${position.inSeconds.remainder(60)}',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              '${duration.inMinutes}:${duration.inSeconds.remainder(60)}',
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
              onPressed: () => widget.changeMusic(),
              icon: Icon(Icons.skip_previous),
            ),
            ClipOval(
              child: Material(
                color: Colors.grey.withOpacity(0.2),
                child: InkWell(
                  splashColor: Colors.blue,
                  onTap: () {
                    isPlaying ? pause() : play();
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
              onPressed: () => widget.changeMusic(),
              icon: Icon(Icons.skip_next),
            ),
          ],
        ),
      ],
    );
  }
}
