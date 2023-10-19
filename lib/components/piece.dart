enum ChessPieceType { pawn, rook, knight, bishop, king, queen }

class ChessPiece {
  final ChessPieceType type;
  final bool isWhite;
  final String imagePath;
  ChessPiece({
    required this.type,
    required this.isWhite,
    required this.imagePath,
  });
}
