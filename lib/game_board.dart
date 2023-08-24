import 'package:flutter/material.dart';
import 'package:xadrezapp/components/piece.dart';
import 'package:xadrezapp/components/piece.dart';
import 'package:xadrezapp/components/squere.dart';
import 'package:xadrezapp/values/colors.dart';

import 'components/piece.dart';
import 'helper/helper_method.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  late List<List<ChassPiece?>> board;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initializeBord();
  }

  void _initializeBord() {
    List<List<ChassPiece?>> newBoard = List.generate(
      8,
      (index) => List.generate(8, (index) => null),
    );

    for (int i = 0; i < 8; i++) {
      newBoard[1][i] = ChassPiece(
        type: ChassPieceType.pawn,
        isWhite: true,
        imagePath: 'lib/images/pawn.png',
      );

      newBoard[6][i] = ChassPiece(
        type: ChassPieceType.pawn,
        isWhite: false,
        imagePath: 'lib/images/pawn.png',
      );
    }

    board = newBoard;
  }

//  ChassPiece myPawn = ChassPiece(
  //     type: ChassPieceType.blackPeon,
  //     isWhite: false,
  //     imagePath: 'lib/images/whitePawn.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroudColor,
      body: GridView.builder(
        itemCount: 8 * 8,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
        itemBuilder: (context, index) {
          int row = index ~/ 8;
          int col = index % 8;

          return Squere(
            isWhite: isWhite(index),
            piece: board[row][col],
          );
        },
      ),
    );
  }
}
