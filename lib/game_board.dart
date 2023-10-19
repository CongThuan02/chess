import 'package:chess/components/piece.dart';
import 'package:chess/components/square.dart';
import 'package:chess/value/colors.dart';
import 'package:flutter/material.dart';

import 'helper/helper_methods.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  ChessPiece? selectChessPiece;
  int selectedRow = -1;
  int selectedCol = -1;
  void pieceSelected(
    int col,
    int row,
  ) {
    setState(() {
      if (board[col][row] != null) {
        selectChessPiece = board[row][col];
        selectedRow = row;
        selectedCol = col;
      }
    });
  }

  late List<List<ChessPiece?>> board;
  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    List<List<ChessPiece?>> newBoard = List.generate(8, (index) => List.generate(8, (index) => null));
    //place pawns
    for (int i = 0; i < 8; i++) {
      newBoard[1][i] = ChessPiece(imagePath: 'lib/images/pawn.png', isWhite: true, type: ChessPieceType.pawn);
    }
    for (int i = 0; i < 8; i++) {
      newBoard[6][i] = ChessPiece(imagePath: 'lib/images/pawn.png', isWhite: false, type: ChessPieceType.pawn);
    }
    //place pawns

    newBoard[0][0] = ChessPiece(imagePath: 'lib/images/rook.png', isWhite: true, type: ChessPieceType.rook);
    newBoard[0][7] = ChessPiece(imagePath: 'lib/images/rook.png', isWhite: true, type: ChessPieceType.rook);
    newBoard[7][0] = ChessPiece(imagePath: 'lib/images/rook.png', isWhite: false, type: ChessPieceType.rook);
    newBoard[7][7] = ChessPiece(imagePath: 'lib/images/rook.png', isWhite: false, type: ChessPieceType.rook);
    //place pawns
    newBoard[0][1] = ChessPiece(imagePath: 'lib/images/knight.png', isWhite: true, type: ChessPieceType.knight);
    newBoard[0][6] = ChessPiece(imagePath: 'lib/images/knight.png', isWhite: true, type: ChessPieceType.knight);
    newBoard[7][1] = ChessPiece(imagePath: 'lib/images/knight.png', isWhite: false, type: ChessPieceType.knight);
    newBoard[7][6] = ChessPiece(imagePath: 'lib/images/knight.png', isWhite: false, type: ChessPieceType.knight);
    //place pishop
    newBoard[0][2] = ChessPiece(imagePath: 'lib/images/bishop.png', isWhite: true, type: ChessPieceType.bishop);
    newBoard[0][5] = ChessPiece(imagePath: 'lib/images/bishop.png', isWhite: true, type: ChessPieceType.bishop);
    newBoard[7][2] = ChessPiece(imagePath: 'lib/images/bishop.png', isWhite: false, type: ChessPieceType.bishop);
    newBoard[7][5] = ChessPiece(imagePath: 'lib/images/bishop.png', isWhite: false, type: ChessPieceType.bishop);
    //place queen
    newBoard[0][4] = ChessPiece(imagePath: 'lib/images/queen.png', isWhite: true, type: ChessPieceType.queen);
    newBoard[0][3] = ChessPiece(imagePath: 'lib/images/king.png', isWhite: true, type: ChessPieceType.king);
    newBoard[7][4] = ChessPiece(imagePath: 'lib/images/queen.png', isWhite: false, type: ChessPieceType.queen);
    newBoard[7][3] = ChessPiece(imagePath: 'lib/images/king.png', isWhite: false, type: ChessPieceType.king);

    board = newBoard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: GridView.builder(
          itemCount: 64,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
          itemBuilder: (context, index) {
            int row = index ~/ 8;
            int col = index % 8;
            bool isSelected = selectedRow == row && selectedCol == col;
            return Square(
              isWhite: isWhite(index),
              piece: board[row][col],
              isSelect: isSelected,
              onTap: () {
                return pieceSelected(col, row);
              },
            );
          },
        ),
      ),
    );
  }
}
