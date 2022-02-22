import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  final String music;
  Player({required this.music});
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  void init() {
    assetsAudioPlayer.open(Audio("assets/${widget.music}"), autoStart: false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.music);
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
              '0.0',
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
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.play_arrow,
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
