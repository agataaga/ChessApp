import 'package:flutter/material.dart';
import 'package:simple_chess_board/models/board_arrow.dart';
import 'package:chess/chess.dart' as chesslib;
import 'package:simple_chess_board/simple_chess_board.dart';
import 'package:world_clock/chessRelated/chessConfig.dart';
import 'package:world_clock/chessRelated/chessboardPage.dart';
import 'package:world_clock/chessRelated/fenCodes.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('FEN Codes'),
        ),
        body: ListView.builder(
          itemCount: FenCodes.codes.length,
          itemBuilder: (context, index) {
            final code = FenCodes.codes[index];
            return buildFenCodeContainer(code, context);
          },
        ),
    );
  }

  Widget buildFenCodeContainer(FenCode code, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 200,
            width: 200,
            color: Colors.grey,
            child: MyChessBoardPage(fen: code.fenCode),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Level:',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  letterSpacing: 2.0,
                  fontSize: 18.0,
                ),
              ),
              Text(
                code.level,
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  letterSpacing: 2.0,
                  fontSize: 18.0,
                ),
              ),
              Text(
                'Move: ${code.move}',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  letterSpacing: 2.0,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  BoardSetup setup = BoardSetup(
                    fenCode: code.fenCode,
                    isDone: code.isDone,
                  );
                  Navigator.pushNamed(context, '/boards', arguments: setup);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.flutter_dash), // Chess icon
                    SizedBox(width: 10), // Add spacing between icon and text
                    Text('View Board'), // Button text
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BoardSetup {
  final String fenCode;
  bool isDone;

  BoardSetup({
    required this.fenCode,
    required this.isDone,
  });
}


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.grey[900],
//       body: SafeArea(
//         child: Column(
//           children: <Widget> [
//             const SizedBox(height: 10),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                   "Browse current chess set-ups:",
//                 style: TextStyle(
//                   color: Colors.deepPurpleAccent,
//                   letterSpacing: 2.0,
//                   fontSize: 18.0,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30.0),
//             Container(
//               width: double.infinity,
//               margin: const EdgeInsets.all(15.0),
//               padding: const EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.grey,
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     height:200,
//                     width:200,
//                     color: Colors.grey,
//                     child: const MyChessBoardPage(
//                       fen: FenCodes.badPosition,
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                           "Level: ",
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.deepPurpleAccent,
//                             letterSpacing: 2.0,
//                             fontSize: 18.0,)
//
//                       ),
//                       Text(
//                           "advanced",
//                           style: TextStyle(
//                           color: Colors.deepPurple[400],
//                           fontSize: 15.0,)
//                       ),
//                      const Text(
//                           "Move: ",
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.deepPurpleAccent,
//                             letterSpacing: 2.0,
//                             fontSize: 18.0,)
//                       ),
//                       Text(
//                           "black",
//                           style: TextStyle(
//                             color: Colors.deepPurple[400],
//                             fontSize: 15.0,)
//                       ),
//                       SizedBox(height: 20),
//                       TextButton(
//                           onPressed: (){
//                             BoardSetup setup = BoardSetup(
//                               fenCode: FenCodes.badPosition,
//                             );
//                             Navigator.pushNamed(context, '/boards', arguments: setup);
//                           },
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(Icons.flutter_dash), // Chess icon
//                             SizedBox(width: 10), // Add spacing between icon and text
//                             Text('View Board'), // Button text
//                           ],
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ]
//         )
//       )
//     );
//   }
// }
// // Define a class to represent the data to pass to OpenBoardPage
// class BoardSetup {
//   final String? fenCode;
//   BoardSetup({
//     required this.fenCode,
//   });
// }