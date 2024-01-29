import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Xylophone App'),
        ),
        body: SafeArea(
          child: XylophoneApp(),
        ),
      ),
    );
  }
}

class XylophoneApp extends StatelessWidget {
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  final List<String> notes = [
    'note1.wav',
    'note2.wav',
    'note3.wav',
    'note4.wav',
    'note5.wav',
    'note6.wav',
    'note7.wav',
  ];

  Future<void> playAudio(int number) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$number.wav')); //note2.wav
  }

  Widget buildKey(int keyIndex) {
    return Expanded(
      child: MaterialButton(
        color: colors[keyIndex],
        onPressed: () {
          playAudio(keyIndex + 1);
        },
        child: const Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (int i = 0; i < colors.length; i++) buildKey(i),
      ],
    );
  }
}
