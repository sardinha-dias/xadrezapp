import 'package:flutter/material.dart';
import 'package:xadrezapp/components/piece.dart';
import 'package:xadrezapp/values/colors.dart';

class Squere extends StatelessWidget {
  final bool isWhite;

  final ChassPiece? piece;
  final bool isSelected;
  final bool isValidMove;
  final void Function()? onTap;

  const Squere({
    super.key,
    required this.isWhite,
    required this.piece,
    required this.isSelected,
    required this.isValidMove,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color? squareColor;

    if (isSelected) {
      squareColor = Colors.green;
    } else if (isValidMove) {
      squareColor = Colors.green[200];
    } else {
      squareColor = isWhite ? foregraudColor : backgroudColor;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,
        child: piece != null
            ? Image.asset(
                piece!.imagePath,
                color: piece!.isWhite ? Colors.white : Colors.black,
              )
            : null,
      ),
    );
  }
}
