import 'package:flutter/foundation.dart';

class FenCode {
  final String fenCode;
  final String level;
  final String move;
  bool isDone;

  FenCode({
    required this.fenCode,
    required this.level,
    required this.move,
    this.isDone = false,
  });
}
class FenCodes {
  static List <FenCode> codes = [
    FenCode(
      fenCode: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
      level: 'Beginner',
      move: 'black',
      isDone: false,
    ),
    FenCode(
      fenCode: 'k5n1/4PP1P/5p2/p2NP3/4p3/K1bp2Pb/5Q2/8 w - - 0 1',
      level: 'Intermediate',
      move: 'white',
      isDone: false,
    ),
    FenCode(
      fenCode: '1k5n/pp5r/3Kp2p/4p1P1/5b2/7N/2Pp1p2/n7 w - - 0 1',
      level: 'Advanced',
      move: 'black',
      isDone: false,
    ),
    FenCode(
      fenCode: '1b6/2PP4/1p1P1P2/2Rn2K1/4p3/5b2/1p2k1p1/3N2Q1 w - - 0 1',
      level: 'Expert',
      move: 'white',
      isDone: false,
    ),
  ];
}