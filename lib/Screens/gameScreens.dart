import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String Winner = '';//keeps record of the winner to update score
  
  int boxesChecked = 0;
  int Oscore = 0;
  int Xscore = 0;
  String resultDeclaration = '';
  bool Oturn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text(
          "TIC TAC TOE",
          style: GoogleFonts.coiny(
            textStyle: TextStyle(
              fontSize: 40,
              color: Colors.yellow[500],
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "PLAYER O",
                            style: GoogleFonts.coiny(
                              textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            Oscore.toString(),
                            style: GoogleFonts.coiny(
                              textStyle: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "PLAYER X",
                            style: GoogleFonts.coiny(
                              textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            Xscore.toString(),
                            style: GoogleFonts.coiny(
                              textStyle: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.yellow[400],
                          border: Border.all(
                            width: 5,
                            color: Colors.redAccent,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: GoogleFonts.coiny(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  resultDeclaration,
                  style: GoogleFonts.coiny(
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  restartGame();
                },
                child: Text(
                  "START AGAIN",
                  style: GoogleFonts.coiny(
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[500],
                  padding: EdgeInsets.all(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void tapped(int index) {
    setState(() {
      if (Oturn && displayXO[index] == '') {
        displayXO[index] = "O";
      } else if (!Oturn && displayXO[index] == '') {
        displayXO[index] = "X";
      }
    });
    Oturn = !Oturn;
    checkWinner();
  }

  void checkWinner() {
    if ((displayXO[0] == displayXO[1]) &&
        (displayXO[0] == displayXO[2]) &&
        displayXO[0] != '') {
      resultDeclaration = 'PLAYER ' + displayXO[0] + " WON";
      Winner = displayXO[0].toString();
      updateScore();
    } //ROW 1
    if ((displayXO[3] == displayXO[4]) &&
        (displayXO[3] == displayXO[5]) &&
        displayXO[3] != '') {
      resultDeclaration = 'PLAYER ' + displayXO[3] + " WON";
      Winner = displayXO[3].toString();
      updateScore();
    } //ROW 2
    if ((displayXO[6] == displayXO[7]) &&
        (displayXO[6] == displayXO[8]) &&
        displayXO[6] != '') {
      resultDeclaration = 'PLAYER ' + displayXO[6] + " WON";
      Winner = displayXO[6].toString();
      updateScore();
    } //ROW3
    if ((displayXO[0] == displayXO[3]) &&
        (displayXO[0] == displayXO[6]) &&
        displayXO[0] != '') {
      resultDeclaration = 'PLAYER ' + displayXO[0] + " WON";
      Winner = displayXO[0].toString();
      updateScore();
    } //COL1
    if ((displayXO[1] == displayXO[4]) &&
        (displayXO[1] == displayXO[7]) &&
        displayXO[1] != '') {
      resultDeclaration = 'PLAYER ' + displayXO[1] + " WON";
      Winner = displayXO[1].toString();
      updateScore();
    } //COL2
    if ((displayXO[2] == displayXO[5]) &&
        (displayXO[2] == displayXO[8]) &&
        displayXO[2] != '') {
      resultDeclaration = 'PLAYER ' + displayXO[2] + " WON";
      Winner = displayXO[2].toString();
      updateScore();
    } //COL3
    if ((displayXO[0] == displayXO[4]) &&
        (displayXO[0] == displayXO[8]) &&
        displayXO[0] != '') {
      resultDeclaration = 'PLAYER ' + displayXO[0] + " WON";
      Winner = displayXO[0].toString();
      updateScore();
    } //DIAG 1
    if ((displayXO[2] == displayXO[4]) &&
        (displayXO[2] == displayXO[6]) &&
        displayXO[2] != '') {
      resultDeclaration = 'PLAYER ' + displayXO[2] + " WON";
      Winner = displayXO[2].toString();
      updateScore();
    } //DIAG 2
  }

  void restartGame() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
    });
    Oturn = true;
  }

  void updateScore() {
    setState(() {
      if (Winner == "O") {
        Oscore++;
      } else if (Winner == "X") {
        Xscore++;
      }
    });
  }
}
