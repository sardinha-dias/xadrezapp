import 'package:flutter/material.dart';
import 'package:xadrezapp/components/piece.dart';
import 'package:xadrezapp/values/colors.dart';

class Squere extends StatelessWidget {
  final bool isWhite;

  final ChassPiece? piece;

  const Squere({super.key, required this.isWhite, required this.piece});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isWhite ? foregraudColor : backgroudColor,
      child: piece != null
          ? Image.asset(
              piece!.imagePath,
              color: piece!.isWhite ? Colors.white : Colors.black,
            )
          : null,
    );
  }
}
