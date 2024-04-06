import 'package:flutter/material.dart';
import 'package:simple_chess_board/models/piece_type.dart';
import 'package:simple_chess_board/models/short_move.dart';
import 'package:simple_chess_board/widgets/chessboard.dart';

import 'chessConfig.dart';

class MyChessBoardPage extends StatelessWidget {
  final String fen;
  //const MyChessBoardPage({super.key});
  const MyChessBoardPage({required this.fen, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MyChessBoard(fen: fen);
  }
}
