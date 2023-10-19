import 'package:chess/components/piece.dart';
import 'package:flutter/material.dart';

class Square extends StatefulWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelect;
  final Function()? onTap;
  const Square({super.key, required this.isWhite, this.piece, required this.isSelect, required this.onTap});

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  Widget build(BuildContext context) {
    Color? squareColor;
    if (widget.isSelect == true) {
      squareColor = Colors.green;
    }
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: widget.isSelect
            ? squareColor
            : widget.isWhite
                ? Colors.grey[350]
                : Colors.grey[500],
        child: widget.piece != null
            ? Image.asset(
                widget.piece!.imagePath,
                color: widget.piece!.isWhite ? Colors.white : Colors.black,
              )
            : null,
      ),
    );
  }
}
