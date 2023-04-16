import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
 
class ChessboardWidget extends StatefulWidget {
  const ChessboardWidget({super.key});

  @override
  State<ChessboardWidget> createState() => _ChessboardState();
}

class _ChessboardState extends State<ChessboardWidget> {
   ChessBoardController controller = ChessBoardController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
      child:
      ListView(
        children: [
         
          const SizedBox(height: 20),
          // chessboard
       ChessBoard(
          controller: controller,
          boardColor: BoardColor.orange,
          boardOrientation: PlayerColor.white, 
           
            
    ),
    const SizedBox(height: 20),
    // undo button
    ElevatedButton(
      onPressed: () {
        controller.undoMove();
      },
      child: const Text('UNDO'),
    ),
    // restart button
    ElevatedButton(
      onPressed: () {
        controller.resetBoard();
      },
      child: const Text('RESTART'),
    ),
        ],
    
            
    ),
      ),
     
    );
  }
}