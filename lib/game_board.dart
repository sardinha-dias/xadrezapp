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

  ChassPiece? selectedPiece;
  int selectedCol = -1;

  int selectedRow = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initializeBord();
  }

  void pieceSelected(int row, int col) {
    setState(() {
      if (board[row][col] != null) {
        selectedPiece = board[row][col];
        selectedCol = col;
        selectedRow = row;
      }
    });
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

    newBoard[0][0] = ChassPiece(
      type: ChassPieceType.rook,
      isWhite: true,
      imagePath: 'lib/images/rook.png',
    );
    newBoard[0][7] = ChassPiece(
      type: ChassPieceType.rook,
      isWhite: true,
      imagePath: 'lib/images/rook.png',
    );
    newBoard[7][0] = ChassPiece(
      type: ChassPieceType.rook,
      isWhite: false,
      imagePath: 'lib/images/rook.png',
    );
    newBoard[7][7] = ChassPiece(
      type: ChassPieceType.rook,
      isWhite: false,
      imagePath: 'lib/images/rook.png',
    );
    newBoard[0][1] = ChassPiece(
      type: ChassPieceType.knight,
      isWhite: true,
      imagePath: 'lib/images/knight.png',
    );
    newBoard[0][6] = ChassPiece(
      type: ChassPieceType.knight,
      isWhite: true,
      imagePath: 'lib/images/knight.png',
    );
    newBoard[7][1] = ChassPiece(
      type: ChassPieceType.knight,
      isWhite: false,
      imagePath: 'lib/images/knight.png',
    );
    newBoard[7][6] = ChassPiece(
      type: ChassPieceType.knight,
      isWhite: false,
      imagePath: 'lib/images/knight.png',
    );
    newBoard[0][2] = ChassPiece(
      type: ChassPieceType.bishop,
      isWhite: true,
      imagePath: 'lib/images/bishop.png',
    );
    newBoard[0][5] = ChassPiece(
      type: ChassPieceType.bishop,
      isWhite: true,
      imagePath: 'lib/images/bishop.png',
    );
    newBoard[7][2] = ChassPiece(
      type: ChassPieceType.bishop,
      isWhite: false,
      imagePath: 'lib/images/bishop.png',
    );
    newBoard[7][5] = ChassPiece(
      type: ChassPieceType.bishop,
      isWhite: false,
      imagePath: 'lib/images/bishop.png',
    );
    newBoard[0][4] = ChassPiece(
      type: ChassPieceType.queen,
      isWhite: true,
      imagePath: 'lib/images/queen.png',
    );
    newBoard[7][4] = ChassPiece(
      type: ChassPieceType.queen,
      isWhite: false,
      imagePath: 'lib/images/queen.png',
    );

    newBoard[0][3] = ChassPiece(
      type: ChassPieceType.king,
      isWhite: true,
      imagePath: 'lib/images/king.png',
    );

    newBoard[7][3] = ChassPiece(
      type: ChassPieceType.king,
      isWhite: false,
      imagePath: 'lib/images/king.png',
    );

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
          bool isSelected = selectedRow == row && selectedCol == col;
          return Squere(
            isWhite: isWhite(index),
            piece: board[row][col],
            isSelected: isSelected,
            onTap: () => pieceSelected(row, col),
          );
        },
      ),
    );
  }
}
