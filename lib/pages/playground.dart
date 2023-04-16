import 'package:flutter/material.dart';
import 'package:mychess/util/chessboard.dart';

class PlaygroundPage extends StatefulWidget {
  const PlaygroundPage({super.key});

  @override
  State<PlaygroundPage> createState() => _PlaygroundPageState();
}

class _PlaygroundPageState extends State<PlaygroundPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: ChessboardWidget(),
    ));
  }
}
