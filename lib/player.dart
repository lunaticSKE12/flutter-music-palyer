import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
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
      ],
    );
  }
}
