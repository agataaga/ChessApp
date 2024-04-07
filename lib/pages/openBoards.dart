import 'package:flutter/material.dart';
import 'package:world_clock/pages/home.dart';
import 'package:world_clock/chessRelated/chessboardPage.dart';
import 'package:world_clock/chessRelated/fenCodes.dart'; // Import your FenCode model


class BoardView extends StatefulWidget {
  const BoardView({super.key});

  @override
  State<BoardView> createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  bool isDone = false;
  String? fenCode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BoardSetup? shit = ModalRoute.of(context)!.settings.arguments as BoardSetup?;
    if (shit != null){
    isDone = shit.isDone ?? false;
    fenCode = shit.fenCode;
    }

    if(shit != null) {
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
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25.0,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    shit.fenCode,
                    style: TextStyle(
                      color: Colors.deepPurple[400],
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 400,
                    height: 400,
                    color: Colors.grey,
                    child: MyChessBoardPage(
                      fen: shit.fenCode ?? '',
                    ),
                  ),
                  SizedBox(height:20),
                  CheckboxListTile(
                    title: Text(
                        "Is the task done?",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20,
                      )
                    ),
                    value: isDone,
                    onChanged: (newValue) {
                      setState(() {
                        isDone = newValue ?? false;
                        if (newValue != null) {
                          final index = FenCodes.codes.indexWhere((code) =>
                          code.fenCode == fenCode);
                          if (index != -1) {
                            FenCodes.codes[index].isDone =
                                newValue;
                            shit.isDone= isDone;// Update the FenCode's isDone property
                          };
                        };
                      });
                    },
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
