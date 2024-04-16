import 'package:flutter/material.dart';
import 'package:world_clock/pages/openBoards.dart';

import 'package:world_clock/pages/home.dart';
import 'chessRelated/chessboardPage.dart';

void main() => runApp(MaterialApp(initialRoute: '/home', routes: {
      '/': (context) => Home(),
      '/home': (context) => Home(),
      '/boards': (context) => BoardView(),
    }));
