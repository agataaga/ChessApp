import 'package:flutter/material.dart';
import 'package:world_clock/pages/openBoards.dart';
import 'package:world_clock/pages/loading.dart';
import 'package:world_clock/pages/home.dart';
import 'chessRelated/chessboardPage.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/boards': (context) => BoardView(),
  }
));
