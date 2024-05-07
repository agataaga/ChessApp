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
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> _isDone;

  bool _isChecked = false;
  //bool isDone = false;
  String? fenCode;

  Future<void> _changeValue() async {
    final SharedPreferences prefs = await _prefs;
    //final bool? isDone = (prefs.getBool('isDone'));
    bool? c = prefs.getBool('isDone');
    final bool? isDone;
    if (c!= null){
      isDone= !c;
      print("isDone: ");
      print(isDone);
    }
    else{isDone = false;}



    setState(() {
      _isDone = prefs.setBool('isDone', isDone!).then((bool success) {
        print("set state val");
        print(_isDone);
        return _isDone;
      });
    });
  }


  @override
  void initState() {
    super.initState();
    _isDone = _prefs.then((SharedPreferences prefs){
      return prefs.getBool('isDone')?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final BoardSetup? chessData = ModalRoute.of(context)!.settings.arguments as BoardSetup?;
    if (chessData != null){
    //isDone = chessData.isDone ?? false;
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
          floatingActionButton: FloatingActionButton(
              onPressed: _changeValue,
              tooltip: 'Is the task done?',
              child: const Icon(
                  Icons.check_box_outline_blank
              )
          ),


          body: Center(
              child: Column(
                children: [
                  FutureBuilder<bool>(
                    future: _isDone,
                    builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
                      switch(snapshot.connectionState){
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return const CircularProgressIndicator();
                        case ConnectionState.active:
                        case ConnectionState.done:
                          if (snapshot.hasError){
                      return Text ('Error: ${snapshot.error}');
                      }
                          else {
                            print("wyniki:");
                            print(snapshot.data);
                            return Text(
                                "the task i ${snapshot.data}"
                            );
                              //print(snapshot.data);

                          }

                      }
                    },

                  ),

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

                  // CheckboxListTile(
                  //   title: Text(
                  //       "Is the task done?",
                  //     style: TextStyle(
                  //       color: Colors.deepPurple,
                  //       fontSize: 20,
                  //     )
                  //   ),
                  //   value: false,
                  //   onChanged: (newValue) async {
                  //     _changeValue(newValue!);
                  //   },
                  // ),
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
