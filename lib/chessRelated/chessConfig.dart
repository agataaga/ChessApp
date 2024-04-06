import 'package:flutter/material.dart';
import 'package:simple_chess_board/simple_chess_board.dart';

class MyChessBoard extends StatelessWidget {
  final String fen;
 //const MyChessBoard({required this.fen, super.key});
  const MyChessBoard({required this.fen, Key? key}) : super(key: key);


  void tryMakingMove({required ShortMove move}) {}

  Future<PieceType?> handlePromotion(BuildContext context) async {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SimpleChessBoard(
      chessBoardColors: ChessBoardColors(),
      engineThinking: false,
      fen: fen,
      onMove: tryMakingMove,
      blackSideAtBottom: false,
      whitePlayerType: PlayerType.computer,
      blackPlayerType: PlayerType.computer,
      lastMoveToHighlight: null,
      onPromote: () => handlePromotion(context),
      onPromotionCommited: ({
        required ShortMove moveDone,
        required PieceType pieceType,
      }) {},
    );
  }
}