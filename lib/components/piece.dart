enum ChassPieceType { pawn, rook, knight, bishop, queen, king }

class ChassPiece {
  final ChassPieceType type;
  final bool isWhite;
  final String imagePath;

  ChassPiece({
    required this.type,
    required this.isWhite,
    required this.imagePath,
  });
}
