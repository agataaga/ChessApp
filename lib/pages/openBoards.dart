import 'package:flutter/material.dart';
import 'package:world_clock/pages/home.dart';
import 'package:world_clock/chessRelated/chessboardPage.dart';


class BoardView extends StatefulWidget {
  const BoardView({super.key});

  @override
  State<BoardView> createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BoardSetup? setup = ModalRoute.of(context)!.settings.arguments as BoardSetup?;

    if(setup != null) {
      return Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            title: Text('chosen board set-up'),
            centerTitle: true,
            elevation: 0,
          ),

          body: Center(
              child: Column(
                children: [
                  SizedBox(height:30),
                  Text(
                    'FEN Code:',
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    setup.fenCode ?? '',
                    style: TextStyle(
                      color: Colors.deepPurple[400],
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 400,
                    height: 400,
                    color: Colors.grey,
                    child: MyChessBoardPage(
                      fen: setup.fenCode ?? 'i dont understand null safety !!!!',
                    ),
                  ),
                ],
              )
          )
      );
    }
    else {
      return Text(
        'Error: Invalid BoardSetup data',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }
}
