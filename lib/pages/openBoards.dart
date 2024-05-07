import 'package:flutter/material.dart';
import 'package:world_clock/pages/home.dart';
import 'package:world_clock/chessRelated/chessboardPage.dart';
import 'package:world_clock/chessRelated/fenCodes.dart'; // Import your FenCode model
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoardView extends StatefulWidget {
  const BoardView({super.key});
  @override
  State<BoardView> createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  late bool isDone;
  bool _isChecked = false;
  String? fenCode;

  void loadData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      isDone = prefs.getBool("${fenCode}") ?? false;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BoardSetup? chessData = ModalRoute.of(context)!.settings.arguments as BoardSetup?;
    if (chessData != null){

    fenCode = chessData.fenCode;
    }

    if(chessData != null) {
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
                    chessData.fenCode,
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
                      fen: chessData.fenCode ?? '',
                    ),
                  ),

                  CheckboxListTile(
                    title: Text(
                        "Is the task done?",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20,
                      )
                    ),
                    value: isDone,
                    onChanged: (newValue) async {
                     updateData();
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
  void updateData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDone = !isDone;
      prefs.setBool("${fenCode}", isDone);
  });
  }
}


